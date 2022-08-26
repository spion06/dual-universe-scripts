local script = {}

script.FACTORY_NAMES = {
    ENDPRODUCT = {
        complex_name = "endProduct",
        product_name = "endProduct",
        matchName = "Assembly Line"
    },
    METALWORK = {
        complex_name = "metalwork_from_intermediate",
        product_name = "metalwork_from_product",
        name = "metalwork_from_product",
        matchName = "Metalwork Industry"
    },
    ELECTRONICS = {
        complex_name = "electronics_from_intermediate",
        product_name = "electronics_from_product",
        name = "electronics_from_product",
        matchName = "Electronics Industry"
    },
    REFINER = {
        complex_name = "refiner",
        product_name = "refiner",
        matchName = "Refiner"
    },
    SMELTER = {
        complex_name = "smelter",
        product_name = "smelter",
        matchName = "Smelter"
    },
    CHEMICAL_INDUSTRY = {
        complex_name = "chemical",
        product_name = "chemical",
        matchName = "Chemical Industry"
    }
}

script.TYPE_MAPPINGS = {
    complex_name = {
        "Complex Part",
        "Functional Part"
    },
    product_name = {
        "Intermediary Part",
        "Pure",
        "Product",
        "Structural Part"
    }
}

function script.itemInfoToFactoryName(itemInfo)
    if itemInfo.industry == "" then
        return ""
    end
    for factoryType, info in pairs(script.FACTORY_NAMES) do
        if string.match(itemInfo.industry, info.matchName) then
            if factoryType == "ENDPRODUCT" then
                return info.complex_name
            end
            for buildType, buildTypeMatch in pairs(script.TYPE_MAPPINGS) do
                if script.array_has_value(buildTypeMatch, itemInfo.type) then
                    return info[buildType]
                end
            end
        end
    end
    return nil
end

function script.mergeTables(t1, t2)
    for k,v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

-- getting the queue name for a factory
function script.getQueueKeyForFactory(element)
    for _, info in pairs(script.FACTORY_NAMES) do
        for k, nameType in pairs(info) do
            if k == "matchName" then
                goto continue
            end
            if string.match(string.lower(element.getName()), string.lower(nameType)) then
                return script.factoryQueueKey(nameType)
            end
            ::continue::
        end
    end
    return nil
end

function script.getDatabanksForFactories()
    local databanks = {}
    for linkName, element in pairs(library.getLinksByClass("DataBankUnit")) do
        if element.getName() == 'factory_storage' then
            table.insert(databanks, element)
        end
    end
    return databanks
end

function script.getLinkByPartialNameAndClass(linkClass, elementName)
    local matchedElements = {}
    for linkName, element in pairs(library.getLinksByClass(linkClass)) do
        if string.match(string.lower(element.getName()), string.lower(elementName)) then
            table.insert(matchedElements, element)
        end
    end
    return matchedElements
end

function script.getMainStorage()
    local storage_databank = script.getLinkByNameAndClass('DataBankUnit', 'main_storage')
    if storage_databank == nil then
        error("could not find databank named main_storage")
    end
    return storage_databank
end

function script.getLinkByNameAndClass(linkClass, elementName)
    for linkName, element in pairs(library.getLinksByClass(linkClass)) do
        if element.getName() == elementName then
            return element
        end
    end
end

function script.array_has_value(tbl, val)
    for _, value in ipairs(tbl) do
        if value == val then
            return true
        end
    end
    return false
end


function script.isTableEmpty(tbl)
    for _, _ in pairs(tbl) do
        return false
    end
    return true
end

function script.tableLenth(tbl)
    local tableLenth = 0
    for _, _ in pairs(tbl) do
        tableLenth = tableLenth + 1
    end
    return tableLenth
end

function script.joinTable(tbl, joinStr)
    local joinTbl = tbl
    local total_str = table.remove(joinTbl, 1)
    for _, item in ipairs(joinTbl) do
        total_str = string.format("%s%s%s", total_str, joinStr, item)
    end
    return total_str
end

-- takes recipes in the format contained in mergedRecipeInfo
function script.getIdByFullName(itemName, recipes)
    for _, vals in pairs(recipes) do
        if string.match(string.lower(vals.itemLong), string.lower(itemName)) then
            return vals.id
        end
    end
    return 0
end

function script.shouldStopForBuildMode(factory, buildMode, forceStop)
    if forceStop then
        return true
    end
    if buildMode == "maintain" then
        return false
    elseif buildMode == "maintainLight" then
        if factory.getState() == 5 then
            return true
        end
    elseif buildMode == "maintainAgressive" then
        if factory.getState() >= 5 then
            return true
        end
    elseif buildMode == "singleBatch" then
        return false
    end
    return false
end

-- to be passed to table.sort
function script.sortElementsByLocalId(e1, e2)
    return e1.getLocalId() < e2.getLocalId()
end

function script.sortByRecipeTime(e1, e2)
    return e1.recipeTime < e2.recipeTime
end

function script.sortByType(r1, r2)
    return r1.type < r2.type
end

function script.pairByType(tbl, sortFunc)
    local a = {}
    for id, data in pairs(tbl) do table.insert(a, {type=data.type, id=id}) end
    table.sort(a, script.sortByType)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
      i = i + 1
      if a[i] == nil then return nil
      else return a[i].id, tbl[a[i].id]
      end
    end
    return iter
  end

function script.searchDatabankKey(localId, reqOrResp)
    return string.format("search_%s_%d", reqOrResp, localId)
end

function script.queueSearch(databank, sourceElement, searchType, searchParams)
    local searchTable = {
        searchType = searchType,
        searchParams = searchParams,
        localId = sourceElement.getLocalId()
    }
    databank.setStringValue(script.searchDatabankKey(searchTable.localId, "request"), json.encode(searchTable))
end

function script.retreiveSearchResult(databank, sourceElement)
    local resultKey = script.searchDatabankKey(sourceElement.getLocalId(), "response")
    local requestKey = script.searchDatabankKey(sourceElement.getLocalId(), "request")
    local result = nil
    if databank.hasKey(resultKey) then
        result = json.decode(databank.getStringValue(resultKey))
        databank.clearValue(requestKey)
        databank.clearValue(resultKey)
    end
    return result
end

function script.factoryQueueKey(factoryName)
    return string.format("factory_queue_%s", factoryName)
end

function script.queueFactoryRequest(databank, factoryName, factoryReq)
    -- don't queue requests that don't have a factory name
    if factoryName == nil or factoryName == "" then
        return false
    end
    databank.setStringValue(script.factoryQueueKey(factoryName), json.encode(factoryReq))
end

function script.ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

function script.starts_with(str, start)
    return string.sub(str,1,string.len(start))==start
end

function script.getLowestTierRecipe(recipes)
    local lowest_tier = 100
    local target_recipe = {}
    for _, recipe in ipairs(recipes) do
        if recipe.tier < lowest_tier then
            lowest_tier = recipe.tier
            target_recipe = recipe
        end
    end
    return target_recipe
end

--[[ 
    this function simply gathers all required item ids and initalizes the object.
    this is only needed becuase searching has to happen separately and the recipes from the in-game api do not reliabily give the ingredients for use in a factory.
    may items only have recipes for the nanopack recipe which is NOT what this script is intended to calculate
]]--
function script.gatherRequiredItems(opt)
    if opt.gathered_items == nil then
        opt.gathered_items = {}
    end
    if opt.gathered_items[opt.itemId] == nil then
        opt.gathered_items[opt.itemId] = { }
    end
    local recipes = system.getRecipes(opt.itemId)
    if recipes[1] == nil then
        return opt.gathered_items
    end
    local lowestRecipe = script.getLowestTierRecipe(recipes)

    for _, item in ipairs(lowestRecipe.ingredients) do
        script.gatherRequiredItems{itemId=item.id,gathered_items=opt.gathered_items}
    end
    return opt.gathered_items
end

-- tables are passed by reference so pass the table to modify as second arg
-- this function assumes all the required items are already populated as table keys from gatherRequiredItems
function script.populateQtyInner(itemId, qty_needed, gathered_items)
    if gathered_items == nil then
        error("gathered_items is a required input")
    end
    if qty_needed == nil then
        qty_needed = 1
    end
    local ingredients = gathered_items[itemId].inputs
    if script.isTableEmpty(ingredients) then
        return gathered_items
    end
    
    -- this handles the parent item case where gathered_items isn't filled out because it's the first
    if gathered_items[itemId].quantity == nil then
        gathered_items[itemId].quantity = qty_needed
    end
    --local quantity = gathered_items[itemId].quantity

    local batchSize = gathered_items[itemId].producedQty
    if batchSize == nil then
        error(string.format("failed to find self id `%s` in product list. this shouldn't happen", itemId))
    end
    local batchRatio = qty_needed/batchSize

    gathered_items[itemId].batchSize = batchSize

    for inputId, inputQty in pairs(ingredients) do
        inputId = tonumber(inputId)
        local amountNeeded = inputQty * batchRatio
        if gathered_items[inputId].quantity == nil then
            gathered_items[inputId].quantity = amountNeeded
            -- this is needed to handle ores properly
            gathered_items[inputId].qtyAlt = {}
            gathered_items[inputId].qtyAlt[itemId] = {amount_needed=amountNeeded, inputBatch = inputQty}
        else
            gathered_items[inputId].quantity = amountNeeded + gathered_items[inputId].quantity

            -- this section is needed to handle ores properly
            if gathered_items[inputId].qtyAlt[itemId] == nil then
                gathered_items[inputId].qtyAlt[itemId] = {amount_needed=amountNeeded, inputBatch = inputQty}
            else
                gathered_items[inputId].qtyAlt[itemId].amount_needed = gathered_items[inputId].qtyAlt[itemId].amount_needed + amountNeeded
            end
        end
        script.populateQtyInner(inputId, amountNeeded, gathered_items)
    end
    return gathered_items
end

function script.populateQty(itemId, qty_needed, gathered_items)
    local gathered_items = script.populateQtyInner(itemId, qty_needed, gathered_items)
    for itemId, data in pairs(gathered_items) do
        -- ores don't have a batchSize and instead qty needs to be calulated based off the input requirements of the parent recipe
        -- this is because there is no recipe to "build" an ore.
        if data.batchSize == nil then
            local amountNeeded = 0
            for _, sdata in pairs(data.qtyAlt) do
                local remainder = sdata.amount_needed
                if remainder > sdata.inputBatch then
                    remainder = sdata.amount_needed % sdata.inputBatch
                end
                amountNeeded = amountNeeded + sdata.amount_needed + (sdata.inputBatch - remainder)
            end
            gathered_items[itemId].quantity = amountNeeded
            gathered_items[itemId].qtyAlt = nil
            goto continue
        end
        gathered_items[itemId].qtyAlt = nil
        local remainder = data.quantity
        if remainder > data.batchSize then
            remainder = data.quantity % data.batchSize
        end
        if remainder ~= 0 then
            local batchFillQty = data.batchSize - remainder
            local totalQty = data.quantity + batchFillQty
            gathered_items[itemId].quantity = totalQty
        end
        gathered_items[itemId].numBatches = gathered_items[itemId].quantity/data.batchSize
        ::continue::
    end

    return gathered_items
end

return script