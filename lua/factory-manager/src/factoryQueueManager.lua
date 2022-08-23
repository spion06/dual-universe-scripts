local factoryUtils = require 'factoryUtils'
--

local program = {}
factoryDatabanks = nil
itemsRan = {}
buildMode = "singleBatch"
forceRefreshFactories = true
local forceRefreshValidIdx = forceRefreshFactories
program.currentQueue = nil
program.refreshQueue = true

local validBuildModes = {
    "maintain", -- use maintain and do not reassign unless forceRefreshFactories is true. this mode will also throw an error if there is a insufficent number of factories
    "maintainLight", -- use maintain and only reassign if machine is in pending state
    "maintainAgressive", -- use maintain and reassign machines if they are blocked for any reason
    "singleBatch" -- only build enough for the target number of end product. then stop
}

function program.init()
    factoryDatabanks = factoryUtils.getDatabanksForFactories()
    table.sort(factoryDatabanks, factoryUtils.sortElementsByLocalId)
end

function program.addFactoryAssignment(buildAssignments, queueItem, factory)
    if buildAssignments == nil then
        buildAssignments = {}
    end
    if buildAssignments[queueItem.itemId] == nil then
        buildAssignments[queueItem.itemId] = {
            factories = {},
            queueItem = nil
        }
    end
    table.insert(buildAssignments[queueItem.itemId].factories, factory)
    buildAssignments[queueItem.itemId].queueItem = queueItem
    return buildAssignments
end

function program.buildValidQueueIdxs(queueInfo, currentInProgress, l_forceRefreshValidIdx)
    local validQueueIndexes = {}
    for idx, queueItem in ipairs(queueInfo.queue) do
        if l_forceRefreshValidIdx then
            table.insert(validQueueIndexes, idx)
            forceRefreshValidIdx = false
            goto continue
        end
        if not factoryUtils.array_has_value(queueInfo.inProgress, queueItem.itemId) and not factoryUtils.array_has_value(currentInProgress, tonumber(queueItem.itemId)) then
            table.insert(validQueueIndexes, idx)
        end
        ::continue::
    end
    return validQueueIndexes
end

function program.programFactories()
    local queueForRun = program.loadQueues()
    local continue_next_run = false
    local all_should_shutdown = {}
    local allQueuesCompleted = {}
    local buildAssignments = {} -- queueKey -> { itemid -> { factories={listOfElements}, queueItem={queueItem} }}
    local should_startup_factories = true
    for queueKey, queueInfo in pairs(queueForRun) do
        local idleFactories = {}
        local queueCompleted = false
        local currentInProgress = {}
        local should_shutdown = false
        local validItemIds = {}
        local queuedItems = {}
        local l_forceRefreshFactories = forceRefreshFactories
        local l_forceRefreshValidIdx = forceRefreshValidIdx
        

        for _, queueItem in ipairs(queueInfo.queue) do
            table.insert(validItemIds, queueItem.itemId)
        end

        for _, factory in ipairs(queueInfo.factories) do
            local currentOutput = factory.getOutputs()
            local currentItemId = 0
            if not factoryUtils.isTableEmpty(currentOutput) then
                currentItemId = currentOutput[1].id
                table.insert(currentInProgress, currentItemId)
            end
            -- only stop if pending. this will prevent from killing un-necissarily
            if factoryUtils.shouldStopForBuildMode(factory, buildMode, l_forceRefreshFactories) then
                factory.stop(true, false)
                continue_next_run = true
            end
            if continue_next_run then
                goto innercontinue
            end
            if factory.getState() == 1 then
                table.insert(idleFactories, factory)
            end
            ::innercontinue::
        end
        local numberOfAvailableFactories = factoryUtils.tableLenth(idleFactories)
        local validQueueIndexes = {}

        if continue_next_run then
            forceRefreshFactories = false
            goto outercontinue
        end

        table.sort(queueInfo.queue, factoryUtils.sortByRecipeTime)
        
        -- check for any items we've already queued 
        validQueueIndexes = program.buildValidQueueIdxs(queueInfo, currentInProgress, l_forceRefreshValidIdx)

        if factoryUtils.tableLenth(validQueueIndexes) < numberOfAvailableFactories and factoryUtils.array_has_value({"maintain"}, buildMode) then
            should_shutdown = true
            system.print(string.format("only have %d/%d of needed factories for queue %s. no assigning anything and shutting down", factoryUtils.tableLenth(validQueueIndexes), numberOfAvailableFactories, queueKey))
            system.print("if this isn't the behavior you want change the buildMode parameter")
            should_startup_factories = false
            goto outercontinue
        end

        if numberOfAvailableFactories == 0 and not factoryUtils.isTableEmpty(validQueueIndexes) then
            local itemNames = {}
            for _, queueIdx in ipairs(validQueueIndexes) do
                table.insert(itemNames, system.getItem(queueInfo.queue[queueIdx].itemId).displayNameWithSize)
            end
            system.print(string.format("need %s factories for queue %s. items: %s", factoryUtils.tableLenth(validQueueIndexes), queueKey, factoryUtils.joinTable(itemNames, ",")))
            goto outercontinue
        end

        -- if everything is already in production shutdown
        if factoryUtils.isTableEmpty(validQueueIndexes) and numberOfAvailableFactories == 0 then
            should_shutdown = true
            goto outercontinue
        end

        for _, queueIdx in ipairs(validQueueIndexes) do
            local queueItem = queueInfo.queue[queueIdx]
            local idleFactory = table.remove(idleFactories, 1)
            if idleFactory == nil then
                system.print(string.format("no idle factories available for making %d", queueItem.itemId))
                break
            end
            buildAssignments[queueKey] = program.addFactoryAssignment(buildAssignments[queueKey], queueItem, idleFactory)
            --idleFactory.setOutput(queueItem.itemId)
            --idleFactory.startMaintain(queueItem.quantity)
            --table.insert(program.currentQueue[queueKey].inProgress, queueItem.itemId)
        end

        numberOfAvailableFactories = factoryUtils.tableLenth(idleFactories)
        if numberOfAvailableFactories == 0 then
            goto outercontinue
        end

        for _, queueItem in ipairs(queueInfo.queue) do
            local idleFactory = table.remove(idleFactories, 1)
            if idleFactory == nil then
                system.print(string.format("no idle factories available for making %d", queueItem.itemId))
                break
            end
            buildAssignments[queueKey] = program.addFactoryAssignment(buildAssignments[queueKey], queueItem, idleFactory)
            --idleFactory.setOutput(queueItem.itemId)
            --idleFactory.startMaintain(queueItem.quantity)
        end

        ::outercontinue::
        table.insert(all_should_shutdown, should_shutdown)
    end

    if should_startup_factories then
        system.print("assigning recipes to factories")
        for queueKey, assignments in pairs(buildAssignments) do
            for itemId, buildInfo in pairs(assignments) do
                local quantity = buildInfo.queueItem.quantity
                local startFunction = "startMaintain"
                local perMachineIdxQty = {}
                for _, _ in ipairs(buildInfo.factories) do
                    table.insert(perMachineIdxQty, 0)
                end
                if string.match(buildMode, "singleBatch") then
                    all_should_shutdown = {true} -- force the shutdown in batch mode on this run to prevent assignments from running again
                    startFunction = "startFor"
                    local recipe = factoryUtils.getLowestTierRecipe(system.getRecipes(itemId))
                    local batchQty = 0
                    for _, product in ipairs(recipe.products) do
                        if product.id == tonumber(itemId) then
                            batchQty = product.quantity
                        end
                    end

                    if batchQty == 0 then
                        error(string.format("could not find product on recipe for itemId %s. this shouldn't happen", itemId))
                    end
                    local batches = math.ceil(buildInfo.queueItem.quantity/batchQty)
                    local factoryCnt = factoryUtils.tableLenth(perMachineIdxQty)
                    for i=1, batches do
                        local perMachineIdx = (i % factoryCnt) + 1
                        perMachineIdxQty[perMachineIdx] = perMachineIdxQty[perMachineIdx] + 1
                    end
                    quantity = math.ceil(batches/factoryUtils.tableLenth(buildInfo.factories))
                else
                    for idx, _ in ipairs(buildInfo.factories) do
                        perMachineIdxQty[idx] = quantity
                    end
                end

                for idx, factory in ipairs(buildInfo.factories) do
                    local buildQty = perMachineIdxQty[idx]
                    if buildQty == 0 then
                        goto continue
                    end
                    factory.setOutput(itemId)
                    factory[startFunction](buildQty)
                    system.print(string.format("started production for itemId %s on factory %s localId %d", itemId, factory.getName(), factory.getLocalId()))
                    ::continue::
                end
                table.insert(program.currentQueue[queueKey].inProgress, itemId)
            end
        end
    end
    if not factoryUtils.array_has_value(all_should_shutdown, false) then
        system.print("factory calculatio")
        unit.exit()
    end
end

function program.loadQueues()
    if program.currentQueue ~= nil or not program.refreshQueue then
        return program.currentQueue
    end
    local factories = library.getLinksByClass("Industry1", true)
    table.sort(factories, factoryUtils.sortElementsByLocalId)
    local factoriesByQueue = {}
    for _, factory in ipairs(factories) do
        local queueKey = factoryUtils.getQueueKeyForFactory(factory)
        if queueKey == nil then
            system.print(string.format("could not determine factory queue for %s", factory.getName()))
            goto continue
        end

        if factoriesByQueue[queueKey] == nil then
            factoriesByQueue[queueKey] = {
                factories = {},
                queue = nil,
                inProgress = {}
            }
        end
        table.insert(factoriesByQueue[queueKey].factories, factory)
        ::continue::
    end
    for queueKey, factoryTypeInfo in pairs(factoriesByQueue) do
        if factoryTypeInfo.queue ~= nil then
            goto continue
        end
        for _, factoryDatabank in ipairs(factoryDatabanks) do
            if ~ factoryDatabank.hasKey(queueKey) then
                system.print(string.format("found queue key %s", queueKey))
                factoriesByQueue[queueKey].queue = json.decode(factoryDatabank.getStringValue(queueKey))
            end
            if factoriesByQueue[queueKey].queue == nil then
                system.print(string.format("could not find queue information for %s", queueKey))
                system.print(string.format("queue information for `%s` - `%s`", queueKey, factoryDatabank.getStringValue(queueKey)))
                factoriesByQueue[queueKey] = nil
            end
        end
        ::continue::
    end
    program.currentQueue = factoriesByQueue
    system.print(string.format("loaded queues for attached factories"))
    program.refreshQueue = false
    return program.currentQueue
end

function program.timerImpl(self, timerId)
    if timerId == "programFactories" then
        program.loadQueues()
        program.programFactories()
    elseif timerId == "refreshQueue" then
        refreshQueue = true
    end
end

program.init()
unit:onEvent("onTimer", program.timerImpl, nil)
unit.setTimer("programFactories", 10)
unit.setTimer("refreshQueue", 60)