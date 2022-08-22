
local mergedRecipeInfo = require 'mergedRecipeInfo'
--
local factoryUtils = require 'factoryUtils'
--

local program = {}
function program.init()
    program.storage_databank = factoryUtils.getMainStorage()
end

function program.timerImpl(self, timerId)
    if timerId == "searchTimer" then
        program.searchTimer()
    end 
end

function program.searchTimer()
    local searchReq = program.getNextSearchEvent()
    if searchReq == nil then
        return nil
    end
    program.handleSearchEvent(searchReq)
end

function program.getNextSearchEvent()
    local databankKeys = program.storage_databank.getKeyList()
    -- getting databank keys will return null sometimes. so just act like we didn't get anything if it does
    if databankKeys == nil then
        return nil
    end
    for _, bankKey in ipairs(databankKeys) do
        if factoryUtils.starts_with(bankKey, "search_request") then
            local searchReq = json.decode(program.storage_databank.getStringValue(bankKey))
            -- has key returns a 1 on success and 0 on failure (backwards i know). so bitflip to make it so success is true
            if ~ program.storage_databank.hasKey(factoryUtils.searchDatabankKey(searchReq.localId, "response")) then
                return searchReq
            end
        end
    end
    return nil
end

function program.buildSearchData(data, message)
    return {
        data = data,
        message = message
    }
end

function program.writeSearchResult(searchReq, data)
    local keyData = {
        data = data.data,
        success = data.data ~= nil,
        message = data.message
    }
    local resultKey = factoryUtils.searchDatabankKey(searchReq.localId, "response")
    program.storage_databank.setStringValue(resultKey, json.encode(keyData))
end

function program.handleSearchEvent(searchReq)
    local resultData = program.buildSearchData(nil, "invalid searchType")
    if searchReq.searchType == "searchByName" then
        resultData = program.searchByName(searchReq)
    elseif searchReq.searchType == "searchById" then
        resultData = program.searchById(searchReq)
    end
    program.writeSearchResult(searchReq, resultData)
end

function program.searchByName(searchReq)
    local searchFor = searchReq.searchParams
    local message = string.format("could not find item by name `%s`", searchFor)
    local data = nil
    for key, vals in pairs(mergedRecipeInfo) do
        if string.match(vals.itemLong, searchFor) then
            data = vals
            message = "found matching item"
            break
        end
    end
    return program.buildSearchData(data, message)
end

function program.searchById(searchReq)
    local searchFor = searchReq.searchParams
    local message = string.format("could not find item by id `%s`", searchFor)
    local data = mergedRecipeInfo[tonumber(searchReq.searchParams)]
    if data ~= nil then
        message = "found recipe id"
    end
    return program.buildSearchData(data, message)
end

program.init()
unit:onEvent("onTimer", program.timerImpl, nil)
unit.setTimer("searchTimer", 0.25)