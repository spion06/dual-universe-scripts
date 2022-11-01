json = require 'dkjson'
local duFactoryGenerator = loadfile('./duFactoryGenerator.lua')()
local allItems = loadfile('./hyperionItems.lua')()

local bigboi = {}
local skipped = {}

for itemName, vals in pairs(duFactoryGenerator) do
    local byName = allItems.findByFullName(itemName)
    if byName == nil then
        table.insert(skipped, itemName)
        goto continue
    end
    local shortName = byName[1]
    local schematicInfo = byName[2]
    if schematicInfo == nil or shortName == nil or schematicInfo.NqId == nil then
        table.insert(skipped, itemName)
        goto continue
    end
    local inputs = {}
    for inputName, inputQty in pairs(vals.input) do
        local hypItem = allItems.findByFullName(inputName)
        if hypItem[2] == nil then
            inputs = {}
            print(string.format("could not find input name %s. not outputting any inputs for %s", inputName, itemName))
            break
        end
        inputs[hypItem[2].NqId] = inputQty
    end
    local itemId = schematicInfo.NqId
    bigboi[itemId] = {
      industry = vals.industry,
      --industryIdsLike = allItems.matchByNameEndsWith(vals.industry),
      inputs = inputs,
      itemShort = shortName,
      producedQty = vals.outputQuantity,
      createTime = vals.time,
      type = vals.type,
      id = tonumber(itemId),
      itemLong = schematicInfo.FullName
    }
    ::continue::
end

print("skipped items " .. require 'pl.pretty'.write(skipped))
local outputFile = "./mergedRecipeInfo.lua"
local lua_table = require 'pl.pretty'.write(bigboi)
local filehandle = io.open( outputFile, "w+" )
filehandle:write("local data = ")
filehandle:write(lua_table)
filehandle:write("\nreturn data\n")
filehandle:flush()
filehandle:close()
print("wrote table to " .. outputFile)