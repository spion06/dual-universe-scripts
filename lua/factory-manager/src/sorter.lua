unit.hide()

rows_per_screen = 25 --export: (Default 25) how many rows to put in a screen
switch_recipe_interval = 30 --export: (Default 30) how often to check for if a recipe needs to be changed
batch_size = 5 --export: (Default 5) how many batches should be completed before changing recipe
group_id = "set this" --export: (Default: set this) what this group of connected industry units should be called
in_timer = false
system_container_update_time = 30 -- how often you can update containers on this unit. this is global meaning with multiple containers attached the refresh interval increases by this value * the number of containers
per_container_update_interval = 30
render_start_time = 0
fast_restart_interval = 5
fast_restart = false


screens = {}
containers = {}
industryUnits = {}
container_update_time = {}
databank = nil
items_in_container = {}
sorted_item_ids = {} -- itemids that have gone though sorting at least once (for iteration)

function configure()
    sortSlot(slot1)
    sortSlot(slot2)
    sortSlot(slot3)
    sortSlot(slot4)
    sortSlot(slot5)
    sortSlot(slot6)
    sortSlot(slot7)
    sortSlot(slot8)
    sortSlot(slot9)
    sortSlot(slot10)
    per_container_update_interval = system_container_update_time * tableLenth(containers)
    printOutsideTimer("containers will refresh every " .. per_container_update_interval .. "s")
    return true
end

function printOutsideTimer(message)
    if in_timer ~= true then
        logWithGroup(message)
    end
end

function logWithGroup(message)
    system.print(group_id .. ": " .. message)
end

function sortSlot(slotObj)
    if (slotObj == nil) then
       -- system.print("argument is null")
        return
    end
    
    if (string.match(slotObj.getClass(), "Screen")) then
        printOutsideTimer(slotObj.getClass() .. " is Screen type")
        table.insert(screens, slotObj)
    elseif (string.match(slotObj.getClass(), "Container")) then
        printOutsideTimer(slotObj.getClass() .. " is Container type")
        table.insert(containers, slotObj)
        container_update_time[slotObj] = 0
    elseif (string.match(slotObj.getClass(), "DataBank")) then
        printOutsideTimer(slotObj.getClass() .. " is Databank type")
        if databank ~= nil then
            logWithGroup("more than one databank is connected. only connect 1 databank")
            exit()
        end
        databank = slotObj
    elseif (string.match(slotObj.getClass(), "IndustryUnit")) then
        printOutsideTimer(slotObj.getClass() .. " is IndustryUnit type")
        table.insert(industryUnits, slotObj)
    else
        printOutsideTimer(slotObj.getClass() .. " is not a usable element type")
    end
end

function tableLenth(tbl)
    local cnt = 0
    for _ in pairs(tbl) do
        cnt = cnt + 1
    end
    return cnt
end

function tableHasValue(table, matchVal)
    for _, value in ipairs(table) do
        if value == matchVal then
            return true
        end
    end

    return false
end

function joinTable(tbl, joinStr)
    local joinTbl = tbl
    local total_str = table.remove(joinTbl, 1)
    for _, item in ipairs(joinTbl) do
        total_str = string.format("%s%s%s", total_str, joinStr, item)
    end
    return total_str
end

function updateIfPossible(containerObj)
    if (container_update_time[containerObj] + per_container_update_interval) < render_start_time then
        local update_success = containerObj.updateContent()
        if update_success == 0 then
            container_update_time[containerObj] = render_start_time
        end
    end
end

function updateContainerItemsTable()
  items_in_container = {}
  for _,container in ipairs(containers) do
      updateIfPossible(container)
      for k, v in pairs(container.getContent()) do
          local itemObj = system.getItem(v["id"])
          local stored_stack_qty = 0
          if items_in_container[itemObj["id"]] ~= nil then
               stored_stack_qty = items_in_container[itemObj["id"]]["qty"]
          end
          items_in_container[itemObj["id"]] = { 
                ["object"] = itemObj, 
                ["qty"] = v["quantity"] + stored_stack_qty
            }
      end
  end
end

function getCurrentItemId(itemids)
  local l_itemid = 0
  for _, itemId in ipairs(itemids) do
      local val = items_in_container[itemId]
      if ( val == nil or tableHasValue(sorted_item_ids, itemId) ) then
        goto continue
      end
      l_itemid = itemId
      ::continue::
  end
  return l_itemid
end

function stopJammedUnits()
    local did_stop = false
    logWithGroup("stopping remaining units")
    for _, iUnit in ipairs(industryUnits) do
        if iUnit.getState() > 2 then
            iUnit.stop(true,false) -- force stop any jammed industry units
            did_stop = true
        end
    end 
    return did_stop
end

function stopAllUnits()
    local did_stop = false
    logWithGroup("stopping remaining units")
    for _, iUnit in ipairs(industryUnits) do
        if iUnit.getState() >= 2 then
            iUnit.stop(true,false) -- force stop any jammed industry units
            did_stop = true
        end
    end 
    return did_stop
end

function fastRestart()
    if fast_restart then
        local iStates = {}
        for _, iUnit in ipairs(industryUnits) do
            table.insert(iStates, iUnit.getState())
        end
        if tableHasValue(iStates, 2) then
            stopAllUnits()
            goto fastrestartexit
        end
        if stopJammedUnits() then
            goto fastrestartexit
        end
        if runSort(true) then
            fast_restart = false
        end
    end
    ::fastrestartexit::
end

function runSort(forceRun)
  if tableLenth(items_in_container) == 0 then
      logWithGroup("no items detected in container. delaying until next run")
      return false
  end
  if not forceRun and fast_restart then
      return false
  end
  local current_item_id = 0 -- the current itemid that should be handled. to be set later
  local total_screens = tableLenth(screens)
  local screen_id = 1 -- what screen index to start with. not implemented
  local industryStates = {}
  local itemids = {} -- currently known items that are in the container(s)
    
    --[[
    Industry state map
    1 = Stopped
    2 = Running
    3 = Jammed missing ingredient
    4 = Jammed output full
    5 = jammed no output container
    6 = pending
    7 = jaummed missing schematics
  ]]--
  local should_return = false
  for _, iUnit in ipairs(industryUnits) do
      table.insert(industryStates, iUnit.getState())
      if iUnit.getState() == 2 then
          if iUnit.getCyclesCompleted() >= batch_size then
              logWithGroup("Hit target number of batches. canceling production while saving output")
              iUnit.stop(true, false)
              should_return = true
          end
      end
  end
  if should_return then
      logWithGroup("stop requested on running unit. waiting until next cycle to continue")
      stopJammedUnits()
      fast_restart = true
      return false
  end
  if tableHasValue(industryStates, 2) then
      return true
  end
    
  if stopJammedUnits() then
      logWithGroup("stop requested. waiting until next cycle to prevent issues starting unit")
      fast_restart = true
      return false
  end
    
  for itemId, _ in pairs(items_in_container) do
      table.insert(itemids, itemId)
  end
 
  table.sort(itemids)
  current_item_id = getCurrentItemId(itemids)
  if current_item_id == 0 then
      logWithGroup("all item ids taken. cleaning id cache and re-iterating")
      sorted_item_ids = {}
      current_item_id = getCurrentItemId(itemids)
  end  
  logWithGroup("setting recipe to " .. system.getItem(current_item_id)["displayNameWithSize"])
  for _, iUnit in ipairs(industryUnits) do
    -- make sure to use setCurrentSchematic. setOutput does NOT WORK currently
    --if iUnit.setCurrentSchematic(current_item_id) then
    if iUnit.setOutput(current_item_id) < 0 then
        logWithGroup("failed to set schematic. going into fast restart loop to try again")
        fast_restart = true
        return false
    end
    iUnit.startRun()
    table.insert(sorted_item_ids, current_item_id)
  end
  return true
end

render_start_time = system.getArkTime()
configure()
updateContainerItemsTable()

logWithGroup("Starting initial sorting process")
runSort(false)
logWithGroup("ending initial sorting process")

unit.setTimer("containerUpdate", system_container_update_time)
unit.setTimer("sort", switch_recipe_interval)
unit.setTimer("fastRestart", fast_restart_interval)
in_timer = true