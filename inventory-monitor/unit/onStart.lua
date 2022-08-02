unit.hide()

rows_per_screen = 25 --export: (Default 25) how many rows to put in a screen
item_targets_json = '{"Blueprint": 0.25, "Ore": 150}' --export: (Default {}) json array of item display name -> target qty
low_percent = 25 --export: (Default 25) what pecent of target qty for an item to be considered low
high_percent = 80 --export: (Default 80) what percent of target qty for an item to be considered high
update_change_interal = 300 --export: (Default 30) how often should changed quantity update
update_interval = 30 --export: (Default 30) how often to refresh storage contents
item_targets = json.decode(item_targets_json)
in_timer = false
system_container_update_time = 30 -- how often you can update containers on this unit. this is global meaning with multiple containers attached the refresh interval increases by this value * the number of containers
per_container_update_interval = 30
render_start_time = 0

header = [[
<style type="text/css">
  body {
    background-color: black;
    color: white;
  }

  table {
    width: 100%;
    margin-left: 2%;
    margin-right: 2%;
    margin-top: 1vh;
  }

  .cellDefault {
    font-size: 2vw;
  }

  .cellLow {
    font-size: 2vw;
    color: #ff0000;
  }

  .cellMedium {
    font-size: 2vw;
    color: #ffff00;
  }

  .cellHigh {
    font-size: 2vw;
    color: #00ff00;
  }

  .units {
    color: #666666;
  }
</style>
<div style="width: 100%; height: 100%; background-color: black">
  <table>
]]

row_items = {}

footer = [[
  </table>
</div>
]]

screens = {}
containers = {}
container_update_time = {}
databank = nil
items_in_container = {}

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
        system.print(message)
    end
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
            system.print("more than one databank is connected. only connect 1 databank")
            exit()
        end
        databank = slotObj
    else
        printOutsideTimer(slotObj.getClass() .. "is not a usable element type")
    end
end

function tableLenth(tbl)
    local cnt = 0
    for _ in pairs(tbl) do
        cnt = cnt + 1
    end
    return cnt
end

function joinTable(tbl, joinStr)
   local total_str = ""
   for _, item in ipairs(tbl) do
       total_str = total_str .. item .. joinStr
   end
   return total_str
end

function createHtmlRow(tbl, cellClass)
    if cellClass == nil then
        cellClass = "cellDefault"
    end
    local row_html = "<tr>"
    for _, item in ipairs(tbl) do
        row_html = row_html .. "<td class=\"" .. cellClass .. "\">" .. tostring(item) .. "</td>"
    end
    return row_html .. "</tr>"
end

function getCellClass(item, qty)
    local target_qty = nil
    for k, v in pairs(item_targets) do
         if string.match(item["name"], k) then
             target_qty = v
             break
         end
         if string.match(item["displayNameWithSize"], k) then
             target_qty = v
             break
         end
    end
    if target_qty ~= nil then
         local item_target_percent = qty / target_qty * 100
         if item_target_percent <= low_percent then
            return "cellLow"
         elseif item_target_percent >= high_percent then
            return "cellHigh"
         else
            return "cellMedium"
         end
    else
        return "cellDefault"
    end
end

function updateDataBankQty(itemObj, qty)
    local item_key = tostring(itemObj["id"]) .. "Qty"
    local item_key_time = tostring(itemObj["id"]) .. "UpdateTime"
    local item_key_time_qty = tostring(itemObj["id"]) .. "UpdateTimeQty"
    local change_in_qty = 0
    local last_update_time = 0
    if databank ~= nil then
        if databank.hasKey(item_key_time) then
            last_update_time = databank.getFloatValue(item_key_time)
        end
        if (system.getArkTime() - last_update_time) >= update_change_interal then
            databank.setFloatValue(item_key_time_qty, (qty - getDataBankData(itemObj["id"])))
            databank.setFloatValue(item_key, qty)
            databank.setFloatValue(item_key_time, system.getArkTime())
        end
        change_in_qty = databank.getFloatValue(item_key_time_qty)
    end
    return change_in_qty
end

function getDataBankKeys()
    if databank ~= nil then
        return databank.getKeyList()
    end
    return {}
end

function getDataBankData(itemId)
    if databank ~= nil then
        return databank.getFloatValue(itemId .. "Qty")
    end
    return 0
end

function initRowHeader()
    local headers = {"Name", "Quantity"}
    if databank ~= nil then
        table.insert(headers, "Change") 
    end
    row_items = {createHtmlRow(headers)}
end

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
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
    
  for _, itemDBKey in ipairs(getDataBankKeys()) do
      if ends_with(itemDBKey, "Qty") == false then
          break
      end
      local itemId = tonumber(itemDBKey:sub(1, #itemDBKey - 3))
      if items_in_container[itemId] == nil then
          local itemObj = system.getItem(itemId)
          items_in_container[itemObj["id"]] = {
            ["object"] = itemObj,
            ["qty"] = 0
          }
      end
  end
  
end

function render()
  render_start_time = system.getArkTime()
  local local_items = {}
  printOutsideTimer("Starting initial render process")
  local total_item_rows = 0
  local total_screens = tableLenth(screens)
  local screen_id = 1
  local total_items = 0
  initRowHeader()
  updateContainerItemsTable()
  local itemids = {}
  for itemId, _ in pairs(items_in_container) do
      table.insert(itemids, itemId)
  end
  table.sort(itemids)
  for _, itemId in ipairs(itemids) do
      local val = items_in_container[itemId]
      local itemObj = val["object"]
      local v = { ["quantity"] = val["qty"], ["id"] = itemId }
      local changed_qty = updateDataBankQty(itemObj, v["quantity"])
      if total_item_rows == rows_per_screen then
          if (screen_id < total_screens) then
              screens[screen_id].setHTML(header .. joinTable(row_items, " ") .. footer)
              initRowHeader()
              screen_id = screen_id + 1
              total_item_rows = 0
          else
              row_items[tableLenth(row_items)] = createHtmlRow({"insufficent screens: " .. total_screens .. " total items: " .. total_items .. " needed screens: " .. string.format("%d", math.floor(total_items/rows_per_screen) + 1) })
              goto continue
          end
      end
      do
          local htmlInputs = {itemObj["displayNameWithSize"], string.format("%.2f", v["quantity"])}
          if databank ~= nil then
            table.insert(htmlInputs, string.format("%.2f", changed_qty))
          end
          table.insert(row_items, createHtmlRow(htmlInputs, getCellClass(itemObj, v["quantity"])))
          total_item_rows = total_item_rows + 1
      end
      ::continue::
      total_items = total_items + 1
  end
  printOutsideTimer("ending initial render process")
  screens[screen_id].setHTML(header .. joinTable(row_items, " ") .. footer)
end

function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

if configure() then
  render()
else
  system.print("configure failed!")
  exit()
end

system.print("starting timer")
unit.setTimer("refreshScreens", update_interval)