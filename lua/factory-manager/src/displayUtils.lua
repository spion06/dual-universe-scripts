
local factoryUtils = require 'factoryUtils'
--

local displayUtils = {}


displayUtils.header = [[
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

displayUtils.row_items = {}

displayUtils.footer = [[
  </table>
</div>
]]

function displayUtils.createHtmlRow(tbl, cellClass)
    if cellClass == nil then
        cellClass = "cellDefault"
    end
    local row_html = "<tr>"
    for _, item in ipairs(tbl) do
        row_html = row_html .. "<td class=\"" .. cellClass .. "\">" .. tostring(item) .. "</td>"
    end
    return row_html .. "</tr>"
end

function displayUtils.createHtmlTable(tbl)
    local htmlTable = {}
    for _, subTable in ipairs(tbl) do
        table.insert(htmlTable, displayUtils.createHtmlRow(subTable))
    end
    return htmlTable
end

function displayUtils.getCellClass(item, qty)
    return "cellDefault"
end

function displayUtils.initRowHeader(headers)
    if headers == nil then
        headers = {"Name", "Quantity"}
    end
    displayUtils.row_items = {displayUtils.createHtmlRow(headers)}
end

function displayUtils.writeOutputToScreens(tbl, screens)
    local rows_per_screen = 25
    local total_screens = factoryUtils.tableLenth(screens)
    local displayTable = displayUtils.createHtmlTable(tbl)
    local accumated_rows = {}
    local accumated_rows_count = 0
    for _, row in ipairs(displayTable) do
        table.insert(accumated_rows, row)
        accumated_rows_count = accumated_rows_count + 1
        if accumated_rows_count == rows_per_screen then
            local screen = table.remove(screens, 1)
            if screen == nil then
                system.print(string.format("not enough screens. have %d", total_screens))
                error(string.format("not enough screens. have %d", total_screens))
            end
            screen.setHTML(string.format("%s%s%s", displayUtils.header, factoryUtils.joinTable(accumated_rows, " "), displayUtils.footer))
        end
    end
    if not factoryUtils.isTableEmpty(accumated_rows) then
        local screen = table.remove(screens, 1)
        if screen == nil then
            system.print(string.format("not enough screens. have %d", total_screens))
            error(string.format("not enough screens. have %d", total_screens))
        end
        screen.setHTML(string.format("%s%s%s", displayUtils.header, factoryUtils.joinTable(accumated_rows, " "), displayUtils.footer))
    end
end

return displayUtils