local factoryUtils = require 'factoryUtils'
--
local displayUtils = require 'displayUtils'
--

getRecipeFor = "basic Assembly Line M"
makeQty = 1
sortedNeededIds = nil
gatheredData = {}
neededInputs = nil
primaryItemId = nil

local program = {}

function program.init()
    program.storage_databank = factoryUtils.getMainStorage()
end

function program.timerImpl(self, timerId)
    if timerId == "getInputsNeeded" then
        program.getInputsNeeded()
    end 
end

function program.getInputsNeeded()
    if neededInputs == nil then
        local result = factoryUtils.retreiveSearchResult(program.storage_databank, unit)
        if result == nil then
            factoryUtils.queueSearch(program.storage_databank, unit, "searchByName", getRecipeFor)
            system.print("waiting for query result")
            return false
        end
        if not result.success then
            system.print(string.format("search result failed. result: %s", json.encode(result)))
            unit.exit()
        end
        primaryItemId = result.data.id
        neededInputs = factoryUtils.gatherRequiredItems{itemId=result.data.id}
    end
    
    if sortedNeededIds == nil then
        sortedNeededIds = {}
        for itemId, itemInfo in pairs(neededInputs) do
            table.insert(sortedNeededIds, itemId)
        end
        table.sort(sortedNeededIds)
    end

    for _, itemId in ipairs(sortedNeededIds) do
        if gatheredData[itemId] == nil then
            local result = factoryUtils.retreiveSearchResult(program.storage_databank, unit)
            if result == nil then
                factoryUtils.queueSearch(program.storage_databank, unit, "searchById", itemId)
                system.print(string.format("searching for information on id `%s`", itemId))
                return false
            end
            if not result.success then
                system.print(string.format("search result failed. result: %s", json.encode(result)))
                unit.exit()
            end
            result.data.quantity = neededInputs[itemId].quantity
            result.data.recipeTime = neededInputs[itemId].recipeTime
            gatheredData[itemId] = result.data
        end
    end
    system.print(string.format("found all required items for %s", getRecipeFor))

    factoryUtils.populateQty(primaryItemId, makeQty, gatheredData)

    system.print(string.format("populated all needed data for %s", getRecipeFor))

    local facotryQueues = {}
    for itemId, itemInfo in pairs(gatheredData) do
        local factoryName = factoryUtils.itemInfoToFactoryName(itemInfo)
        if factoryName == nil then
            system.print(string.format("could not get factory for %s", itemInfo.itemLong))
            unit.exit()
        end
        system.print(string.format("factory name for %s is %s", itemInfo.itemLong, factoryName))
        gatheredData[itemId].factoryName = factoryName
        if facotryQueues[factoryName] == nil then
            facotryQueues[factoryName] = {
            }
        end
        table.insert(facotryQueues[factoryName], {itemId = itemId, quantity = itemInfo.quantity, recipeTime = itemInfo.createTime, factoryType = factoryName, batchSize = itemInfo.producedQty, numBatches = itemInfo.numBatches})
    end

    local ranPrintOnce = false
    for _, factoryDatabank in ipairs(factoryUtils.getDatabanksForFactories()) do
        system.print(string.format("clearing existing queue for databank %s", factoryDatabank.getName()))
        factoryDatabank.clear()
        for factoryName, factoryReq in pairs(facotryQueues) do
            if not ranPrintOnce then
                system.print(string.format("setting up factory queues for factory type %s", factoryName))
            end
            factoryUtils.queueFactoryRequest(factoryDatabank, factoryName, factoryReq)
        end
        ranPrintOnce = true
    end

    local screens = library.getLinksByClass('ScreenUnit', true)
    if not factoryUtils.isTableEmpty(screens) then
        system.print("found attached screen. displaying recipe information")
        local tbl = {}
        for itemId, data in factoryUtils.pairByType(gatheredData) do
            local itemInfo = system.getItem(itemId)
            table.insert(tbl, {itemInfo.displayNameWithSize, string.format("%.2f", data.quantity)})
        end
        displayUtils.writeOutputToScreens(tbl, screens)
    end


    system.print("successfully setup queues for all factories. stopping execution")
    unit.exit()
end

program.init()
unit:onEvent("onTimer", program.timerImpl, nil)
unit.setTimer("getInputsNeeded", 0.25)