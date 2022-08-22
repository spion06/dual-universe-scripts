-- taken from https://hq.hyperion-corporation.de
local allItems = {}

function allItems.findItemByName(itemName)
    for item, itemInfo in pairs(allItems._items) do
        if item == itemName then
            return itemInfo
        end
    end
end

function allItems.getItemGroup(itemId)
    local itemKey = allItems.itemsById()[itemId]
    return allItems._items[itemKey].GroupId
end

function allItems.itemsById()
    if allItems._itemsById == nil then
        allItems._itemsById = {}
        for key, vals in pairs(allItems._items) do
            if vals.NqId then
                allItems._itemsById[vals.NqId] = key
            end
        end
    end
    return allItems._itemsById
end

function allItems.findByFullName(fullName)
    for key, vals in pairs(allItems._items) do
        if  string.lower(fullName) == string.lower(vals.FullName) then
            return { key, vals }
        end
    end
    for key, vals in pairs(allItems._items) do
        if  string.lower(fullName .. " product") == string.lower(vals.FullName) then
            return { key, vals }
        end
    end
    if allItems.starts_with(string.lower(fullName), "pure ") then
        for match in string.gmatch(string.lower(fullName), "pure (%w+)") do
            return allItems.findByFullName(match .. " pure")
        end
    end
    return {}
end

function allItems.ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

function allItems.starts_with(str, start)
    return string.sub(str,1,string.len(start))==start
end
 

function allItems.matchByNameEndsWith(itemName)
    local all_ends_with = {}
    if itemName == "" then
        return all_ends_with
    end
    for key, vals in pairs(allItems._items) do
        if  allItems.ends_with(string.lower(vals.FullName), string.lower(itemName)) then
            table.insert(all_ends_with, vals.NqId)
        end
    end
    return all_ends_with
end

allItems._items = {
    ["Counter10"] = {
        Name = "10 counter",
        FullName = "10 counter",
        NqId = 888063487,
        NqRecipeId = 686769663,
        GroupId = "08d8a31f-4fac-461f-8c8a-5245dac56f7c"
    },
    ["Counter02"] = {
        Name = "2 counter",
        FullName = "2 counter",
        NqId = 888062905,
        NqRecipeId = 686769081,
        GroupId = "08d8a31f-4fac-461f-8c8a-5245dac56f7c"
    },
    ["Counter03"] = {
        Name = "3 counter",
        FullName = "3 counter",
        NqId = 888062906,
        NqRecipeId = 686769082,
        GroupId = "08d8a31f-4fac-461f-8c8a-5245dac56f7c"
    },
    ["Counter05"] = {
        Name = "5 counter",
        FullName = "5 counter",
        NqId = 888062908,
        NqRecipeId = 686769084,
        GroupId = "08d8a31f-4fac-461f-8c8a-5245dac56f7c"
    },
    ["Counter07"] = {
        Name = "7 counter",
        FullName = "7 counter",
        NqId = 888062910,
        NqRecipeId = 686769086,
        GroupId = "08d8a31f-4fac-461f-8c8a-5245dac56f7c"
    },
    ["SilverOre"] = {
        Name = "Acanthite",
        FullName = "Acanthite",
        NqId = 1050500112,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50bd-45c4-8ea5-3601d1f3d821"
    },
    ["AdjusterMedium"] = {
        Name = "Adjustor",
        FullName = "Adjustor M",
        NqId = 3790013467,
        NqRecipeId = 1221723451,
        GroupId = "08d8a31f-5024-4776-8982-045e58aaf237"
    },
    ["AdjusterLarge"] = {
        Name = "Adjustor",
        FullName = "Adjustor L",
        NqId = 2818864930,
        NqRecipeId = 581659554,
        GroupId = "08d8a31f-5024-4776-8982-045e58aaf237"
    },
    ["AdjusterSmall"] = {
        Name = "Adjustor",
        FullName = "Adjustor S",
        NqId = 47474508,
        NqRecipeId = 1972188620,
        GroupId = "08d8a31f-5024-4776-8982-045e58aaf237"
    },
    ["AdjusterXtraSmall"] = {
        Name = "Adjustor",
        FullName = "Adjustor XS",
        NqId = 2648523849,
        NqRecipeId = 977384435,
        GroupId = "08d8a31f-5024-4776-8982-045e58aaf237"
    },
    ["Industry3DPrinter3"] = {
        Name = "Advanced 3D Printer",
        FullName = "Advanced 3D Printer M",
        NqId = 2793358079,
        NqRecipeId = 39016076,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["WeaponCannonExtraSmallAgile3"] = {
        Name = "Advanced Agile Cannon",
        FullName = "Advanced Agile Cannon XS",
        NqId = 684853120,
        NqRecipeId = 911593699,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonLargeAgile3"] = {
        Name = "Advanced Agile Cannon",
        FullName = "Advanced Agile Cannon L",
        NqId = 3152865672,
        NqRecipeId = 249217449,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonMediumAgile3"] = {
        Name = "Advanced Agile Cannon",
        FullName = "Advanced Agile Cannon M",
        NqId = 2672575276,
        NqRecipeId = 120523255,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonSmallAgile3"] = {
        Name = "Advanced Agile Cannon",
        FullName = "Advanced Agile Cannon S",
        NqId = 429894438,
        NqRecipeId = 1955213856,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponLaserMediumAgile3"] = {
        Name = "Advanced Agile Laser",
        FullName = "Advanced Agile Laser M",
        NqId = 360504284,
        NqRecipeId = 338688399,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserExtraSmallAgile3"] = {
        Name = "Advanced Agile Laser",
        FullName = "Advanced Agile Laser XS",
        NqId = 3972697532,
        NqRecipeId = 1747903961,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargeAgile3"] = {
        Name = "Advanced Agile Laser",
        FullName = "Advanced Agile Laser L",
        NqId = 679378436,
        NqRecipeId = 1355106982,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserSmallAgile3"] = {
        Name = "Advanced Agile Laser",
        FullName = "Advanced Agile Laser S",
        NqId = 4124398193,
        NqRecipeId = 1845822033,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargeAgile3"] = {
        Name = "Advanced Agile Missile",
        FullName = "Advanced Agile Missile L",
        NqId = 3650288374,
        NqRecipeId = 1424237790,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileExtraSmallAgile3"] = {
        Name = "Advanced Agile Missile",
        FullName = "Advanced Agile Missile XS",
        NqId = 1780076560,
        NqRecipeId = 1077970865,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileMediumAgile3"] = {
        Name = "Advanced Agile Missile",
        FullName = "Advanced Agile Missile M",
        NqId = 598736203,
        NqRecipeId = 677437738,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileSmallAgile3"] = {
        Name = "Advanced Agile Missile",
        FullName = "Advanced Agile Missile S",
        NqId = 1843877007,
        NqRecipeId = 697649810,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunMediumAgile3"] = {
        Name = "Advanced Agile Railgun",
        FullName = "Advanced Agile Railgun M",
        NqId = 3057550275,
        NqRecipeId = 490609642,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallAgile3"] = {
        Name = "Advanced Agile Railgun",
        FullName = "Advanced Agile Railgun XS",
        NqId = 549955075,
        NqRecipeId = 2090934873,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunLargeAgile3"] = {
        Name = "Advanced Agile Railgun",
        FullName = "Advanced Agile Railgun L",
        NqId = 4062760160,
        NqRecipeId = 1290704544,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallAgile3"] = {
        Name = "Advanced Agile Railgun",
        FullName = "Advanced Agile Railgun S",
        NqId = 1767704175,
        NqRecipeId = 114495124,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["antenna_3_m"] = {
        Name = "Advanced Antenna",
        FullName = "Advanced Antenna M",
        NqId = 1080827544,
        NqRecipeId = 1305972986,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_3_s"] = {
        Name = "Advanced Antenna",
        FullName = "Advanced Antenna S",
        NqId = 1080827550,
        NqRecipeId = 1305972960,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_3_xl"] = {
        Name = "Advanced Antenna",
        FullName = "Advanced Antenna XL",
        NqId = 2302031898,
        NqRecipeId = 1782974331,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_3_l"] = {
        Name = "Advanced Antenna",
        FullName = "Advanced Antenna L",
        NqId = 1080827527,
        NqRecipeId = 1305972985,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antigravitycore_3"] = {
        Name = "Advanced Anti-Gravity Core",
        FullName = "Advanced Anti-Gravity Core",
        NqId = 2999509666,
        NqRecipeId = 82629951,
        GroupId = "08d8a31f-511d-4b6e-8d59-bd04dbbbe00c"
    },
    ["antimattercapsule_3"] = {
        Name = "Advanced Antimatter Capsule",
        FullName = "Advanced Antimatter Capsule",
        NqId = 3661595540,
        NqRecipeId = 1849145536,
        GroupId = "08d8a31f-50f4-4652-84b5-e015a2be2176"
    },
    ["antimattercore_3"] = {
        Name = "Advanced Antimatter Core",
        FullName = "Advanced Antimatter Core",
        NqId = 375744325,
        NqRecipeId = 787693311,
        GroupId = "08d8a31f-511f-4606-8b05-98dd1347589c"
    },
    ["IndustryAssemblyS3"] = {
        Name = "Advanced Assembly Line",
        FullName = "Advanced Assembly Line S",
        NqId = 1762226232,
        NqRecipeId = 1275490626,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["IndustryAssemblyM3"] = {
        Name = "Advanced Assembly Line",
        FullName = "Advanced Assembly Line M",
        NqId = 1762227888,
        NqRecipeId = 1275491023,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["IndustryAssemblyXS3"] = {
        Name = "Advanced Assembly Line",
        FullName = "Advanced Assembly Line XS",
        NqId = 2480928551,
        NqRecipeId = 2127592347,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["IndustryAssemblyXL3"] = {
        Name = "Advanced Assembly Line",
        FullName = "Advanced Assembly Line XL",
        NqId = 2480866767,
        NqRecipeId = 2127592958,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["IndustryAssemblyL3"] = {
        Name = "Advanced Assembly Line",
        FullName = "Advanced Assembly Line L",
        NqId = 1762226675,
        NqRecipeId = 1275490953,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["burner_3"] = {
        Name = "Advanced Burner",
        FullName = "Advanced Burner",
        NqId = 2660328734,
        NqRecipeId = 1272865108,
        GroupId = "08d8a31f-50f7-42af-8cbd-a4edf5ff865c"
    },
    ["casing_3_xs"] = {
        Name = "Advanced Casing",
        FullName = "Advanced Casing XS",
        NqId = 946544989,
        NqRecipeId = 84049013,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_3_s"] = {
        Name = "Advanced Casing",
        FullName = "Advanced Casing S",
        NqId = 567007766,
        NqRecipeId = 669702603,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_3_xl"] = {
        Name = "Advanced Casing",
        FullName = "Advanced Casing XL",
        NqId = 946544964,
        NqRecipeId = 84048974,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_3_l"] = {
        Name = "Advanced Casing",
        FullName = "Advanced Casing L",
        NqId = 567007775,
        NqRecipeId = 669702592,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_3_m"] = {
        Name = "Advanced Casing",
        FullName = "Advanced Casing M",
        NqId = 567007760,
        NqRecipeId = 669702593,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["chemicalcontainer_3_l"] = {
        Name = "Advanced Chemical Container",
        FullName = "Advanced Chemical Container L",
        NqId = 625115176,
        NqRecipeId = 1815447015,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_3_m"] = {
        Name = "Advanced Chemical Container",
        FullName = "Advanced Chemical Container M",
        NqId = 625115179,
        NqRecipeId = 1815447012,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_3_s"] = {
        Name = "Advanced Chemical Container",
        FullName = "Advanced Chemical Container S",
        NqId = 625115345,
        NqRecipeId = 1815447022,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_3_xl"] = {
        Name = "Advanced Chemical Container",
        FullName = "Advanced Chemical Container XL",
        NqId = 3714764686,
        NqRecipeId = 714333586,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["IndustryChemical3"] = {
        Name = "Advanced Chemical Industry",
        FullName = "Advanced Chemical Industry M",
        NqId = 648743080,
        NqRecipeId = 1303072731,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["combustionchamber_3_m"] = {
        Name = "Advanced Combustion Chamber",
        FullName = "Advanced Combustion Chamber M",
        NqId = 2662310087,
        NqRecipeId = 1027890520,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_3_xs"] = {
        Name = "Advanced Combustion Chamber",
        FullName = "Advanced Combustion Chamber XS",
        NqId = 4016322616,
        NqRecipeId = 1138473458,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_3_s"] = {
        Name = "Advanced Combustion Chamber",
        FullName = "Advanced Combustion Chamber S",
        NqId = 2662310081,
        NqRecipeId = 1027890518,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_3_l"] = {
        Name = "Advanced Combustion Chamber",
        FullName = "Advanced Combustion Chamber L",
        NqId = 2662310086,
        NqRecipeId = 1027890521,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["component_3"] = {
        Name = "Advanced Component",
        FullName = "Advanced Component",
        NqId = 794666751,
        NqRecipeId = 1319718941,
        GroupId = "08d8a31f-514e-4a1e-8d11-a8cd886bbec5"
    },
    ["connector_3"] = {
        Name = "Advanced Connector",
        FullName = "Advanced Connector",
        NqId = 2872711781,
        NqRecipeId = 1738589841,
        GroupId = "08d8a31f-5150-4814-89a1-12b878205d04"
    },
    ["controlsystem_3_m"] = {
        Name = "Advanced Control System",
        FullName = "Advanced Control System M",
        NqId = 3431996639,
        NqRecipeId = 1421964863,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["controlsystem_3_l"] = {
        Name = "Advanced Control System",
        FullName = "Advanced Control System L",
        NqId = 3431996632,
        NqRecipeId = 1421964862,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["controlsystem_3_s"] = {
        Name = "Advanced Control System",
        FullName = "Advanced Control System S",
        NqId = 3431996625,
        NqRecipeId = 1421964837,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["coresystem_3_m"] = {
        Name = "Advanced Core System",
        FullName = "Advanced Core System M",
        NqId = 1775106556,
        NqRecipeId = 958829132,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["WeaponCannonLargeDefense3"] = {
        Name = "Advanced Defense Cannon",
        FullName = "Advanced Defense Cannon L",
        NqId = 418164306,
        NqRecipeId = 2075676704,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonSmallDefense3"] = {
        Name = "Advanced Defense Cannon",
        FullName = "Advanced Defense Cannon S",
        NqId = 1073121333,
        NqRecipeId = 542848388,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonExtraSmallDefense3"] = {
        Name = "Advanced Defense Cannon",
        FullName = "Advanced Defense Cannon XS",
        NqId = 3467785559,
        NqRecipeId = 1096591344,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonMediumDefense3"] = {
        Name = "Advanced Defense Cannon",
        FullName = "Advanced Defense Cannon M",
        NqId = 2383624964,
        NqRecipeId = 84872825,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponLaserExtraSmallDefense3"] = {
        Name = "Advanced Defense Laser",
        FullName = "Advanced Defense Laser XS",
        NqId = 796456749,
        NqRecipeId = 1394719564,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargeDefense3"] = {
        Name = "Advanced Defense Laser",
        FullName = "Advanced Defense Laser L",
        NqId = 3991674478,
        NqRecipeId = 1303569297,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumDefense3"] = {
        Name = "Advanced Defense Laser",
        FullName = "Advanced Defense Laser M",
        NqId = 3805044393,
        NqRecipeId = 2049928205,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallDefense3"] = {
        Name = "Advanced Defense Laser",
        FullName = "Advanced Defense Laser S",
        NqId = 1737118473,
        NqRecipeId = 480977833,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargeDefense3"] = {
        Name = "Advanced Defense Missile",
        FullName = "Advanced Defense Missile L",
        NqId = 3453451048,
        NqRecipeId = 1090131853,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileMediumDefense3"] = {
        Name = "Advanced Defense Missile",
        FullName = "Advanced Defense Missile M",
        NqId = 1068910670,
        NqRecipeId = 1585468819,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileExtraSmallDefense3"] = {
        Name = "Advanced Defense Missile",
        FullName = "Advanced Defense Missile XS",
        NqId = 134390791,
        NqRecipeId = 100930655,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileSmallDefense3"] = {
        Name = "Advanced Defense Missile",
        FullName = "Advanced Defense Missile S",
        NqId = 136359050,
        NqRecipeId = 2121766257,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunExtraSmallDefense3"] = {
        Name = "Advanced Defense Railgun",
        FullName = "Advanced Defense Railgun XS",
        NqId = 2108818543,
        NqRecipeId = 1911355876,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunMediumDefense3"] = {
        Name = "Advanced Defense Railgun",
        FullName = "Advanced Defense Railgun M",
        NqId = 3396072211,
        NqRecipeId = 661205341,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunLargeDefense3"] = {
        Name = "Advanced Defense Railgun",
        FullName = "Advanced Defense Railgun L",
        NqId = 3670363955,
        NqRecipeId = 564701343,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallDefense3"] = {
        Name = "Advanced Defense Railgun",
        FullName = "Advanced Defense Railgun S",
        NqId = 223437801,
        NqRecipeId = 1492798464,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["electronics_3"] = {
        Name = "Advanced Electronics",
        FullName = "Advanced Electronics",
        NqId = 1297540452,
        NqRecipeId = 1026118818,
        GroupId = "08d8a31f-50f8-4d6f-835c-9f32f00e2ee9"
    },
    ["IndustryElectronics3"] = {
        Name = "Advanced Electronics Industry",
        FullName = "Advanced Electronics Industry M",
        NqId = 2861848557,
        NqRecipeId = 1151494169,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["igniter_3"] = {
        Name = "Advanced Explosive Module",
        FullName = "Advanced Explosive Module",
        NqId = 2541811484,
        NqRecipeId = 21951624,
        GroupId = "08d8a31f-50fc-42c6-8d1a-6c49298010f4"
    },
    ["firingsystem_3_l"] = {
        Name = "Advanced Firing System",
        FullName = "Advanced Firing System L",
        NqId = 3242491977,
        NqRecipeId = 567363299,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_3_xs"] = {
        Name = "Advanced Firing System",
        FullName = "Advanced Firing System XS",
        NqId = 3740021214,
        NqRecipeId = 992752908,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_3_s"] = {
        Name = "Advanced Firing System",
        FullName = "Advanced Firing System S",
        NqId = 3242491986,
        NqRecipeId = 567363226,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_3_m"] = {
        Name = "Advanced Firing System",
        FullName = "Advanced Firing System M",
        NqId = 3242491976,
        NqRecipeId = 567363300,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["fixation_3"] = {
        Name = "Advanced Fixation",
        FullName = "Advanced Fixation",
        NqId = 466630567,
        NqRecipeId = 577252211,
        GroupId = "08d8a31f-5152-45db-8c9a-415408681c9d"
    },
    ["AtmosphericEngineMediumFreight3"] = {
        Name = "Advanced Freight Atmospheric Engine",
        FullName = "Advanced Freight Atmospheric Engine M",
        NqId = 488092470,
        NqRecipeId = 850251757,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineXtraSmallFreight3"] = {
        Name = "Advanced Freight Atmospheric Engine",
        FullName = "Advanced Freight Atmospheric Engine XS",
        NqId = 2711764151,
        NqRecipeId = 835881250,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineSmallFreight3"] = {
        Name = "Advanced Freight Atmospheric Engine",
        FullName = "Advanced Freight Atmospheric Engine S",
        NqId = 1152783534,
        NqRecipeId = 1433916476,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineLargeFreight3"] = {
        Name = "Advanced Freight Atmospheric Engine",
        FullName = "Advanced Freight Atmospheric Engine L",
        NqId = 1638517115,
        NqRecipeId = 1724503004,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["SpaceEngineXtraSmallFreight3"] = {
        Name = "Advanced Freight Space Engine",
        FullName = "Advanced Freight Space Engine XS",
        NqId = 3719125853,
        NqRecipeId = 1874982271,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineMediumFreight3"] = {
        Name = "Advanced Freight Space Engine",
        FullName = "Advanced Freight Space Engine M",
        NqId = 516669710,
        NqRecipeId = 404185420,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineLargeFreight3"] = {
        Name = "Advanced Freight Space Engine",
        FullName = "Advanced Freight Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineSmallFreight3"] = {
        Name = "Advanced Freight Space Engine",
        FullName = "Advanced Freight Space Engine S",
        NqId = 270403386,
        NqRecipeId = 1533482930,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraLargeFreight3"] = {
        Name = "Advanced Freight Space Engine",
        FullName = "Advanced Freight Space Engine XL",
        NqId = 2497069958,
        NqRecipeId = 645158704,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["IndustryGlass3"] = {
        Name = "Advanced Glass Furnace",
        FullName = "Advanced Glass Furnace M",
        NqId = 2200747731,
        NqRecipeId = 1081167027,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["AdvancedGlassProduct"] = {
        Name = "Advanced glass product",
        FullName = "Advanced glass product",
        NqId = 1942154251,
        NqRecipeId = 1116568176,
        GroupId = "08d8a31f-50cb-451e-8b92-1451ab8f4b38"
    },
    ["WeaponCannonSmallHeavy3"] = {
        Name = "Advanced Heavy Cannon",
        FullName = "Advanced Heavy Cannon S",
        NqId = 2058706007,
        NqRecipeId = 2116333300,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonMediumHeavy3"] = {
        Name = "Advanced Heavy Cannon",
        FullName = "Advanced Heavy Cannon M",
        NqId = 2188788020,
        NqRecipeId = 645100381,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmallHeavy3"] = {
        Name = "Advanced Heavy Cannon",
        FullName = "Advanced Heavy Cannon XS",
        NqId = 3384934781,
        NqRecipeId = 1378758807,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonLargeHeavy3"] = {
        Name = "Advanced Heavy Cannon",
        FullName = "Advanced Heavy Cannon L",
        NqId = 3960316615,
        NqRecipeId = 748835222,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponLaserLargeHeavy3"] = {
        Name = "Advanced Heavy Laser",
        FullName = "Advanced Heavy Laser L",
        NqId = 4270062446,
        NqRecipeId = 945836170,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumHeavy3"] = {
        Name = "Advanced Heavy Laser",
        FullName = "Advanced Heavy Laser M",
        NqId = 3588765876,
        NqRecipeId = 1135448897,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserExtraSmallHeavy3"] = {
        Name = "Advanced Heavy Laser",
        FullName = "Advanced Heavy Laser XS",
        NqId = 3698237865,
        NqRecipeId = 522166214,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserSmallHeavy3"] = {
        Name = "Advanced Heavy Laser",
        FullName = "Advanced Heavy Laser S",
        NqId = 338218847,
        NqRecipeId = 928844450,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargeHeavy3"] = {
        Name = "Advanced Heavy Missile",
        FullName = "Advanced Heavy Missile L",
        NqId = 708864069,
        NqRecipeId = 1883135603,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileExtraSmallHeavy3"] = {
        Name = "Advanced Heavy Missile",
        FullName = "Advanced Heavy Missile XS",
        NqId = 3611570511,
        NqRecipeId = 922568176,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileMediumHeavy3"] = {
        Name = "Advanced Heavy Missile",
        FullName = "Advanced Heavy Missile M",
        NqId = 1102564708,
        NqRecipeId = 800973882,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileSmallHeavy3"] = {
        Name = "Advanced Heavy Missile",
        FullName = "Advanced Heavy Missile S",
        NqId = 1100091709,
        NqRecipeId = 673694711,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunLargeHeavy3"] = {
        Name = "Advanced Heavy Railgun",
        FullName = "Advanced Heavy Railgun L",
        NqId = 30018129,
        NqRecipeId = 642878053,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunExtraSmallHeavy3"] = {
        Name = "Advanced Heavy Railgun",
        FullName = "Advanced Heavy Railgun XS",
        NqId = 1816732415,
        NqRecipeId = 989109288,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunMediumHeavy3"] = {
        Name = "Advanced Heavy Railgun",
        FullName = "Advanced Heavy Railgun M",
        NqId = 1641776330,
        NqRecipeId = 990274947,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunSmallHeavy3"] = {
        Name = "Advanced Heavy Railgun",
        FullName = "Advanced Heavy Railgun S",
        NqId = 2991505111,
        NqRecipeId = 1706288007,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["IndustryHoneycomber3"] = {
        Name = "Advanced Honeycomb Refinery",
        FullName = "Advanced Honeycomb Refinery M",
        NqId = 3026799988,
        NqRecipeId = 1993163112,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["hydraulics_3"] = {
        Name = "Advanced hydraulics",
        FullName = "Advanced hydraulics",
        NqId = 1331181089,
        NqRecipeId = 30135026,
        GroupId = "08d8a31f-50fa-4803-8ecf-b8ad089f721b"
    },
    ["injector_3"] = {
        Name = "Advanced Injector",
        FullName = "Advanced Injector",
        NqId = 1971447078,
        NqRecipeId = 1293038242,
        GroupId = "08d8a31f-50fd-4c12-8954-19ee8310de60"
    },
    ["ionicchamber_3_s"] = {
        Name = "Advanced Ionic Chamber",
        FullName = "Advanced Ionic Chamber S",
        NqId = 1390563262,
        NqRecipeId = 763760292,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_3_l"] = {
        Name = "Advanced Ionic Chamber",
        FullName = "Advanced Ionic Chamber L",
        NqId = 1390563239,
        NqRecipeId = 763760349,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_3_xl"] = {
        Name = "Advanced Ionic Chamber",
        FullName = "Advanced Ionic Chamber XL",
        NqId = 962704738,
        NqRecipeId = 647669414,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_3_xs"] = {
        Name = "Advanced Ionic Chamber",
        FullName = "Advanced Ionic Chamber XS",
        NqId = 962704747,
        NqRecipeId = 647669439,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_3_m"] = {
        Name = "Advanced Ionic Chamber",
        FullName = "Advanced Ionic Chamber M",
        NqId = 1390563256,
        NqRecipeId = 763760350,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["laserchamber_3_l"] = {
        Name = "Advanced Laser Chamber",
        FullName = "Advanced Laser Chamber L",
        NqId = 2825503320,
        NqRecipeId = 1826483526,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_3_m"] = {
        Name = "Advanced Laser Chamber",
        FullName = "Advanced Laser Chamber M",
        NqId = 2825503323,
        NqRecipeId = 1826483527,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_3_s"] = {
        Name = "Advanced Laser Chamber",
        FullName = "Advanced Laser Chamber S",
        NqId = 2825503297,
        NqRecipeId = 1826483521,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_3_xl"] = {
        Name = "Advanced Laser Chamber",
        FullName = "Advanced Laser Chamber XL",
        NqId = 1252768242,
        NqRecipeId = 473409185,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_3_xs"] = {
        Name = "Advanced Laser Chamber",
        FullName = "Advanced Laser Chamber XS",
        NqId = 1252768249,
        NqRecipeId = 473407832,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["led_3"] = {
        Name = "Advanced LED",
        FullName = "Advanced LED",
        NqId = 1234754160,
        NqRecipeId = 1137501009,
        GroupId = "08d8a31f-5154-4334-89e3-dd6bb40b753f"
    },
    ["magnet_3"] = {
        Name = "Advanced Magnet",
        FullName = "Advanced Magnet",
        NqId = 1246524876,
        NqRecipeId = 1949200610,
        GroupId = "08d8a31f-50ff-45dd-8793-4e9e09a6afd6"
    },
    ["magneticrail_3_s"] = {
        Name = "Advanced Magnetic Rail",
        FullName = "Advanced Magnetic Rail S",
        NqId = 2722610741,
        NqRecipeId = 546977084,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_3_l"] = {
        Name = "Advanced Magnetic Rail",
        FullName = "Advanced Magnetic Rail L",
        NqId = 2722610746,
        NqRecipeId = 546977061,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_3_m"] = {
        Name = "Advanced Magnetic Rail",
        FullName = "Advanced Magnetic Rail M",
        NqId = 2722610747,
        NqRecipeId = 546977082,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_3_xs"] = {
        Name = "Advanced Magnetic Rail",
        FullName = "Advanced Magnetic Rail XS",
        NqId = 4211034905,
        NqRecipeId = 1819371145,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["AtmosphericEngineXtraSmallManeuver3"] = {
        Name = "Advanced Maneuver Atmospheric Engine",
        FullName = "Advanced Maneuver Atmospheric Engine XS",
        NqId = 4201522399,
        NqRecipeId = 367260236,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineLargeManeuver3"] = {
        Name = "Advanced Maneuver Atmospheric Engine",
        FullName = "Advanced Maneuver Atmospheric Engine L",
        NqId = 1397818124,
        NqRecipeId = 1035733967,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineSmallManeuver3"] = {
        Name = "Advanced Maneuver Atmospheric Engine",
        FullName = "Advanced Maneuver Atmospheric Engine S",
        NqId = 1301142496,
        NqRecipeId = 626408342,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineMediumManeuver3"] = {
        Name = "Advanced Maneuver Atmospheric Engine",
        FullName = "Advanced Maneuver Atmospheric Engine M",
        NqId = 3377917825,
        NqRecipeId = 471177835,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["SpaceEngineSmallManeuver3"] = {
        Name = "Advanced Maneuver Space Engine",
        FullName = "Advanced Maneuver Space Engine S",
        NqId = 1624640879,
        NqRecipeId = 1574474550,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraLargeManeuver3"] = {
        Name = "Advanced Maneuver Space Engine",
        FullName = "Advanced Maneuver Space Engine XL",
        NqId = 1773467599,
        NqRecipeId = 1697938591,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineLargeManeuver3"] = {
        Name = "Advanced Maneuver Space Engine",
        FullName = "Advanced Maneuver Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineMediumManeuver3"] = {
        Name = "Advanced Maneuver Space Engine",
        FullName = "Advanced Maneuver Space Engine M",
        NqId = 1757019469,
        NqRecipeId = 1475837143,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineXtraSmallManeuver3"] = {
        Name = "Advanced Maneuver Space Engine",
        FullName = "Advanced Maneuver Space Engine XS",
        NqId = 2368501172,
        NqRecipeId = 529497012,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["mechanicalsensor_3_xs"] = {
        Name = "Advanced Mechanical Sensor",
        FullName = "Advanced Mechanical Sensor XS",
        NqId = 204469317,
        NqRecipeId = 355397768,
        GroupId = "08d8a31f-513b-460d-896b-c132d9265abd"
    },
    ["IndustryMetalwork3"] = {
        Name = "Advanced Metalwork Industry",
        FullName = "Advanced Metalwork Industry M",
        NqId = 2808015397,
        NqRecipeId = 127106564,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["AtmosphericEngineLargeMilitary3"] = {
        Name = "Advanced Military Atmospheric Engine",
        FullName = "Advanced Military Atmospheric Engine L",
        NqId = 2559369183,
        NqRecipeId = 1947882315,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineSmallMilitary3"] = {
        Name = "Advanced Military Atmospheric Engine",
        FullName = "Advanced Military Atmospheric Engine S",
        NqId = 385121456,
        NqRecipeId = 195371964,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineMediumMilitary3"] = {
        Name = "Advanced Military Atmospheric Engine",
        FullName = "Advanced Military Atmospheric Engine M",
        NqId = 790956353,
        NqRecipeId = 1136983701,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineXtraSmallMilitary3"] = {
        Name = "Advanced Military Atmospheric Engine",
        FullName = "Advanced Military Atmospheric Engine XS",
        NqId = 2472120802,
        NqRecipeId = 683249657,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["SpaceEngineSmallMilitary3"] = {
        Name = "Advanced Military Space Engine",
        FullName = "Advanced Military Space Engine S",
        NqId = 2510194716,
        NqRecipeId = 591761625,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineLargeMilitary3"] = {
        Name = "Advanced Military Space Engine",
        FullName = "Advanced Military Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineXtraLargeMilitary3"] = {
        Name = "Advanced Military Space Engine",
        FullName = "Advanced Military Space Engine XL",
        NqId = 934426297,
        NqRecipeId = 245643338,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineMediumMilitary3"] = {
        Name = "Advanced Military Space Engine",
        FullName = "Advanced Military Space Engine M",
        NqId = 37629188,
        NqRecipeId = 1469676520,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineXtraSmallMilitary3"] = {
        Name = "Advanced Military Space Engine",
        FullName = "Advanced Military Space Engine XS",
        NqId = 1754053134,
        NqRecipeId = 1516385409,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["AdvancedMiningUnitL"] = {
        Name = "Advanced Mining Unit",
        FullName = "Advanced Mining Unit L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["silo_3_m"] = {
        Name = "Advanced Missile Silo",
        FullName = "Advanced Missile Silo M",
        NqId = 3857142113,
        NqRecipeId = 1764038113,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_3_l"] = {
        Name = "Advanced Missile Silo",
        FullName = "Advanced Missile Silo L",
        NqId = 3857142112,
        NqRecipeId = 1764038112,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_3_xs"] = {
        Name = "Advanced Missile Silo",
        FullName = "Advanced Missile Silo XS",
        NqId = 3026385661,
        NqRecipeId = 1759717725,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_3_s"] = {
        Name = "Advanced Missile Silo",
        FullName = "Advanced Missile Silo S",
        NqId = 3857142123,
        NqRecipeId = 1764038123,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["mobilepanel_3_m"] = {
        Name = "Advanced Mobile Panel",
        FullName = "Advanced Mobile Panel M",
        NqId = 494821863,
        NqRecipeId = 2096236588,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_3_l"] = {
        Name = "Advanced Mobile Panel",
        FullName = "Advanced Mobile Panel L",
        NqId = 494821860,
        NqRecipeId = 2096236589,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_3_s"] = {
        Name = "Advanced Mobile Panel",
        FullName = "Advanced Mobile Panel S",
        NqId = 494821869,
        NqRecipeId = 2096236758,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_3_xl"] = {
        Name = "Advanced Mobile Panel",
        FullName = "Advanced Mobile Panel XL",
        NqId = 408022865,
        NqRecipeId = 84162632,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_3_xs"] = {
        Name = "Advanced Mobile Panel",
        FullName = "Advanced Mobile Panel XS",
        NqId = 408022872,
        NqRecipeId = 84162673,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["motherboard_3_m"] = {
        Name = "Advanced Motherboard",
        FullName = "Advanced Motherboard M",
        NqId = 242607950,
        NqRecipeId = 1015245616,
        GroupId = "08d8a31f-513f-416a-8aa8-feef8eb07587"
    },
    ["optics_3"] = {
        Name = "Advanced Optics",
        FullName = "Advanced Optics",
        NqId = 3739200049,
        NqRecipeId = 73420194,
        GroupId = "08d8a31f-5101-4014-86b8-ac0ddcd19eb2"
    },
    ["orescanner_3_l"] = {
        Name = "Advanced Ore Scanner",
        FullName = "Advanced Ore Scanner L",
        NqId = 3501536208,
        NqRecipeId = 260205291,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["RadarPVPSpaceSmallPhasedarray3"] = {
        Name = "Advanced Phased-Array Space Radar",
        FullName = "Advanced Phased-Array Space Radar S",
        NqId = 809783408,
        NqRecipeId = 1710615316,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceMediumPhasedarray3"] = {
        Name = "Advanced Phased-Array Space Radar",
        FullName = "Advanced Phased-Array Space Radar M",
        NqId = 1707018154,
        NqRecipeId = 1852711353,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargePhasedarray3"] = {
        Name = "Advanced Phased-Array Space Radar",
        FullName = "Advanced Phased-Array Space Radar L",
        NqId = 2075264944,
        NqRecipeId = 316271441,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["pipe_3"] = {
        Name = "Advanced Pipe",
        FullName = "Advanced Pipe",
        NqId = 1799107244,
        NqRecipeId = 1552883210,
        GroupId = "08d8a31f-5156-4065-8e1d-13c14baf06cd"
    },
    ["powersystem_3"] = {
        Name = "Advanced Power System",
        FullName = "Advanced Power System",
        NqId = 527681753,
        NqRecipeId = 1458022882,
        GroupId = "08d8a31f-5102-4a00-82ae-1521925be2a3"
    },
    ["powerconvertor_3_m"] = {
        Name = "Advanced Power Transformer",
        FullName = "Advanced Power Transformer M",
        NqId = 4186198417,
        NqRecipeId = 1365686171,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["WeaponCannonLargePrecision3"] = {
        Name = "Advanced Precision Cannon",
        FullName = "Advanced Precision Cannon L",
        NqId = 845167470,
        NqRecipeId = 1439705095,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonExtraSmallPrecision3"] = {
        Name = "Advanced Precision Cannon",
        FullName = "Advanced Precision Cannon XS",
        NqId = 3455226645,
        NqRecipeId = 1861248030,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonSmallPrecision3"] = {
        Name = "Advanced Precision Cannon",
        FullName = "Advanced Precision Cannon S",
        NqId = 3567179843,
        NqRecipeId = 2083650540,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonMediumPrecision3"] = {
        Name = "Advanced Precision Cannon",
        FullName = "Advanced Precision Cannon M",
        NqId = 2457342404,
        NqRecipeId = 1693863577,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponLaserExtraSmallPrecision3"] = {
        Name = "Advanced Precision Laser",
        FullName = "Advanced Precision Laser XS",
        NqId = 1604660449,
        NqRecipeId = 211643283,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargePrecision3"] = {
        Name = "Advanced Precision Laser",
        FullName = "Advanced Precision Laser L",
        NqId = 2356629408,
        NqRecipeId = 282920723,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumPrecision3"] = {
        Name = "Advanced Precision Laser",
        FullName = "Advanced Precision Laser M",
        NqId = 3840109424,
        NqRecipeId = 1867707064,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallPrecision3"] = {
        Name = "Advanced Precision Laser",
        FullName = "Advanced Precision Laser S",
        NqId = 3730148334,
        NqRecipeId = 1823871676,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargePrecision3"] = {
        Name = "Advanced Precision Missile",
        FullName = "Advanced Precision Missile L",
        NqId = 1205879485,
        NqRecipeId = 221816653,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileExtraSmallPrecision3"] = {
        Name = "Advanced Precision Missile",
        FullName = "Advanced Precision Missile XS",
        NqId = 2239993844,
        NqRecipeId = 1590398414,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileSmallPrecision3"] = {
        Name = "Advanced Precision Missile",
        FullName = "Advanced Precision Missile S",
        NqId = 2668363439,
        NqRecipeId = 1082750842,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponMissileMediumPrecision3"] = {
        Name = "Advanced Precision Missile",
        FullName = "Advanced Precision Missile M",
        NqId = 1217643701,
        NqRecipeId = 398759702,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponRailgunLargePrecision3"] = {
        Name = "Advanced Precision Railgun",
        FullName = "Advanced Precision Railgun L",
        NqId = 2916726762,
        NqRecipeId = 1655982713,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallPrecision3"] = {
        Name = "Advanced Precision Railgun",
        FullName = "Advanced Precision Railgun S",
        NqId = 831043069,
        NqRecipeId = 852069128,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunMediumPrecision3"] = {
        Name = "Advanced Precision Railgun",
        FullName = "Advanced Precision Railgun M",
        NqId = 111253038,
        NqRecipeId = 640256504,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallPrecision3"] = {
        Name = "Advanced Precision Railgun",
        FullName = "Advanced Precision Railgun XS",
        NqId = 690643397,
        NqRecipeId = 449173927,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["processor_3"] = {
        Name = "Advanced Processor",
        FullName = "Advanced Processor",
        NqId = 3808417020,
        NqRecipeId = 1297444736,
        GroupId = "08d8a31f-5111-4aca-84b0-6fa69942144b"
    },
    ["RadarPVPSpaceMediumProtected3"] = {
        Name = "Advanced Protected Space Radar",
        FullName = "Advanced Protected Space Radar M",
        NqId = 3060580950,
        NqRecipeId = 1962270581,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargeProtected3"] = {
        Name = "Advanced Protected Space Radar",
        FullName = "Advanced Protected Space Radar L",
        NqId = 3250064332,
        NqRecipeId = 1395894640,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceSmallProtected3"] = {
        Name = "Advanced Protected Space Radar",
        FullName = "Advanced Protected Space Radar S",
        NqId = 2375197139,
        NqRecipeId = 890188945,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["quantumalignmentunit_3"] = {
        Name = "Advanced Quantum Alignment Unit",
        FullName = "Advanced Quantum Alignment Unit",
        NqId = 2601646636,
        NqRecipeId = 1150226654,
        GroupId = "08d8a31f-5121-4056-803b-0a9105e28ff4"
    },
    ["quantumbarrier_3"] = {
        Name = "Advanced Quantum Barrier",
        FullName = "Advanced Quantum Barrier",
        NqId = 984088007,
        NqRecipeId = 381576797,
        GroupId = "08d8a31f-5122-4b31-88cb-9a69fc0c4c95"
    },
    ["quantumcore_3"] = {
        Name = "Advanced Quantum Core",
        FullName = "Advanced Quantum Core",
        NqId = 850241764,
        NqRecipeId = 1457246786,
        GroupId = "08d8a31f-5114-4794-8c3c-f3756c8d4ca9"
    },
    ["RadarPVPSpaceMediumQuickwired3"] = {
        Name = "Advanced Quick-Wired Space Radar",
        FullName = "Advanced Quick-Wired Space Radar M",
        NqId = 2608116212,
        NqRecipeId = 1615649743,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargeQuickwired3"] = {
        Name = "Advanced Quick-Wired Space Radar",
        FullName = "Advanced Quick-Wired Space Radar L",
        NqId = 3612800224,
        NqRecipeId = 1773946999,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceSmallQuickwired3"] = {
        Name = "Advanced Quick-Wired Space Radar",
        FullName = "Advanced Quick-Wired Space Radar S",
        NqId = 838245688,
        NqRecipeId = 1511409843,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["IndustryRecycler3"] = {
        Name = "Advanced Recycler",
        FullName = "Advanced Recycler M",
        NqId = 3264314259,
        NqRecipeId = 1952786489,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["IndustryRefiner3"] = {
        Name = "Advanced Refiner",
        FullName = "Advanced Refiner M",
        NqId = 584577124,
        NqRecipeId = 1597739670,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["reinforcedframe_3_xs"] = {
        Name = "Advanced Reinforced Frame",
        FullName = "Advanced Reinforced Frame XS",
        NqId = 1179601457,
        NqRecipeId = 494352223,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_3_xl"] = {
        Name = "Advanced Reinforced Frame",
        FullName = "Advanced Reinforced Frame XL",
        NqId = 1179601462,
        NqRecipeId = 494352212,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_3_s"] = {
        Name = "Advanced Reinforced Frame",
        FullName = "Advanced Reinforced Frame S",
        NqId = 994058059,
        NqRecipeId = 264385523,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_3_l"] = {
        Name = "Advanced Reinforced Frame",
        FullName = "Advanced Reinforced Frame L",
        NqId = 994058066,
        NqRecipeId = 264385482,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_3_m"] = {
        Name = "Advanced Reinforced Frame",
        FullName = "Advanced Reinforced Frame M",
        NqId = 994058069,
        NqRecipeId = 264385481,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["roboticarm_3_m"] = {
        Name = "Advanced Robotic Arm",
        FullName = "Advanced Robotic Arm M",
        NqId = 997368670,
        NqRecipeId = 1977408761,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["AtmosphericEngineXtraSmallSafe3"] = {
        Name = "Advanced Safe Atmospheric Engine",
        FullName = "Advanced Safe Atmospheric Engine XS",
        NqId = 3612851279,
        NqRecipeId = 1754203578,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineMediumSafe3"] = {
        Name = "Advanced Safe Atmospheric Engine",
        FullName = "Advanced Safe Atmospheric Engine M",
        NqId = 2370891601,
        NqRecipeId = 1786777582,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineLargeSafe3"] = {
        Name = "Advanced Safe Atmospheric Engine",
        FullName = "Advanced Safe Atmospheric Engine L",
        NqId = 3211645339,
        NqRecipeId = 1844825273,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineSmallSafe3"] = {
        Name = "Advanced Safe Atmospheric Engine",
        FullName = "Advanced Safe Atmospheric Engine S",
        NqId = 3689697794,
        NqRecipeId = 1370788426,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["SpaceEngineSmallSafe3"] = {
        Name = "Advanced Safe Space Engine",
        FullName = "Advanced Safe Space Engine S",
        NqId = 2682344779,
        NqRecipeId = 705850369,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineMediumSafe3"] = {
        Name = "Advanced Safe Space Engine",
        FullName = "Advanced Safe Space Engine M",
        NqId = 1326315524,
        NqRecipeId = 655633790,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineLargeSafe3"] = {
        Name = "Advanced Safe Space Engine",
        FullName = "Advanced Safe Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineXtraSmallSafe3"] = {
        Name = "Advanced Safe Space Engine",
        FullName = "Advanced Safe Space Engine XS",
        NqId = 175947629,
        NqRecipeId = 1368998304,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineXtraLargeSafe3"] = {
        Name = "Advanced Safe Space Engine",
        FullName = "Advanced Safe Space Engine XL",
        NqId = 3478227881,
        NqRecipeId = 270998447,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["screen_3_xs"] = {
        Name = "Advanced Screen",
        FullName = "Advanced Screen XS",
        NqId = 1428608303,
        NqRecipeId = 1841894563,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screen_3_xl"] = {
        Name = "Advanced Screen",
        FullName = "Advanced Screen XL",
        NqId = 1428608292,
        NqRecipeId = 1841894564,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screw_3"] = {
        Name = "Advanced Screw",
        FullName = "Advanced Screw",
        NqId = 3936127017,
        NqRecipeId = 1417946488,
        GroupId = "08d8a31f-5157-4dcc-8d91-4ff49c7b7779"
    },
    ["singularitycontainer_3"] = {
        Name = "Advanced Singularity Container",
        FullName = "Advanced Singularity Container",
        NqId = 3640212312,
        NqRecipeId = 1213600946,
        GroupId = "08d8a31f-5116-4472-84d8-1cf2de11b3a3"
    },
    ["IndustrySmelter3"] = {
        Name = "Advanced Smelter",
        FullName = "Advanced Smelter M",
        NqId = 1132446361,
        NqRecipeId = 1137084675,
        GroupId = "08d8a31f-4ff7-48c6-8b50-938b89fda68f"
    },
    ["warhead_3"] = {
        Name = "Advanced Solid Warhead",
        FullName = "Advanced Solid Warhead",
        NqId = 2599686739,
        NqRecipeId = 1467453994,
        GroupId = "08d8a31f-5118-4af9-8fa6-99c7635be381"
    },
    ["standardframe_3_s"] = {
        Name = "Advanced Standard Frame",
        FullName = "Advanced Standard Frame S",
        NqId = 1981363796,
        NqRecipeId = 461761384,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_3_l"] = {
        Name = "Advanced Standard Frame",
        FullName = "Advanced Standard Frame L",
        NqId = 1981362607,
        NqRecipeId = 461761377,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_3_m"] = {
        Name = "Advanced Standard Frame",
        FullName = "Advanced Standard Frame M",
        NqId = 1981362606,
        NqRecipeId = 461761378,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_3_xl"] = {
        Name = "Advanced Standard Frame",
        FullName = "Advanced Standard Frame XL",
        NqId = 873622058,
        NqRecipeId = 487996205,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_3_xs"] = {
        Name = "Advanced Standard Frame",
        FullName = "Advanced Standard Frame XS",
        NqId = 873622227,
        NqRecipeId = 487996202,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["FunctionalPart3"] = {
        Name = "Advanced Structural Parts",
        FullName = "Advanced Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5124-4830-8c0e-147fd07bdd38"
    },
    ["StructuralPart3"] = {
        Name = "Advanced Structural Parts",
        FullName = "Advanced Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5159-4bb2-877d-6d69aec28495"
    },
    ["AgLiReinforcedGlassProduct"] = {
        Name = "Ag-Li Reinforced glass product",
        FullName = "Ag-Li Reinforced glass product",
        NqId = 2301749833,
        NqRecipeId = 1962282521,
        GroupId = "08d8a31f-50cb-451e-8b92-1451ab8f4b38"
    },
    ["hcAlLiAged"] = {
        Name = "Aged Al-Li",
        FullName = "Aged Al-Li",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumAged"] = {
        Name = "Aged Aluminium",
        FullName = "Aged Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["MarbleTileHCBeigeColdD"] = {
        Name = "Aged beige pattern marble (cold)",
        FullName = "Aged beige pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBeigeD"] = {
        Name = "Aged beige pattern plastic",
        FullName = "Aged beige pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBeigeColdD"] = {
        Name = "Aged beige pattern plastic (cold)",
        FullName = "Aged beige pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBeigeD"] = {
        Name = "Aged beige pattern steel",
        FullName = "Aged beige pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleTileHCBlueColdD"] = {
        Name = "Aged blue pattern marble (cold)",
        FullName = "Aged blue pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBlueD"] = {
        Name = "Aged blue pattern plastic",
        FullName = "Aged blue pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBlueColdD"] = {
        Name = "Aged blue pattern plastic (cold)",
        FullName = "Aged blue pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBlueD"] = {
        Name = "Aged blue pattern steel",
        FullName = "Aged blue pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["WoodTileHCBrown01D"] = {
        Name = "Aged brown pattern wood 1",
        FullName = "Aged brown pattern wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown02D"] = {
        Name = "Aged brown pattern wood 2",
        FullName = "Aged brown pattern wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown03D"] = {
        Name = "Aged brown pattern wood 3",
        FullName = "Aged brown pattern wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown04D"] = {
        Name = "Aged brown pattern wood 4",
        FullName = "Aged brown pattern wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["hcCalciumAged"] = {
        Name = "Aged Calcium",
        FullName = "Aged Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonAged"] = {
        Name = "Aged Carbon",
        FullName = "Aged Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumAged"] = {
        Name = "Aged Chromium",
        FullName = "Aged Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltAged"] = {
        Name = "Aged Cobalt",
        FullName = "Aged Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperAged"] = {
        Name = "Aged Copper",
        FullName = "Aged Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminAged"] = {
        Name = "Aged Duralumin",
        FullName = "Aged Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorineAged"] = {
        Name = "Aged Fluorine",
        FullName = "Aged Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldAged"] = {
        Name = "Aged Gold",
        FullName = "Aged Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyAged"] = {
        Name = "Aged Grade 5 Titanium Alloy",
        FullName = "Aged Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["CopperMattHCGrayD"] = {
        Name = "Aged gray Copper",
        FullName = "Aged gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["AluminiumTileHCGrayD"] = {
        Name = "Aged gray pattern aluminium",
        FullName = "Aged gray pattern aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["BrickTileHCGrayD"] = {
        Name = "Aged gray pattern brick",
        FullName = "Aged gray pattern brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberTileHCGrayD"] = {
        Name = "Aged gray pattern carbon fiber",
        FullName = "Aged gray pattern carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ChromiumTileHCGrayD"] = {
        Name = "Aged gray pattern Chromium",
        FullName = "Aged gray pattern Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["ConcreteTileHCGrayD"] = {
        Name = "Aged gray pattern concrete",
        FullName = "Aged gray pattern concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["CopperTileHCGrayD"] = {
        Name = "Aged gray pattern Copper",
        FullName = "Aged gray pattern Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldTileHCGrayD"] = {
        Name = "Aged gray pattern Gold",
        FullName = "Aged gray pattern Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronTileHCGrayD"] = {
        Name = "Aged gray pattern iron",
        FullName = "Aged gray pattern iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleTileHCGrayD"] = {
        Name = "Aged gray pattern marble",
        FullName = "Aged gray pattern marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGrayD"] = {
        Name = "Aged gray pattern plastic",
        FullName = "Aged gray pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGrayD"] = {
        Name = "Aged gray pattern steel",
        FullName = "Aged gray pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumTileHCGrayD"] = {
        Name = "Aged gray pattern Titanium",
        FullName = "Aged gray pattern Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodTileHCGrayD"] = {
        Name = "Aged gray pattern wood",
        FullName = "Aged gray pattern wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleTileHCGreenColdD"] = {
        Name = "Aged green pattern marble (cold)",
        FullName = "Aged green pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGreenD"] = {
        Name = "Aged green pattern plastic",
        FullName = "Aged green pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCGreenColdD"] = {
        Name = "Aged green pattern plastic (cold)",
        FullName = "Aged green pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGreenD"] = {
        Name = "Aged green pattern steel",
        FullName = "Aged green pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcInconelAged"] = {
        Name = "Aged Inconel",
        FullName = "Aged Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronAged"] = {
        Name = "Aged Iron",
        FullName = "Aged Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumAged"] = {
        Name = "Aged Lithium",
        FullName = "Aged Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyAged"] = {
        Name = "Aged Mangalloy",
        FullName = "Aged Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganeseAged"] = {
        Name = "Aged Manganese",
        FullName = "Aged Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelAged"] = {
        Name = "Aged Maraging Steel",
        FullName = "Aged Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelAged"] = {
        Name = "Aged Nickel",
        FullName = "Aged Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumAged"] = {
        Name = "Aged Niobium",
        FullName = "Aged Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleTileHCOrangeColdD"] = {
        Name = "Aged orange pattern marble (cold)",
        FullName = "Aged orange pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCOrangeD"] = {
        Name = "Aged orange pattern plastic",
        FullName = "Aged orange pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCOrangeColdD"] = {
        Name = "Aged orange pattern plastic (cold)",
        FullName = "Aged orange pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCOrangeD"] = {
        Name = "Aged orange pattern steel",
        FullName = "Aged orange pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["BrickTileHCBrick01D"] = {
        Name = "Aged pattern brick 1",
        FullName = "Aged pattern brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick02D"] = {
        Name = "Aged pattern brick 2",
        FullName = "Aged pattern brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick03D"] = {
        Name = "Aged pattern brick 3",
        FullName = "Aged pattern brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick04D"] = {
        Name = "Aged pattern brick 4",
        FullName = "Aged pattern brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["MarbleTileHCRedColdD"] = {
        Name = "Aged red pattern marble (cold)",
        FullName = "Aged red pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCRedD"] = {
        Name = "Aged red pattern plastic",
        FullName = "Aged red pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCRedColdD"] = {
        Name = "Aged red pattern plastic (cold)",
        FullName = "Aged red pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCRedD"] = {
        Name = "Aged red pattern steel",
        FullName = "Aged red pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcScAlAged"] = {
        Name = "Aged Sc-Al",
        FullName = "Aged Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumAged"] = {
        Name = "Aged Scandium",
        FullName = "Aged Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconAged"] = {
        Name = "Aged Silicon",
        FullName = "Aged Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminAged"] = {
        Name = "Aged Silumin",
        FullName = "Aged Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverAged"] = {
        Name = "Aged Silver",
        FullName = "Aged Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumAged"] = {
        Name = "Aged Sodium",
        FullName = "Aged Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelAged"] = {
        Name = "Aged Stainless Steel",
        FullName = "Aged Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelAged"] = {
        Name = "Aged Steel",
        FullName = "Aged Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurAged"] = {
        Name = "Aged Sulfur",
        FullName = "Aged Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumAged"] = {
        Name = "Aged Titanium",
        FullName = "Aged Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumAged"] = {
        Name = "Aged Vanadium",
        FullName = "Aged Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["MarbleTileHCYellowColdD"] = {
        Name = "Aged yellow pattern marble (cold)",
        FullName = "Aged yellow pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCYellowD"] = {
        Name = "Aged yellow pattern plastic",
        FullName = "Aged yellow pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCYellowColdD"] = {
        Name = "Aged yellow pattern plastic (cold)",
        FullName = "Aged yellow pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCYellowD"] = {
        Name = "Aged yellow pattern steel",
        FullName = "Aged yellow pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AileronMedium2"] = {
        Name = "Aileron",
        FullName = "Aileron S",
        NqId = 2737703104,
        NqRecipeId = 146848992,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["AileronSmall2"] = {
        Name = "Aileron",
        FullName = "Aileron XS",
        NqId = 2292270972,
        NqRecipeId = 1254660860,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["AileronLarge2"] = {
        Name = "Aileron",
        FullName = "Aileron M",
        NqId = 1856288931,
        NqRecipeId = 780670243,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["Door_Industrial_01"] = {
        Name = "Airlock",
        FullName = "Airlock",
        NqId = 4249659729,
        NqRecipeId = 100635561,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["AlFeProduct"] = {
        Name = "Al-Fe Alloy product",
        FullName = "Al-Fe Alloy product",
        NqId = 18262914,
        NqRecipeId = 553755522,
        GroupId = "08d8a31f-50c9-4c0d-8195-ca76d714eca0"
    },
    ["AlLiProduct"] = {
        Name = "Al-Li Alloy product",
        FullName = "Al-Li Alloy product",
        NqId = 2021406770,
        NqRecipeId = 1618735154,
        GroupId = "08d8a31f-50ce-45fd-88b9-0da7fa7c4e5a"
    },
    ["hcAlLiPaintedBlack"] = {
        Name = "Al-Li Painted Black",
        FullName = "Al-Li Painted Black",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedDarkGray"] = {
        Name = "Al-Li Painted Dark Gray",
        FullName = "Al-Li Painted Dark Gray",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedGray"] = {
        Name = "Al-Li Painted Gray",
        FullName = "Al-Li Painted Gray",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedGreen"] = {
        Name = "Al-Li Painted Green",
        FullName = "Al-Li Painted Green",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedIce"] = {
        Name = "Al-Li Painted Ice",
        FullName = "Al-Li Painted Ice",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedLightGray"] = {
        Name = "Al-Li Painted Light Gray",
        FullName = "Al-Li Painted Light Gray",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedMilitary"] = {
        Name = "Al-Li Painted Military",
        FullName = "Al-Li Painted Military",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedOrange"] = {
        Name = "Al-Li Painted Orange",
        FullName = "Al-Li Painted Orange",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedPurple"] = {
        Name = "Al-Li Painted Purple",
        FullName = "Al-Li Painted Purple",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedRed"] = {
        Name = "Al-Li Painted Red",
        FullName = "Al-Li Painted Red",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedSky"] = {
        Name = "Al-Li Painted Sky",
        FullName = "Al-Li Painted Sky",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedWhite"] = {
        Name = "Al-Li Painted White",
        FullName = "Al-Li Painted White",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAlLiPaintedYellow"] = {
        Name = "Al-Li Painted Yellow",
        FullName = "Al-Li Painted Yellow",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["AluminiumScrap"] = {
        Name = "Aluminium Scrap",
        FullName = "Aluminium Scrap",
        NqId = 2417840347,
        NqRecipeId = 2042921083,
        GroupId = "08d8a31f-4f35-4e5c-84a4-fca5d5dc27d0"
    },
    ["AmmoContainerLarge"] = {
        Name = "Ammo Container L",
        FullName = "Ammo Container L M",
        NqId = 923167511,
        NqRecipeId = 1659321663,
        GroupId = "08d8a31f-4fcc-40fe-8e92-9fd90394d5c2"
    },
    ["AmmoContainerMedium"] = {
        Name = "Ammo Container M",
        FullName = "Ammo Container M S",
        NqId = 2300179701,
        NqRecipeId = 24966943,
        GroupId = "08d8a31f-4fcc-40fe-8e92-9fd90394d5c2"
    },
    ["AmmoContainerSmall"] = {
        Name = "Ammo Container S",
        FullName = "Ammo Container S XS",
        NqId = 300986010,
        NqRecipeId = 151846342,
        GroupId = "08d8a31f-4fcc-40fe-8e92-9fd90394d5c2"
    },
    ["AmmoContainerXL"] = {
        Name = "Ammo Container XL",
        FullName = "Ammo Container XL L",
        NqId = 50309297,
        NqRecipeId = 772867545,
        GroupId = "08d8a31f-4fcc-40fe-8e92-9fd90394d5c2"
    },
    ["AndOperator"] = {
        Name = "AND operator",
        FullName = "AND operator",
        NqId = 2569152632,
        NqRecipeId = 474017912,
        GroupId = "08d8a31f-4fb1-442b-8fc2-10174c5f2de7"
    },
    ["AntennaSmall"] = {
        Name = "Antenna",
        FullName = "Antenna S",
        NqId = 1951235468,
        NqRecipeId = 1395780492,
        GroupId = "08d8a31f-4f9a-4880-858a-ee06a30f596f"
    },
    ["AntennaMedium"] = {
        Name = "Antenna",
        FullName = "Antenna M",
        NqId = 206489025,
        NqRecipeId = 297425729,
        GroupId = "08d8a31f-4f9a-4880-858a-ee06a30f596f"
    },
    ["AntennaLarge"] = {
        Name = "Antenna",
        FullName = "Antenna L",
        NqId = 413322747,
        NqRecipeId = 648046587,
        GroupId = "08d8a31f-4f9a-4880-858a-ee06a30f596f"
    },
    ["AntiGravityGeneratorSmall"] = {
        Name = "Anti-Gravity Generator",
        FullName = "Anti-Gravity Generator S",
        NqId = 3997343699,
        NqRecipeId = 1026698119,
        GroupId = "08d8a31f-5039-4ac2-8dd4-f772449bde46"
    },
    ["AntiGravityGeneratorMedium"] = {
        Name = "Anti-Gravity Generator",
        FullName = "Anti-Gravity Generator M",
        NqId = 233079829,
        NqRecipeId = 843904620,
        GroupId = "08d8a31f-5039-4ac2-8dd4-f772449bde46"
    },
    ["AntiGravityGeneratorLarge"] = {
        Name = "Anti-Gravity Generator",
        FullName = "Anti-Gravity Generator L",
        NqId = 294414265,
        NqRecipeId = 815285343,
        GroupId = "08d8a31f-5039-4ac2-8dd4-f772449bde46"
    },
    ["AntiGravityPulsor"] = {
        Name = "Anti-Gravity Pulsor",
        FullName = "Anti-Gravity Pulsor",
        NqId = 966816758,
        NqRecipeId = 844654094,
        GroupId = "08d8a31f-503a-4e3d-85d9-5912b60235b8"
    },
    ["WindowProtectionMedium"] = {
        Name = "Armored window",
        FullName = "Armored window M",
        NqId = 2158665549,
        NqRecipeId = 401722005,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowProtectionLarge"] = {
        Name = "Armored window",
        FullName = "Armored window L",
        NqId = 1804139232,
        NqRecipeId = 623838857,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowProtectionSmall"] = {
        Name = "Armored window",
        FullName = "Armored window S",
        NqId = 3014939922,
        NqRecipeId = 1371399468,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowProtectionXSmall"] = {
        Name = "Armored window",
        FullName = "Armored window XS",
        NqId = 515378511,
        NqRecipeId = 627502731,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["AirbrakeLarge"] = {
        Name = "Atmospheric Airbrake",
        FullName = "Atmospheric Airbrake L",
        NqId = 104971834,
        NqRecipeId = 1117541306,
        GroupId = "08d8a31f-501f-4537-8ac9-2f32d12c80e7"
    },
    ["AirbrakeMedium"] = {
        Name = "Atmospheric Airbrake",
        FullName = "Atmospheric Airbrake M",
        NqId = 2198271703,
        NqRecipeId = 1347234423,
        GroupId = "08d8a31f-501f-4537-8ac9-2f32d12c80e7"
    },
    ["AtmosphericFlap"] = {
        Name = "Atmospheric Airbrake",
        FullName = "Atmospheric Airbrake S",
        NqId = 65048663,
        NqRecipeId = 1145749935,
        GroupId = "08d8a31f-501f-4537-8ac9-2f32d12c80e7"
    },
    ["RadialAtmoFuelTank"] = {
        Name = "Atmospheric Fuel Tank",
        FullName = "Atmospheric Fuel Tank S",
        NqId = 2183619036,
        NqRecipeId = 413101336,
        GroupId = "08d8a31f-4fee-410d-8c46-78a8fae45bd0"
    },
    ["RadialAtmoFuelTankLarge"] = {
        Name = "Atmospheric Fuel Tank",
        FullName = "Atmospheric Fuel Tank L",
        NqId = 3039582547,
        NqRecipeId = 14297625,
        GroupId = "08d8a31f-4fee-410d-8c46-78a8fae45bd0"
    },
    ["RadialAtmoFuelTankMedium"] = {
        Name = "Atmospheric Fuel Tank",
        FullName = "Atmospheric Fuel Tank M",
        NqId = 3464628964,
        NqRecipeId = 896390419,
        GroupId = "08d8a31f-4fee-410d-8c46-78a8fae45bd0"
    },
    ["RadialAtmoFuelTankXSmall"] = {
        Name = "Atmospheric Fuel Tank",
        FullName = "Atmospheric Fuel Tank XS",
        NqId = 3273319200,
        NqRecipeId = 974361857,
        GroupId = "08d8a31f-4fee-410d-8c46-78a8fae45bd0"
    },
    ["RadarPVPSmall"] = {
        Name = "Atmospheric Radar",
        FullName = "Atmospheric Radar S",
        NqId = 4213791403,
        NqRecipeId = 779171115,
        GroupId = "08d8a31f-4f45-4085-87f8-ffa901c84555"
    },
    ["RadarPVPLarge"] = {
        Name = "Atmospheric Radar",
        FullName = "Atmospheric Radar L",
        NqId = 3094514782,
        NqRecipeId = 1117293278,
        GroupId = "08d8a31f-4f45-4085-87f8-ffa901c84555"
    },
    ["RadarPVPMedium"] = {
        Name = "Atmospheric Radar",
        FullName = "Atmospheric Radar M",
        NqId = 612626034,
        NqRecipeId = 220908946,
        GroupId = "08d8a31f-4f45-4085-87f8-ffa901c84555"
    },
    ["SacDeco01"] = {
        Name = "Bagged Plant A",
        FullName = "Bagged Plant A",
        NqId = 630574506,
        NqRecipeId = 1389186474,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["SacDeco02"] = {
        Name = "Bagged Plant B",
        FullName = "Bagged Plant B",
        NqId = 630574505,
        NqRecipeId = 1389186473,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["Barrier1M"] = {
        Name = "Barrier",
        FullName = "Barrier S",
        NqId = 3261824822,
        NqRecipeId = 1012072246,
        GroupId = "08d8a31f-4f9b-4f69-81fd-3d955a2c702a"
    },
    ["Barrier2M"] = {
        Name = "Barrier",
        FullName = "Barrier M",
        NqId = 3261824887,
        NqRecipeId = 1012072311,
        GroupId = "08d8a31f-4f9b-4f69-81fd-3d955a2c702a"
    },
    ["BarrierCorner"] = {
        Name = "Barrier corner",
        FullName = "Barrier corner",
        NqId = 1377211067,
        NqRecipeId = 340031035,
        GroupId = "08d8a31f-4f9b-4f69-81fd-3d955a2c702a"
    },
    ["Industry3DPrinter"] = {
        Name = "basic 3D Printer",
        FullName = "basic 3D Printer M",
        NqId = 409410678,
        NqRecipeId = 908248479,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["antenna_1_xl"] = {
        Name = "Basic Antenna",
        FullName = "Basic Antenna XL",
        NqId = 2301991355,
        NqRecipeId = 1784308897,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_1_s"] = {
        Name = "Basic Antenna",
        FullName = "Basic Antenna S",
        NqId = 1080826905,
        NqRecipeId = 1305968386,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_1_xs"] = {
        Name = "Basic Antenna",
        FullName = "Basic Antenna XS",
        NqId = 2301991330,
        NqRecipeId = 1784308906,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antimattercapsule_1"] = {
        Name = "Basic Antimatter Capsule",
        FullName = "Basic Antimatter Capsule",
        NqId = 3661595538,
        NqRecipeId = 1849145538,
        GroupId = "08d8a31f-50f4-4652-84b5-e015a2be2176"
    },
    ["IndustryAssemblyXS"] = {
        Name = "basic Assembly Line",
        FullName = "basic Assembly Line XS",
        NqId = 1762226876,
        NqRecipeId = 1275491270,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryAssemblyXL"] = {
        Name = "basic Assembly Line",
        FullName = "basic Assembly Line XL",
        NqId = 1762226819,
        NqRecipeId = 1275491293,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryAssemblyS"] = {
        Name = "basic Assembly Line",
        FullName = "basic Assembly Line S",
        NqId = 983225818,
        NqRecipeId = 2078992786,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryAssemblyM"] = {
        Name = "basic Assembly Line",
        FullName = "basic Assembly Line M",
        NqId = 983225808,
        NqRecipeId = 2078992796,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryAssemblyL"] = {
        Name = "basic Assembly Line",
        FullName = "basic Assembly Line L",
        NqId = 983225811,
        NqRecipeId = 2078992795,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["AtmosphericEngineSmall"] = {
        Name = "Basic Atmospheric Engine",
        FullName = "Basic Atmospheric Engine S",
        NqId = 2043566501,
        NqRecipeId = 595026340,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineLarge"] = {
        Name = "Basic Atmospheric Engine",
        FullName = "Basic Atmospheric Engine L",
        NqId = 2375915630,
        NqRecipeId = 475632708,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineMedium"] = {
        Name = "Basic Atmospheric Engine",
        FullName = "Basic Atmospheric Engine M",
        NqId = 4072611011,
        NqRecipeId = 1469974644,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineXtraSmall"] = {
        Name = "Basic Atmospheric Engine",
        FullName = "Basic Atmospheric Engine XS",
        NqId = 710193240,
        NqRecipeId = 1130341595,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["burner_1"] = {
        Name = "Basic Burner",
        FullName = "Basic Burner",
        NqId = 2660328728,
        NqRecipeId = 1272865110,
        GroupId = "08d8a31f-50f7-42af-8cbd-a4edf5ff865c"
    },
    ["casing_1_s"] = {
        Name = "Basic Casing",
        FullName = "Basic Casing S",
        NqId = 567008148,
        NqRecipeId = 669710505,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_1_xs"] = {
        Name = "Basic Casing",
        FullName = "Basic Casing XS",
        NqId = 946503935,
        NqRecipeId = 85630319,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["chemicalcontainer_1_xs"] = {
        Name = "Basic Chemical Container",
        FullName = "Basic Chemical Container XS",
        NqId = 3717621915,
        NqRecipeId = 713802609,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_1_xl"] = {
        Name = "Basic Chemical Container",
        FullName = "Basic Chemical Container XL",
        NqId = 3717621906,
        NqRecipeId = 713802568,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_1_s"] = {
        Name = "Basic Chemical Container",
        FullName = "Basic Chemical Container S",
        NqId = 625289720,
        NqRecipeId = 1815471308,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_1_m"] = {
        Name = "Basic Chemical Container",
        FullName = "Basic Chemical Container M",
        NqId = 625289726,
        NqRecipeId = 1815471302,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["chemicalcontainer_1_l"] = {
        Name = "Basic Chemical Container",
        FullName = "Basic Chemical Container L",
        NqId = 625289727,
        NqRecipeId = 1815471301,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["IndustryChemical"] = {
        Name = "basic Chemical industry",
        FullName = "basic Chemical industry M",
        NqId = 2681009434,
        NqRecipeId = 1230093356,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["combustionchamber_1_xs"] = {
        Name = "Basic Combustion Chamber",
        FullName = "Basic Combustion Chamber XS",
        NqId = 4017996241,
        NqRecipeId = 1138518028,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_1_s"] = {
        Name = "Basic Combustion Chamber",
        FullName = "Basic Combustion Chamber S",
        NqId = 2662317132,
        NqRecipeId = 1027882800,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_1_m"] = {
        Name = "Basic Combustion Chamber",
        FullName = "Basic Combustion Chamber M",
        NqId = 2662317126,
        NqRecipeId = 1027882814,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_1_l"] = {
        Name = "Basic Combustion Chamber",
        FullName = "Basic Combustion Chamber L",
        NqId = 2662317125,
        NqRecipeId = 1027882809,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["component_1"] = {
        Name = "Basic Component",
        FullName = "Basic Component",
        NqId = 794666749,
        NqRecipeId = 1319718943,
        GroupId = "08d8a31f-514e-4a1e-8d11-a8cd886bbec5"
    },
    ["connector_1"] = {
        Name = "Basic Connector",
        FullName = "Basic Connector",
        NqId = 2872711779,
        NqRecipeId = 1738589935,
        GroupId = "08d8a31f-5150-4814-89a1-12b878205d04"
    },
    ["controlsystem_1_m"] = {
        Name = "Basic Control System",
        FullName = "Basic Control System M",
        NqId = 3431996504,
        NqRecipeId = 1421956701,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["controlsystem_1_s"] = {
        Name = "Basic Control System",
        FullName = "Basic Control System S",
        NqId = 3431996502,
        NqRecipeId = 1421956679,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["controlsystem_1_xs"] = {
        Name = "Basic Control System",
        FullName = "Basic Control System XS",
        NqId = 972195890,
        NqRecipeId = 930875900,
        GroupId = "08d8a31f-5129-4a18-8a51-ce83d9d47055"
    },
    ["coresystem_1_s"] = {
        Name = "Basic Core System",
        FullName = "Basic Core System S",
        NqId = 1775106685,
        NqRecipeId = 962147240,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["coresystem_1_xs"] = {
        Name = "Basic Core System",
        FullName = "Basic Core System XS",
        NqId = 1172598456,
        NqRecipeId = 998481015,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["electricengine_1_s"] = {
        Name = "Basic Electric Engine",
        FullName = "Basic Electric Engine S",
        NqId = 3728054834,
        NqRecipeId = 1873130580,
        GroupId = "08d8a31f-5130-4606-83c5-095427038994"
    },
    ["electricengine_1_m"] = {
        Name = "Basic Electric Engine",
        FullName = "Basic Electric Engine M",
        NqId = 3728054836,
        NqRecipeId = 1873130574,
        GroupId = "08d8a31f-5130-4606-83c5-095427038994"
    },
    ["electronics_1"] = {
        Name = "Basic Electronics",
        FullName = "Basic Electronics",
        NqId = 1297540454,
        NqRecipeId = 1026118816,
        GroupId = "08d8a31f-50f8-4d6f-835c-9f32f00e2ee9"
    },
    ["IndustryElectronics"] = {
        Name = "basic Electronics industry",
        FullName = "basic Electronics industry M",
        NqId = 2702446443,
        NqRecipeId = 1809397339,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["igniter_1"] = {
        Name = "Basic Explosive Module",
        FullName = "Basic Explosive Module",
        NqId = 2541811486,
        NqRecipeId = 21951622,
        GroupId = "08d8a31f-50fc-42c6-8d1a-6c49298010f4"
    },
    ["firingsystem_1_xs"] = {
        Name = "Basic Firing System",
        FullName = "Basic Firing System XS",
        NqId = 3740092443,
        NqRecipeId = 985933174,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["fixation_1"] = {
        Name = "Basic Fixation",
        FullName = "Basic Fixation",
        NqId = 466630565,
        NqRecipeId = 577252173,
        GroupId = "08d8a31f-5152-45db-8c9a-415408681c9d"
    },
    ["gazcylinder_1_m"] = {
        Name = "Basic Gas Cylinder",
        FullName = "Basic Gas Cylinder M",
        NqId = 2119086168,
        NqRecipeId = 1194767567,
        GroupId = "08d8a31f-5132-41d8-87b7-bd86169677f5"
    },
    ["gazcylinder_1_s"] = {
        Name = "Basic Gas Cylinder",
        FullName = "Basic Gas Cylinder S",
        NqId = 2119086146,
        NqRecipeId = 1194767553,
        GroupId = "08d8a31f-5132-41d8-87b7-bd86169677f5"
    },
    ["gazcylinder_1_xs"] = {
        Name = "Basic Gas Cylinder",
        FullName = "Basic Gas Cylinder XS",
        NqId = 792299450,
        NqRecipeId = 981789849,
        GroupId = "08d8a31f-5132-41d8-87b7-bd86169677f5"
    },
    ["IndustryGlass"] = {
        Name = "basic Glass Furnace",
        FullName = "basic Glass Furnace M",
        NqId = 1215026169,
        NqRecipeId = 1197243001,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryHoneycomber"] = {
        Name = "basic Honeycomb Refinery",
        FullName = "basic Honeycomb Refinery M",
        NqId = 3857150880,
        NqRecipeId = 1837549935,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["hydraulics_1"] = {
        Name = "Basic hydraulics",
        FullName = "Basic hydraulics",
        NqId = 1331181119,
        NqRecipeId = 30135024,
        GroupId = "08d8a31f-50fa-4803-8ecf-b8ad089f721b"
    },
    ["injector_1"] = {
        Name = "Basic Injector",
        FullName = "Basic Injector",
        NqId = 1971447072,
        NqRecipeId = 1293038268,
        GroupId = "08d8a31f-50fd-4c12-8954-19ee8310de60"
    },
    ["ionicchamber_1_l"] = {
        Name = "Basic Ionic Chamber",
        FullName = "Basic Ionic Chamber L",
        NqId = 1390562878,
        NqRecipeId = 763768767,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_1_m"] = {
        Name = "Basic Ionic Chamber",
        FullName = "Basic Ionic Chamber M",
        NqId = 1390562879,
        NqRecipeId = 763768764,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_1_s"] = {
        Name = "Basic Ionic Chamber",
        FullName = "Basic Ionic Chamber S",
        NqId = 1390562873,
        NqRecipeId = 763768710,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_1_xl"] = {
        Name = "Basic Ionic Chamber",
        FullName = "Basic Ionic Chamber XL",
        NqId = 962712579,
        NqRecipeId = 648202060,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_1_xs"] = {
        Name = "Basic Ionic Chamber",
        FullName = "Basic Ionic Chamber XS",
        NqId = 962712586,
        NqRecipeId = 648202053,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["laserchamber_1_s"] = {
        Name = "Basic Laser Chamber",
        FullName = "Basic Laser Chamber S",
        NqId = 2825505990,
        NqRecipeId = 1825400295,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["led_1"] = {
        Name = "Basic LED",
        FullName = "Basic LED",
        NqId = 1234754162,
        NqRecipeId = 1137501015,
        GroupId = "08d8a31f-5154-4334-89e3-dd6bb40b753f"
    },
    ["magnet_1"] = {
        Name = "Basic Magnet",
        FullName = "Basic Magnet",
        NqId = 1246524878,
        NqRecipeId = 1949200608,
        GroupId = "08d8a31f-50ff-45dd-8793-4e9e09a6afd6"
    },
    ["mechanicalsensor_1_xs"] = {
        Name = "Basic Mechanical Sensor",
        FullName = "Basic Mechanical Sensor XS",
        NqId = 204444775,
        NqRecipeId = 353439746,
        GroupId = "08d8a31f-513b-460d-896b-c132d9265abd"
    },
    ["IndustryMetalwork"] = {
        Name = "basic Metalwork Industry",
        FullName = "basic Metalwork Industry M",
        NqId = 2022563937,
        NqRecipeId = 1113319562,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["BasicMiningUnitS"] = {
        Name = "Basic Mining Unit",
        FullName = "Basic Mining Unit S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["BasicMiningUnitL"] = {
        Name = "Basic Mining Unit",
        FullName = "Basic Mining Unit L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["mobilepanel_1_l"] = {
        Name = "Basic Mobile Panel",
        FullName = "Basic Mobile Panel L",
        NqId = 494825062,
        NqRecipeId = 2096261825,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_1_m"] = {
        Name = "Basic Mobile Panel",
        FullName = "Basic Mobile Panel M",
        NqId = 494825061,
        NqRecipeId = 2096261830,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_1_s"] = {
        Name = "Basic Mobile Panel",
        FullName = "Basic Mobile Panel S",
        NqId = 494825071,
        NqRecipeId = 2096261880,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_1_xl"] = {
        Name = "Basic Mobile Panel",
        FullName = "Basic Mobile Panel XL",
        NqId = 407690291,
        NqRecipeId = 117227225,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_1_xs"] = {
        Name = "Basic Mobile Panel",
        FullName = "Basic Mobile Panel XS",
        NqId = 407690298,
        NqRecipeId = 117227222,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["optics_1"] = {
        Name = "Basic Optics",
        FullName = "Basic Optics",
        NqId = 3739200051,
        NqRecipeId = 73420192,
        GroupId = "08d8a31f-5101-4014-86b8-ac0ddcd19eb2"
    },
    ["orescanner_1_l"] = {
        Name = "Basic Ore Scanner",
        FullName = "Basic Ore Scanner L",
        NqId = 3501535583,
        NqRecipeId = 260197199,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["orescanner_1_s"] = {
        Name = "Basic Ore Scanner",
        FullName = "Basic Ore Scanner S",
        NqId = 3501535556,
        NqRecipeId = 260197236,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["Basic_orescanner_2_S"] = {
        Name = "Basic Ore Scanner S",
        FullName = "Basic Ore Scanner S S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["pipe_1"] = {
        Name = "Basic Pipe",
        FullName = "Basic Pipe",
        NqId = 1799107246,
        NqRecipeId = 1552883208,
        GroupId = "08d8a31f-5156-4065-8e1d-13c14baf06cd"
    },
    ["powersystem_1"] = {
        Name = "Basic Power System",
        FullName = "Basic Power System",
        NqId = 527681755,
        NqRecipeId = 1458022880,
        GroupId = "08d8a31f-5102-4a00-82ae-1521925be2a3"
    },
    ["powerconvertor_1_m"] = {
        Name = "Basic Power Transformer",
        FullName = "Basic Power Transformer M",
        NqId = 4186205972,
        NqRecipeId = 1365333629,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["processor_1"] = {
        Name = "Basic Processor",
        FullName = "Basic Processor",
        NqId = 3808417022,
        NqRecipeId = 1297444766,
        GroupId = "08d8a31f-5111-4aca-84b0-6fa69942144b"
    },
    ["quantumcore_1"] = {
        Name = "Basic Quantum Core",
        FullName = "Basic Quantum Core",
        NqId = 850241766,
        NqRecipeId = 1457246784,
        GroupId = "08d8a31f-5114-4794-8c3c-f3756c8d4ca9"
    },
    ["IndustryRecycler"] = {
        Name = "basic Recycler",
        FullName = "basic Recycler M",
        NqId = 3914155468,
        NqRecipeId = 487570606,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["IndustryRefiner"] = {
        Name = "basic Refiner",
        FullName = "basic Refiner M",
        NqId = 3701755071,
        NqRecipeId = 1464958039,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["reinforcedframe_1_l"] = {
        Name = "Basic Reinforced Frame",
        FullName = "Basic Reinforced Frame L",
        NqId = 994058205,
        NqRecipeId = 266197949,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_1_xs"] = {
        Name = "Basic Reinforced Frame",
        FullName = "Basic Reinforced Frame XS",
        NqId = 1179610525,
        NqRecipeId = 376985783,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_1_xl"] = {
        Name = "Basic Reinforced Frame",
        FullName = "Basic Reinforced Frame XL",
        NqId = 1179610516,
        NqRecipeId = 376985790,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_1_s"] = {
        Name = "Basic Reinforced Frame",
        FullName = "Basic Reinforced Frame S",
        NqId = 994058182,
        NqRecipeId = 266197940,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_1_m"] = {
        Name = "Basic Reinforced Frame",
        FullName = "Basic Reinforced Frame M",
        NqId = 994058204,
        NqRecipeId = 266197938,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["roboticarm_1_m"] = {
        Name = "Basic Robotic Arm",
        FullName = "Basic Robotic Arm M",
        NqId = 997368796,
        NqRecipeId = 1977512378,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["roboticarm_1_xl"] = {
        Name = "Basic Robotic Arm",
        FullName = "Basic Robotic Arm XL",
        NqId = 2999955044,
        NqRecipeId = 1184172999,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["roboticarm_1_l"] = {
        Name = "Basic Robotic Arm",
        FullName = "Basic Robotic Arm L",
        NqId = 997368799,
        NqRecipeId = 1977512379,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["screen_1_s"] = {
        Name = "Basic Screen",
        FullName = "Basic Screen S",
        NqId = 184261422,
        NqRecipeId = 1609576749,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screen_1_m"] = {
        Name = "Basic Screen",
        FullName = "Basic Screen M",
        NqId = 184261412,
        NqRecipeId = 1609576747,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screw_1"] = {
        Name = "Basic Screw",
        FullName = "Basic Screw",
        NqId = 3936127019,
        NqRecipeId = 1417946494,
        GroupId = "08d8a31f-5157-4dcc-8d91-4ff49c7b7779"
    },
    ["singularitycontainer_1"] = {
        Name = "Basic Singularity Container",
        FullName = "Basic Singularity Container",
        NqId = 3640212318,
        NqRecipeId = 1213600944,
        GroupId = "08d8a31f-5116-4472-84d8-1cf2de11b3a3"
    },
    ["IndustrySmelter"] = {
        Name = "basic Smelter",
        FullName = "basic Smelter M",
        NqId = 2556123438,
        NqRecipeId = 960095718,
        GroupId = "08d8a31f-4ff4-4f95-8c28-dcc391a5635c"
    },
    ["SpaceEngineLarge"] = {
        Name = "Basic Space Engine",
        FullName = "Basic Space Engine L",
        NqId = 2495558023,
        NqRecipeId = 704266913,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineMedium"] = {
        Name = "Basic Space Engine",
        FullName = "Basic Space Engine M",
        NqId = 85796763,
        NqRecipeId = 1862323890,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineSmall"] = {
        Name = "Basic Space Engine",
        FullName = "Basic Space Engine S",
        NqId = 1326357437,
        NqRecipeId = 620123095,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraLarge"] = {
        Name = "Basic Space Engine",
        FullName = "Basic Space Engine XL",
        NqId = 2200254788,
        NqRecipeId = 1230590693,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineXtraSmall"] = {
        Name = "Basic Space Engine",
        FullName = "Basic Space Engine XS",
        NqId = 2243775376,
        NqRecipeId = 1347302260,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["standardframe_1_m"] = {
        Name = "Basic Standard Frame",
        FullName = "Basic Standard Frame M",
        NqId = 1981362473,
        NqRecipeId = 461590276,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_1_l"] = {
        Name = "Basic Standard Frame",
        FullName = "Basic Standard Frame L",
        NqId = 1981362474,
        NqRecipeId = 461590277,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_1_s"] = {
        Name = "Basic Standard Frame",
        FullName = "Basic Standard Frame S",
        NqId = 1981362643,
        NqRecipeId = 461590286,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_1_xs"] = {
        Name = "Basic Standard Frame",
        FullName = "Basic Standard Frame XS",
        NqId = 873663991,
        NqRecipeId = 510615335,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["StructuralPart1"] = {
        Name = "Basic Structural Parts",
        FullName = "Basic Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5159-4bb2-877d-6d69aec28495"
    },
    ["FunctionalPart1"] = {
        Name = "Basic Structural Parts",
        FullName = "Basic Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5124-4830-8c0e-147fd07bdd38"
    },
    ["AluminiumOre"] = {
        Name = "Bauxite",
        FullName = "Bauxite",
        NqId = 262147665,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50be-4dfa-8466-916146e77841"
    },
    ["WindowVeryLarge"] = {
        Name = "Bay window",
        FullName = "Bay window XL",
        NqId = 1952409967,
        NqRecipeId = 1390353079,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["Bed"] = {
        Name = "Bed",
        FullName = "Bed",
        NqId = 4216497731,
        NqRecipeId = 592619075,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["MarbleTileHCBeigeCold"] = {
        Name = "Beige pattern marble (cold)",
        FullName = "Beige pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBeige"] = {
        Name = "Beige pattern plastic",
        FullName = "Beige pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBeigeCold"] = {
        Name = "Beige pattern plastic(cold)",
        FullName = "Beige pattern plastic(cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBeige"] = {
        Name = "Beige pattern steel",
        FullName = "Beige pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["Bench"] = {
        Name = "Bench",
        FullName = "Bench",
        NqId = 542122758,
        NqRecipeId = 919610118,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["BiologicMatterProduct"] = {
        Name = "Biological matter product",
        FullName = "Biological matter product",
        NqId = 2646210914,
        NqRecipeId = 759450308,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["hcAlLiPanelBlack"] = {
        Name = "Black Al-Li Panel",
        FullName = "Black Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelBlack"] = {
        Name = "Black Aluminium Panel",
        FullName = "Black Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelBlack"] = {
        Name = "Black Calcium Panel",
        FullName = "Black Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelBlack"] = {
        Name = "Black Carbon Panel",
        FullName = "Black Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelBlack"] = {
        Name = "Black Chromium Panel",
        FullName = "Black Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelBlack"] = {
        Name = "Black Cobalt Panel",
        FullName = "Black Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelBlack"] = {
        Name = "Black Copper Panel",
        FullName = "Black Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelBlack"] = {
        Name = "Black Duralumin Panel",
        FullName = "Black Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelBlack"] = {
        Name = "Black Fluorine Panel",
        FullName = "Black Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelBlack"] = {
        Name = "Black Gold Panel",
        FullName = "Black Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelBlack"] = {
        Name = "Black Grade 5 Titanium Alloy Panel",
        FullName = "Black Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelBlack"] = {
        Name = "Black Inconel Panel",
        FullName = "Black Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelBlack"] = {
        Name = "Black Iron Panel",
        FullName = "Black Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelBlack"] = {
        Name = "Black Lithium Panel",
        FullName = "Black Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelBlack"] = {
        Name = "Black Mangalloy Panel",
        FullName = "Black Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelBlack"] = {
        Name = "Black Manganese Panel",
        FullName = "Black Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelBlack"] = {
        Name = "Black Maraging Steel Panel",
        FullName = "Black Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelBlack"] = {
        Name = "Black Nickel Panel",
        FullName = "Black Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelBlack"] = {
        Name = "Black Niobium Panel",
        FullName = "Black Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["AluminiumTileHCBlack"] = {
        Name = "Black pattern aluminium",
        FullName = "Black pattern aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["BrickTileHCBlack"] = {
        Name = "Black pattern brick",
        FullName = "Black pattern brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberTileHCBlack"] = {
        Name = "Black pattern carbon fiber",
        FullName = "Black pattern carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ChromiumTileHCBlack"] = {
        Name = "Black pattern Chromium",
        FullName = "Black pattern Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["ConcreteTileHCBlack"] = {
        Name = "Black pattern concrete",
        FullName = "Black pattern concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["CopperTileHCBlack"] = {
        Name = "Black pattern Copper",
        FullName = "Black pattern Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldTileHCBlack"] = {
        Name = "Black pattern Gold",
        FullName = "Black pattern Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronTileHCBlack"] = {
        Name = "Black pattern iron",
        FullName = "Black pattern iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleTileHCBlack"] = {
        Name = "Black pattern marble",
        FullName = "Black pattern marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBlack"] = {
        Name = "Black pattern plastic",
        FullName = "Black pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBlack"] = {
        Name = "Black pattern steel",
        FullName = "Black pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumTileHCBlack"] = {
        Name = "Black pattern Titanium",
        FullName = "Black pattern Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodTileHCBlack"] = {
        Name = "Black pattern wood",
        FullName = "Black pattern wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["hcScAlPanelBlack"] = {
        Name = "Black Sc-Al Panel",
        FullName = "Black Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelBlack"] = {
        Name = "Black Scandium Panel",
        FullName = "Black Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelBlack"] = {
        Name = "Black Silicon Panel",
        FullName = "Black Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelBlack"] = {
        Name = "Black Silumin Panel",
        FullName = "Black Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelBlack"] = {
        Name = "Black Silver Panel",
        FullName = "Black Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelBlack"] = {
        Name = "Black Sodium Panel",
        FullName = "Black Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelBlack"] = {
        Name = "Black Stainless Steel Panel",
        FullName = "Black Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelBlack"] = {
        Name = "Black Steel Panel",
        FullName = "Black Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelBlack"] = {
        Name = "Black Sulfur Panel",
        FullName = "Black Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelBlack"] = {
        Name = "Black Titanium Panel",
        FullName = "Black Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelBlack"] = {
        Name = "Black Vanadium Panel",
        FullName = "Black Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["MarbleTileHCBlueCold"] = {
        Name = "Blue pattern marble (cold)",
        FullName = "Blue pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBlue"] = {
        Name = "Blue pattern plastic",
        FullName = "Blue pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBlueCold"] = {
        Name = "Blue pattern plastic (cold)",
        FullName = "Blue pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBlue"] = {
        Name = "Blue pattern steel",
        FullName = "Blue pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["Bonsai"] = {
        Name = "Bonsai",
        FullName = "Bonsai",
        NqId = 2648123924,
        NqRecipeId = 1442261524,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["BrickProduct"] = {
        Name = "Brick Honeycomb",
        FullName = "Brick Honeycomb",
        NqId = 2679709617,
        NqRecipeId = 425366961,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["BrickTileHCBrick01"] = {
        Name = "Brick pattern 1",
        FullName = "Brick pattern 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick02"] = {
        Name = "Brick pattern 2",
        FullName = "Brick pattern 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick03"] = {
        Name = "Brick pattern 3",
        FullName = "Brick pattern 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick04"] = {
        Name = "Brick pattern 4",
        FullName = "Brick pattern 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["WoodTileHCBrown01"] = {
        Name = "Brown pattern wood 1",
        FullName = "Brown pattern wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown02"] = {
        Name = "Brown pattern wood 2",
        FullName = "Brown pattern wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown03"] = {
        Name = "Brown pattern wood 3",
        FullName = "Brown pattern wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown04"] = {
        Name = "Brown pattern wood 4",
        FullName = "Brown pattern wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["Cable2M01"] = {
        Name = "Cable Model A",
        FullName = "Cable Model A M",
        NqId = 1542146744,
        NqRecipeId = 1623706296,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["Cable1M01"] = {
        Name = "Cable Model A",
        FullName = "Cable Model A S",
        NqId = 1542390551,
        NqRecipeId = 1623950103,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["Cable2M02"] = {
        Name = "Cable Model B",
        FullName = "Cable Model B M",
        NqId = 1542146745,
        NqRecipeId = 1623706297,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["Cable1M02"] = {
        Name = "Cable Model B",
        FullName = "Cable Model B S",
        NqId = 1542390550,
        NqRecipeId = 1623950102,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["Cable2M03"] = {
        Name = "Cable Model C",
        FullName = "Cable Model C M",
        NqId = 1542146746,
        NqRecipeId = 1623706298,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["Cable1M03"] = {
        Name = "Cable Model C",
        FullName = "Cable Model C S",
        NqId = 1542390549,
        NqRecipeId = 1623950101,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["CalciumReinforcedCopperProduct"] = {
        Name = "Calcium Reinforced Copper product",
        FullName = "Calcium Reinforced Copper product",
        NqId = 1034957327,
        NqRecipeId = 568617531,
        GroupId = "08d8a31f-50c9-4c0d-8195-ca76d714eca0"
    },
    ["CalciumScrap"] = {
        Name = "Calcium Scrap",
        FullName = "Calcium Scrap",
        NqId = 1251531294,
        NqRecipeId = 644881438,
        GroupId = "08d8a31f-4f38-4b17-8db3-5c38bc239e22"
    },
    ["WeaponCannonLarge1"] = {
        Name = "cannon",
        FullName = "cannon L",
        NqId = 3289044684,
        NqRecipeId = 342558404,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonMedium1"] = {
        Name = "cannon",
        FullName = "cannon M",
        NqId = 1699425404,
        NqRecipeId = 1198164801,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmall1"] = {
        Name = "cannon",
        FullName = "cannon XS",
        NqId = 3741742452,
        NqRecipeId = 751642152,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonSmall1"] = {
        Name = "cannon",
        FullName = "cannon S",
        NqId = 1901919706,
        NqRecipeId = 1152603943,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["AmmoCannonExtraSmallKineticAdvancedAgile"] = {
        Name = "Cannon Agile Kinetic Ammo",
        FullName = "Cannon Agile Kinetic Ammo XS",
        NqId = 2746947552,
        NqRecipeId = 2110955633,
        GroupId = "08d8a31f-4f1a-45f6-8d85-4a03eb039b9d"
    },
    ["AmmoCannonMediumKineticAdvancedAgile"] = {
        Name = "Cannon Agile Kinetic Ammo",
        FullName = "Cannon Agile Kinetic Ammo M",
        NqId = 3901365200,
        NqRecipeId = 917135678,
        GroupId = "08d8a31f-4f1c-464f-883c-74275d7e94cd"
    },
    ["AmmoCannonSmallKineticAdvancedAgile"] = {
        Name = "Cannon Agile Kinetic Ammo",
        FullName = "Cannon Agile Kinetic Ammo S",
        NqId = 2048035010,
        NqRecipeId = 1170232047,
        GroupId = "08d8a31f-4f1d-4611-8fbf-6c08e13dd82c"
    },
    ["AmmoCannonLargeKineticAdvancedAgile"] = {
        Name = "Cannon Agile Kinetic Ammo",
        FullName = "Cannon Agile Kinetic Ammo L",
        NqId = 2754186867,
        NqRecipeId = 838216378,
        GroupId = "08d8a31f-4f1b-4768-8ea5-8e68d4953365"
    },
    ["AmmoCannonExtraSmallThermicAdvancedAgile"] = {
        Name = "Cannon Agile Thermic Ammo",
        FullName = "Cannon Agile Thermic Ammo XS",
        NqId = 370579567,
        NqRecipeId = 1082765236,
        GroupId = "08d8a31f-4f1a-4b14-850c-ce4a946f657b"
    },
    ["AmmoCannonLargeThermicAdvancedAgile"] = {
        Name = "Cannon Agile Thermic Ammo",
        FullName = "Cannon Agile Thermic Ammo L",
        NqId = 3564640746,
        NqRecipeId = 523171091,
        GroupId = "08d8a31f-4f1b-4bcf-8b65-b0a0b8bd89ae"
    },
    ["AmmoCannonMediumThermicAdvancedAgile"] = {
        Name = "Cannon Agile Thermic Ammo",
        FullName = "Cannon Agile Thermic Ammo M",
        NqId = 1958427908,
        NqRecipeId = 369125316,
        GroupId = "08d8a31f-4f1c-4b6f-8418-a697f901f64a"
    },
    ["AmmoCannonSmallThermicAdvancedAgile"] = {
        Name = "Cannon Agile Thermic Ammo",
        FullName = "Cannon Agile Thermic Ammo S",
        NqId = 2014631386,
        NqRecipeId = 1731313519,
        GroupId = "08d8a31f-4f1d-4b30-873b-a5439c070b5b"
    },
    ["AmmoCannonLargeKineticAdvancedDefense"] = {
        Name = "Cannon Defense Kinetic Ammo",
        FullName = "Cannon Defense Kinetic Ammo L",
        NqId = 1368644517,
        NqRecipeId = 1485644604,
        GroupId = "08d8a31f-4f1b-4768-8ea5-8e68d4953365"
    },
    ["AmmoCannonMediumKineticAdvancedDefense"] = {
        Name = "Cannon Defense Kinetic Ammo",
        FullName = "Cannon Defense Kinetic Ammo M",
        NqId = 3802426170,
        NqRecipeId = 505273921,
        GroupId = "08d8a31f-4f1c-464f-883c-74275d7e94cd"
    },
    ["AmmoCannonExtraSmallKineticAdvancedDefense"] = {
        Name = "Cannon Defense Kinetic Ammo",
        FullName = "Cannon Defense Kinetic Ammo XS",
        NqId = 2680492642,
        NqRecipeId = 1500914006,
        GroupId = "08d8a31f-4f1a-45f6-8d85-4a03eb039b9d"
    },
    ["AmmoCannonSmallKineticAdvancedDefense"] = {
        Name = "Cannon Defense Kinetic Ammo",
        FullName = "Cannon Defense Kinetic Ammo S",
        NqId = 52497197,
        NqRecipeId = 425206728,
        GroupId = "08d8a31f-4f1d-4611-8fbf-6c08e13dd82c"
    },
    ["AmmoCannonExtraSmallThermicAdvancedDefense"] = {
        Name = "Cannon Defense Thermic Ammo",
        FullName = "Cannon Defense Thermic Ammo XS",
        NqId = 147467923,
        NqRecipeId = 1437321289,
        GroupId = "08d8a31f-4f1a-4b14-850c-ce4a946f657b"
    },
    ["AmmoCannonLargeThermicAdvancedDefense"] = {
        Name = "Cannon Defense Thermic Ammo",
        FullName = "Cannon Defense Thermic Ammo L",
        NqId = 99109453,
        NqRecipeId = 336469297,
        GroupId = "08d8a31f-4f1b-4bcf-8b65-b0a0b8bd89ae"
    },
    ["AmmoCannonSmallThermicAdvancedDefense"] = {
        Name = "Cannon Defense Thermic Ammo",
        FullName = "Cannon Defense Thermic Ammo S",
        NqId = 846420746,
        NqRecipeId = 1323820962,
        GroupId = "08d8a31f-4f1d-4b30-873b-a5439c070b5b"
    },
    ["AmmoCannonMediumThermicAdvancedDefense"] = {
        Name = "Cannon Defense Thermic Ammo",
        FullName = "Cannon Defense Thermic Ammo M",
        NqId = 3352702648,
        NqRecipeId = 1120094409,
        GroupId = "08d8a31f-4f1c-4b6f-8418-a697f901f64a"
    },
    ["AmmoCannonSmallKineticAdvancedHeavy"] = {
        Name = "Cannon Heavy Kinetic Ammo",
        FullName = "Cannon Heavy Kinetic Ammo S",
        NqId = 2013297395,
        NqRecipeId = 1565694660,
        GroupId = "08d8a31f-4f1d-4611-8fbf-6c08e13dd82c"
    },
    ["AmmoCannonMediumKineticAdvancedHeavy"] = {
        Name = "Cannon Heavy Kinetic Ammo",
        FullName = "Cannon Heavy Kinetic Ammo M",
        NqId = 2318901128,
        NqRecipeId = 797182545,
        GroupId = "08d8a31f-4f1c-464f-883c-74275d7e94cd"
    },
    ["AmmoCannonLargeKineticAdvancedHeavy"] = {
        Name = "Cannon Heavy Kinetic Ammo",
        FullName = "Cannon Heavy Kinetic Ammo L",
        NqId = 3111934432,
        NqRecipeId = 1316120272,
        GroupId = "08d8a31f-4f1b-4768-8ea5-8e68d4953365"
    },
    ["AmmoCannonExtraSmallKineticAdvancedHeavy"] = {
        Name = "Cannon Heavy Kinetic Ammo",
        FullName = "Cannon Heavy Kinetic Ammo XS",
        NqId = 1980351716,
        NqRecipeId = 1646056761,
        GroupId = "08d8a31f-4f1a-45f6-8d85-4a03eb039b9d"
    },
    ["AmmoCannonLargeThermicAdvancedHeavy"] = {
        Name = "Cannon Heavy Thermic Ammo",
        FullName = "Cannon Heavy Thermic Ammo L",
        NqId = 3705351908,
        NqRecipeId = 131645605,
        GroupId = "08d8a31f-4f1b-4bcf-8b65-b0a0b8bd89ae"
    },
    ["AmmoCannonMediumThermicAdvancedHeavy"] = {
        Name = "Cannon Heavy Thermic Ammo",
        FullName = "Cannon Heavy Thermic Ammo M",
        NqId = 1627746607,
        NqRecipeId = 552965418,
        GroupId = "08d8a31f-4f1c-4b6f-8418-a697f901f64a"
    },
    ["AmmoCannonExtraSmallThermicAdvancedHeavy"] = {
        Name = "Cannon Heavy Thermic Ammo",
        FullName = "Cannon Heavy Thermic Ammo XS",
        NqId = 726551231,
        NqRecipeId = 1597940598,
        GroupId = "08d8a31f-4f1a-4b14-850c-ce4a946f657b"
    },
    ["AmmoCannonSmallThermicAdvancedHeavy"] = {
        Name = "Cannon Heavy Thermic Ammo",
        FullName = "Cannon Heavy Thermic Ammo S",
        NqId = 1912399735,
        NqRecipeId = 1974116477,
        GroupId = "08d8a31f-4f1d-4b30-873b-a5439c070b5b"
    },
    ["AmmoCannonMediumKineticUncommon"] = {
        Name = "Cannon Kinetic Ammo",
        FullName = "Cannon Kinetic Ammo M",
        NqId = 1087392944,
        NqRecipeId = 1928003631,
        GroupId = "08d8a31f-4f1c-464f-883c-74275d7e94cd"
    },
    ["AmmoCannonLargeKineticUncommon"] = {
        Name = "Cannon Kinetic Ammo",
        FullName = "Cannon Kinetic Ammo L",
        NqId = 234876889,
        NqRecipeId = 581466335,
        GroupId = "08d8a31f-4f1b-4768-8ea5-8e68d4953365"
    },
    ["AmmoCannonSmallKineticUncommon"] = {
        Name = "Cannon Kinetic Ammo",
        FullName = "Cannon Kinetic Ammo S",
        NqId = 864736227,
        NqRecipeId = 2094325344,
        GroupId = "08d8a31f-4f1d-4611-8fbf-6c08e13dd82c"
    },
    ["AmmoCannonExtraSmallKineticUncommon"] = {
        Name = "Cannon Kinetic Ammo",
        FullName = "Cannon Kinetic Ammo XS",
        NqId = 3818049598,
        NqRecipeId = 1900378917,
        GroupId = "08d8a31f-4f1a-45f6-8d85-4a03eb039b9d"
    },
    ["AmmoCannonSmallKineticAdvancedPrecision"] = {
        Name = "Cannon Precision Kinetic Ammo",
        FullName = "Cannon Precision Kinetic Ammo S",
        NqId = 1256032552,
        NqRecipeId = 181673502,
        GroupId = "08d8a31f-4f1d-4611-8fbf-6c08e13dd82c"
    },
    ["AmmoCannonLargeKineticAdvancedPrecision"] = {
        Name = "Cannon Precision Kinetic Ammo",
        FullName = "Cannon Precision Kinetic Ammo L",
        NqId = 2564171448,
        NqRecipeId = 769571847,
        GroupId = "08d8a31f-4f1b-4768-8ea5-8e68d4953365"
    },
    ["AmmoCannonMediumKineticAdvancedPrecision"] = {
        Name = "Cannon Precision Kinetic Ammo",
        FullName = "Cannon Precision Kinetic Ammo M",
        NqId = 1837088359,
        NqRecipeId = 1886780540,
        GroupId = "08d8a31f-4f1c-464f-883c-74275d7e94cd"
    },
    ["AmmoCannonExtraSmallKineticAdvancedPrecision"] = {
        Name = "Cannon Precision Kinetic Ammo",
        FullName = "Cannon Precision Kinetic Ammo XS",
        NqId = 3238320397,
        NqRecipeId = 603146718,
        GroupId = "08d8a31f-4f1a-45f6-8d85-4a03eb039b9d"
    },
    ["AmmoCannonSmallThermicAdvancedPrecision"] = {
        Name = "Cannon Precision Thermic Ammo",
        FullName = "Cannon Precision Thermic Ammo S",
        NqId = 1081563239,
        NqRecipeId = 1616145478,
        GroupId = "08d8a31f-4f1d-4b30-873b-a5439c070b5b"
    },
    ["AmmoCannonMediumThermicAdvancedPrecision"] = {
        Name = "Cannon Precision Thermic Ammo",
        FullName = "Cannon Precision Thermic Ammo M",
        NqId = 1445049256,
        NqRecipeId = 513531307,
        GroupId = "08d8a31f-4f1c-4b6f-8418-a697f901f64a"
    },
    ["AmmoCannonExtraSmallThermicAdvancedPrecision"] = {
        Name = "Cannon Precision Thermic Ammo",
        FullName = "Cannon Precision Thermic Ammo XS",
        NqId = 2917884317,
        NqRecipeId = 1403856648,
        GroupId = "08d8a31f-4f1a-4b14-850c-ce4a946f657b"
    },
    ["AmmoCannonLargeThermicAdvancedPrecision"] = {
        Name = "Cannon Precision Thermic Ammo",
        FullName = "Cannon Precision Thermic Ammo L",
        NqId = 2793941079,
        NqRecipeId = 1812433263,
        GroupId = "08d8a31f-4f1b-4bcf-8b65-b0a0b8bd89ae"
    },
    ["AmmoCannonSmallThermicUncommon"] = {
        Name = "Cannon Thermic Ammo",
        FullName = "Cannon Thermic Ammo S",
        NqId = 3253142563,
        NqRecipeId = 1890055762,
        GroupId = "08d8a31f-4f1d-4b30-873b-a5439c070b5b"
    },
    ["AmmoCannonMediumThermicUncommon"] = {
        Name = "Cannon Thermic Ammo",
        FullName = "Cannon Thermic Ammo M",
        NqId = 2886559338,
        NqRecipeId = 1298293028,
        GroupId = "08d8a31f-4f1c-4b6f-8418-a697f901f64a"
    },
    ["AmmoCannonExtraSmallThermicUncommon"] = {
        Name = "Cannon Thermic Ammo",
        FullName = "Cannon Thermic Ammo XS",
        NqId = 3607061517,
        NqRecipeId = 980156694,
        GroupId = "08d8a31f-4f1a-4b14-850c-ce4a946f657b"
    },
    ["AmmoCannonLargeThermicUncommon"] = {
        Name = "Cannon Thermic Ammo",
        FullName = "Cannon Thermic Ammo L",
        NqId = 2150864517,
        NqRecipeId = 409214283,
        GroupId = "08d8a31f-4f1b-4bcf-8b65-b0a0b8bd89ae"
    },
    ["CanopyCornerSmall_01"] = {
        Name = "Canopy Metal corner",
        FullName = "Canopy Metal corner S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyCornerMedium_01"] = {
        Name = "Canopy Metal corner",
        FullName = "Canopy Metal corner M",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyCornerLarge_01"] = {
        Name = "Canopy Metal corner",
        FullName = "Canopy Metal corner L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatLarge_01"] = {
        Name = "Canopy Metal flat",
        FullName = "Canopy Metal flat L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatSmall_01"] = {
        Name = "Canopy Metal flat",
        FullName = "Canopy Metal flat S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatMedium_01"] = {
        Name = "Canopy Metal flat",
        FullName = "Canopy Metal flat M",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleSmall_01"] = {
        Name = "Canopy Metal tilted",
        FullName = "Canopy Metal tilted S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleMedium_01"] = {
        Name = "Canopy Metal tilted",
        FullName = "Canopy Metal tilted M",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleLarge_01"] = {
        Name = "Canopy Metal tilted",
        FullName = "Canopy Metal tilted L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleLarge_01"] = {
        Name = "Canopy Metal triangle",
        FullName = "Canopy Metal triangle L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleMedium_01"] = {
        Name = "Canopy Metal triangle",
        FullName = "Canopy Metal triangle M",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleSmall_01"] = {
        Name = "Canopy Metal triangle",
        FullName = "Canopy Metal triangle S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyCornerSmall_00"] = {
        Name = "Canopy Windshield corner",
        FullName = "Canopy Windshield corner S",
        NqId = 695039310,
        NqRecipeId = 1825028805,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyCornerLarge_00"] = {
        Name = "Canopy Windshield corner",
        FullName = "Canopy Windshield corner L",
        NqId = 4226053198,
        NqRecipeId = 1041265279,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyCornerMedium_00"] = {
        Name = "Canopy Windshield corner",
        FullName = "Canopy Windshield corner M",
        NqId = 1484667376,
        NqRecipeId = 1156504881,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatSmall_00"] = {
        Name = "Canopy Windshield flat",
        FullName = "Canopy Windshield flat S",
        NqId = 2433054263,
        NqRecipeId = 65660295,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatMedium_00"] = {
        Name = "Canopy Windshield flat",
        FullName = "Canopy Windshield flat M",
        NqId = 1900076171,
        NqRecipeId = 2007822249,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyFlatLarge_00"] = {
        Name = "Canopy Windshield flat",
        FullName = "Canopy Windshield flat L",
        NqId = 1001848134,
        NqRecipeId = 830288667,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleMedium_00"] = {
        Name = "Canopy Windshield tilted",
        FullName = "Canopy Windshield tilted M",
        NqId = 4167375414,
        NqRecipeId = 426566210,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleLarge_00"] = {
        Name = "Canopy Windshield tilted",
        FullName = "Canopy Windshield tilted L",
        NqId = 2086563919,
        NqRecipeId = 1011557660,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyAngleSmall_00"] = {
        Name = "Canopy Windshield tilted",
        FullName = "Canopy Windshield tilted S",
        NqId = 1326565833,
        NqRecipeId = 203547655,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleSmall_00"] = {
        Name = "Canopy Windshield triangle",
        FullName = "Canopy Windshield triangle S",
        NqId = 2792485016,
        NqRecipeId = 2001045118,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleMedium_00"] = {
        Name = "Canopy Windshield triangle",
        FullName = "Canopy Windshield triangle M",
        NqId = 3521312761,
        NqRecipeId = 354023964,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CanopyTriangleLarge_00"] = {
        Name = "Canopy Windshield triangle",
        FullName = "Canopy Windshield triangle L",
        NqId = 2236273961,
        NqRecipeId = 479960376,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["CarbonFiberProduct"] = {
        Name = "Carbon Fiber product",
        FullName = "Carbon Fiber product",
        NqId = 1622880428,
        NqRecipeId = 625048708,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["CarbonScrap"] = {
        Name = "Carbon Scrap",
        FullName = "Carbon Scrap",
        NqId = 3857279161,
        NqRecipeId = 890147001,
        GroupId = "08d8a31f-4f35-4e5c-84a4-fca5d5dc27d0"
    },
    ["Catalyst3"] = {
        Name = "Catalyst 3",
        FullName = "Catalyst 3",
        NqId = 3729464848,
        NqRecipeId = 1358274064,
        GroupId = "08d8a31f-50c6-49f9-81cf-58d9ce1b14bb"
    },
    ["Catalyst4"] = {
        Name = "Catalyst 4",
        FullName = "Catalyst 4",
        NqId = 3729464849,
        NqRecipeId = 1358274065,
        GroupId = "08d8a31f-50c6-49f9-81cf-58d9ce1b14bb"
    },
    ["Catalyst5"] = {
        Name = "Catalyst 5",
        FullName = "Catalyst 5",
        NqId = 3729464850,
        NqRecipeId = 1358274066,
        GroupId = "08d8a31f-50c6-49f9-81cf-58d9ce1b14bb"
    },
    ["ChromiumOre"] = {
        Name = "Chromite",
        FullName = "Chromite",
        NqId = 2029139010,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c0-46f5-845a-43ec26f5978d"
    },
    ["ChromiumScrap"] = {
        Name = "Chromium Scrap",
        FullName = "Chromium Scrap",
        NqId = 409040753,
        NqRecipeId = 119221489,
        GroupId = "08d8a31f-4f38-4b17-8db3-5c38bc239e22"
    },
    ["CarbonOre"] = {
        Name = "Coal",
        FullName = "Coal",
        NqId = 299255727,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50be-4dfa-8466-916146e77841"
    },
    ["CobaltScrap"] = {
        Name = "Cobalt Scrap",
        FullName = "Cobalt Scrap",
        NqId = 1370993297,
        NqRecipeId = 586836625,
        GroupId = "08d8a31f-4f37-4fa5-882d-57740730e9aa"
    },
    ["CobaltOre"] = {
        Name = "Cobaltite",
        FullName = "Cobaltite",
        NqId = 3546085401,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c1-4ec5-8739-9b7ac95ed2d9"
    },
    ["CockpitFighter"] = {
        Name = "Cockpit controller",
        FullName = "Cockpit controller",
        NqId = 3640291983,
        NqRecipeId = 100300015,
        GroupId = "08d8a31f-4f3e-4c4f-8940-9931a701e615"
    },
    ["NiobiumOre"] = {
        Name = "Columbite",
        FullName = "Columbite",
        NqId = 789110817,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c3-4814-875e-27353e233d6c"
    },
    ["CockpitCommandment"] = {
        Name = "Command seat controller",
        FullName = "Command seat controller",
        NqId = 3655856020,
        NqRecipeId = 615006973,
        GroupId = "08d8a31f-4f3e-4299-8f05-72567b0b148f"
    },
    ["AileronShortSmall2"] = {
        Name = "Compact Aileron",
        FullName = "Compact Aileron XS",
        NqId = 2334843027,
        NqRecipeId = 756132753,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["AileronShortMedium2"] = {
        Name = "Compact Aileron",
        FullName = "Compact Aileron S",
        NqId = 1923840124,
        NqRecipeId = 1762504943,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["AileronShortLarge2"] = {
        Name = "Compact Aileron",
        FullName = "Compact Aileron M",
        NqId = 4017253256,
        NqRecipeId = 907496164,
        GroupId = "08d8a31f-5008-4460-8040-9e588bafddc8"
    },
    ["ConcreteProduct"] = {
        Name = "Concrete product",
        FullName = "Concrete product",
        NqId = 645870905,
        NqRecipeId = 394971409,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["ContainerMedium"] = {
        Name = "Container",
        FullName = "Container S",
        NqId = 1594689569,
        NqRecipeId = 1173587001,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerXL"] = {
        Name = "Container",
        FullName = "Container L",
        NqId = 2125213321,
        NqRecipeId = 1702024841,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerLarge"] = {
        Name = "Container",
        FullName = "Container M",
        NqId = 521274609,
        NqRecipeId = 937197329,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerSmall"] = {
        Name = "Container",
        FullName = "Container XS",
        NqId = 1689381593,
        NqRecipeId = 760622009,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerXXL"] = {
        Name = "Container",
        FullName = "Container XL",
        NqId = 373451737,
        NqRecipeId = 1899706841,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerHub"] = {
        Name = "Container Hub",
        FullName = "Container Hub",
        NqId = 373359444,
        NqRecipeId = 1899626836,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["CopperScrap"] = {
        Name = "Copper Scrap",
        FullName = "Copper Scrap",
        NqId = 3630798120,
        NqRecipeId = 702266664,
        GroupId = "08d8a31f-4f38-4b17-8db3-5c38bc239e22"
    },
    ["CableCorner01"] = {
        Name = "Corner Cable Model A",
        FullName = "Corner Cable Model A",
        NqId = 1700326384,
        NqRecipeId = 100703856,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["CableCorner02"] = {
        Name = "Corner Cable Model B",
        FullName = "Corner Cable Model B",
        NqId = 1700326385,
        NqRecipeId = 100703857,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["CableCorner03"] = {
        Name = "Corner Cable Model C",
        FullName = "Corner Cable Model C",
        NqId = 1700326390,
        NqRecipeId = 100703862,
        GroupId = "08d8a31f-4f9e-41e8-8021-cc8bae235892"
    },
    ["FluorineOre"] = {
        Name = "Cryolite",
        FullName = "Cryolite",
        NqId = 1467310917,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c1-4ec5-8739-9b7ac95ed2d9"
    },
    ["CuAgProduct"] = {
        Name = "Cu-Ag Alloy product",
        FullName = "Cu-Ag Alloy product",
        NqId = 1673011820,
        NqRecipeId = 1771858540,
        GroupId = "08d8a31f-50c9-4c0d-8195-ca76d714eca0"
    },
    ["hcAlLiPanelDarkGray"] = {
        Name = "Dark Gray Al-Li Panel",
        FullName = "Dark Gray Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelDarkGray"] = {
        Name = "Dark Gray Aluminium Panel",
        FullName = "Dark Gray Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelDarkGray"] = {
        Name = "Dark Gray Calcium Panel",
        FullName = "Dark Gray Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelDarkGray"] = {
        Name = "Dark Gray Carbon Panel",
        FullName = "Dark Gray Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelDarkGray"] = {
        Name = "Dark Gray Chromium Panel",
        FullName = "Dark Gray Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelDarkGray"] = {
        Name = "Dark Gray Cobalt Panel",
        FullName = "Dark Gray Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelDarkGray"] = {
        Name = "Dark Gray Copper Panel",
        FullName = "Dark Gray Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelDarkGray"] = {
        Name = "Dark Gray Duralumin Panel",
        FullName = "Dark Gray Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelDarkGray"] = {
        Name = "Dark Gray Fluorine Panel",
        FullName = "Dark Gray Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelDarkGray"] = {
        Name = "Dark Gray Gold Panel",
        FullName = "Dark Gray Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelDarkGray"] = {
        Name = "Dark Gray Grade 5 Titanium Alloy Panel",
        FullName = "Dark Gray Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelDarkGray"] = {
        Name = "Dark Gray Inconel Panel ",
        FullName = "Dark Gray Inconel Panel ",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelDarkGray"] = {
        Name = "Dark Gray Iron Panel",
        FullName = "Dark Gray Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelDarkGray"] = {
        Name = "Dark Gray Lithium Panel",
        FullName = "Dark Gray Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelDarkGray"] = {
        Name = "Dark Gray Mangalloy Panel",
        FullName = "Dark Gray Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelDarkGray"] = {
        Name = "Dark Gray Manganese Panel",
        FullName = "Dark Gray Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelDarkGray"] = {
        Name = "Dark Gray Maraging Steel Panel",
        FullName = "Dark Gray Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelDarkGray"] = {
        Name = "Dark Gray Nickel Panel",
        FullName = "Dark Gray Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelDarkGray"] = {
        Name = "Dark Gray Niobium Panel",
        FullName = "Dark Gray Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelDarkGray"] = {
        Name = "Dark Gray Sc-Al Panel",
        FullName = "Dark Gray Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelDarkGray"] = {
        Name = "Dark Gray Scandium Panel",
        FullName = "Dark Gray Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelDarkGray"] = {
        Name = "Dark Gray Silicon Panel",
        FullName = "Dark Gray Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelDarkGray"] = {
        Name = "Dark Gray Silumin Panel",
        FullName = "Dark Gray Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelDarkGray"] = {
        Name = "Dark Gray Silver Panel",
        FullName = "Dark Gray Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelDarkGray"] = {
        Name = "Dark Gray Sodium Panel",
        FullName = "Dark Gray Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelDarkGray"] = {
        Name = "Dark Gray Stainless Steel Panel",
        FullName = "Dark Gray Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelDarkGray"] = {
        Name = "Dark Gray Steel Panel",
        FullName = "Dark Gray Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelDarkGray"] = {
        Name = "Dark Gray Sulfur Panel",
        FullName = "Dark Gray Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelDarkGray"] = {
        Name = "Dark Gray Titanium Panel",
        FullName = "Dark Gray Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelDarkGray"] = {
        Name = "Dark Gray Vanadium Panel",
        FullName = "Dark Gray Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["DataBank"] = {
        Name = "Databank",
        FullName = "Databank",
        NqId = 812400865,
        NqRecipeId = 1449541857,
        GroupId = "08d8a31f-4fad-42ed-80d7-9af33e06d556"
    },
    ["tracker_1_1"] = {
        Name = "Deep Space Asteroid Tracker",
        FullName = "Deep Space Asteroid Tracker",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d983ea-8716-40ad-8aa8-24e2786fb1a6"
    },
    ["DelayLine"] = {
        Name = "Delay Line",
        FullName = "Delay Line",
        NqId = 1474604499,
        NqRecipeId = 1788227027,
        GroupId = "08d8a31f-4fad-4f86-8639-db5d622df7a7"
    },
    ["Dispenser"] = {
        Name = "Deprecated Dispenser",
        FullName = "Deprecated Dispenser",
        NqId = 16651125,
        NqRecipeId = 1296536437,
        GroupId = "08d8a31f-4fcd-40b6-84ab-979743478a72"
    },
    ["DetectionZone16m"] = {
        Name = "Detection Zone",
        FullName = "Detection Zone L",
        NqId = 4241228057,
        NqRecipeId = 57634203,
        GroupId = "08d8a31f-4fba-4ce5-86c9-05f89d99cb02"
    },
    ["DetectionZone2m"] = {
        Name = "Detection Zone",
        FullName = "Detection Zone XS",
        NqId = 485151209,
        NqRecipeId = 1622529057,
        GroupId = "08d8a31f-4fba-4ce5-86c9-05f89d99cb02"
    },
    ["DetectionZone4m"] = {
        Name = "Detection Zone",
        FullName = "Detection Zone S",
        NqId = 485149228,
        NqRecipeId = 1622543860,
        GroupId = "08d8a31f-4fba-4ce5-86c9-05f89d99cb02"
    },
    ["DetectionZone8m"] = {
        Name = "Detection Zone",
        FullName = "Detection Zone M",
        NqId = 485149481,
        NqRecipeId = 1622569713,
        GroupId = "08d8a31f-4fba-4ce5-86c9-05f89d99cb02"
    },
    ["DispenserVirtual"] = {
        Name = "Dispenser",
        FullName = "Dispenser",
        NqId = 333062081,
        NqRecipeId = 383205331,
        GroupId = "08d8a31f-4fcd-40b6-84ab-979743478a72"
    },
    ["dresser"] = {
        Name = "Dresser",
        FullName = "Dresser",
        NqId = 283549593,
        NqRecipeId = 1734254489,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["DuraluminProduct"] = {
        Name = "Duralumin product",
        FullName = "Duralumin product",
        NqId = 231758472,
        NqRecipeId = 1113818534,
        GroupId = "08d8a31f-50ce-45fd-88b9-0da7fa7c4e5a"
    },
    ["CoreUnitDynamic64"] = {
        Name = "Dynamic Core Unit",
        FullName = "Dynamic Core Unit S",
        NqId = 183890525,
        NqRecipeId = 1100635310,
        GroupId = "08d8a31f-5046-4533-88f2-5d8b29789984"
    },
    ["CoreUnitDynamic32"] = {
        Name = "Dynamic Core Unit",
        FullName = "Dynamic Core Unit XS",
        NqId = 183890713,
        NqRecipeId = 1100641092,
        GroupId = "08d8a31f-5046-4533-88f2-5d8b29789984"
    },
    ["CoreUnitDynamic256"] = {
        Name = "Dynamic Core Unit",
        FullName = "Dynamic Core Unit L",
        NqId = 1417952990,
        NqRecipeId = 1419815865,
        GroupId = "08d8a31f-5046-4533-88f2-5d8b29789984"
    },
    ["CoreUnitDynamic128"] = {
        Name = "Dynamic Core Unit",
        FullName = "Dynamic Core Unit M",
        NqId = 1418170469,
        NqRecipeId = 1419852900,
        GroupId = "08d8a31f-5046-4533-88f2-5d8b29789984"
    },
    ["BacDeco04"] = {
        Name = "Eggplant Plant Case",
        FullName = "Eggplant Plant Case",
        NqId = 3106061128,
        NqRecipeId = 1734687560,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["ElevatorXSmall"] = {
        Name = "Elevator",
        FullName = "Elevator XS",
        NqId = 3663249627,
        NqRecipeId = 877151035,
        GroupId = "08d8a31f-4fc2-472f-862a-6feb32975f73"
    },
    ["BasicECU"] = {
        Name = "Emergency controller",
        FullName = "Emergency controller",
        NqId = 286542481,
        NqRecipeId = 95046289,
        GroupId = "08d8a31f-4f3c-45df-8c39-b77d52e50bbf"
    },
    ["EmitterSmall"] = {
        Name = "Emitter",
        FullName = "Emitter S",
        NqId = 3287187256,
        NqRecipeId = 1579028792,
        GroupId = "08d8a31f-4fae-4c4f-82f3-1b92cc6ef821"
    },
    ["EmitterMedium"] = {
        Name = "Emitter",
        FullName = "Emitter M",
        NqId = 2809213930,
        NqRecipeId = 1295706218,
        GroupId = "08d8a31f-4fae-4c4f-82f3-1b92cc6ef821"
    },
    ["Emitter"] = {
        Name = "Emitter",
        FullName = "Emitter XS",
        NqId = 1279651501,
        NqRecipeId = 1822289581,
        GroupId = "08d8a31f-4fae-4c4f-82f3-1b92cc6ef821"
    },
    ["Chair02"] = {
        Name = "Encampment Chair",
        FullName = "Encampment Chair",
        NqId = 2169816178,
        NqRecipeId = 359449714,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["WeaponCannonLargeAgile5"] = {
        Name = "Exotic Agile Cannon",
        FullName = "Exotic Agile Cannon L",
        NqId = 3152865678,
        NqRecipeId = 249217451,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonSmallAgile5"] = {
        Name = "Exotic Agile Cannon",
        FullName = "Exotic Agile Cannon S",
        NqId = 429894436,
        NqRecipeId = 1955213858,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonMediumAgile5"] = {
        Name = "Exotic Agile Cannon",
        FullName = "Exotic Agile Cannon M",
        NqId = 2672575278,
        NqRecipeId = 120523253,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmallAgile5"] = {
        Name = "Exotic Agile Cannon",
        FullName = "Exotic Agile Cannon XS",
        NqId = 684853150,
        NqRecipeId = 911593697,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponLaserExtraSmallAgile5"] = {
        Name = "Exotic Agile Laser",
        FullName = "Exotic Agile Laser XS",
        NqId = 3972697534,
        NqRecipeId = 1747903963,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargeAgile5"] = {
        Name = "Exotic Agile Laser",
        FullName = "Exotic Agile Laser L",
        NqId = 679378438,
        NqRecipeId = 1355107000,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumAgile5"] = {
        Name = "Exotic Agile Laser",
        FullName = "Exotic Agile Laser M",
        NqId = 360504286,
        NqRecipeId = 338688385,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallAgile5"] = {
        Name = "Exotic Agile Laser",
        FullName = "Exotic Agile Laser S",
        NqId = 4124398199,
        NqRecipeId = 1845822063,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileMediumAgile5"] = {
        Name = "Exotic Agile Missile",
        FullName = "Exotic Agile Missile M",
        NqId = 598736197,
        NqRecipeId = 677437736,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileExtraSmallAgile5"] = {
        Name = "Exotic Agile Missile",
        FullName = "Exotic Agile Missile XS",
        NqId = 1780076562,
        NqRecipeId = 1077969999,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileLargeAgile5"] = {
        Name = "Exotic Agile Missile",
        FullName = "Exotic Agile Missile L",
        NqId = 3650288368,
        NqRecipeId = 1424237784,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileSmallAgile5"] = {
        Name = "Exotic Agile Missile",
        FullName = "Exotic Agile Missile S",
        NqId = 1843877005,
        NqRecipeId = 697649836,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunMediumAgile5"] = {
        Name = "Exotic Agile Railgun",
        FullName = "Exotic Agile Railgun M",
        NqId = 3057550301,
        NqRecipeId = 490609640,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallAgile5"] = {
        Name = "Exotic Agile Railgun",
        FullName = "Exotic Agile Railgun XS",
        NqId = 549955101,
        NqRecipeId = 2090934879,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunLargeAgile5"] = {
        Name = "Exotic Agile Railgun",
        FullName = "Exotic Agile Railgun L",
        NqId = 4062760162,
        NqRecipeId = 1290704546,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallAgile5"] = {
        Name = "Exotic Agile Railgun",
        FullName = "Exotic Agile Railgun S",
        NqId = 1767704161,
        NqRecipeId = 114495126,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["antenna_5_xl"] = {
        Name = "Exotic Antenna",
        FullName = "Exotic Antenna XL",
        NqId = 2302040376,
        NqRecipeId = 1798295556,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_5_s"] = {
        Name = "Exotic Antenna",
        FullName = "Exotic Antenna S",
        NqId = 1080827676,
        NqRecipeId = 1305819270,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_5_m"] = {
        Name = "Exotic Antenna",
        FullName = "Exotic Antenna M",
        NqId = 1080827674,
        NqRecipeId = 1305819292,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_5_l"] = {
        Name = "Exotic Antenna",
        FullName = "Exotic Antenna L",
        NqId = 1080827653,
        NqRecipeId = 1305819293,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antigravitycore_5"] = {
        Name = "Exotic Anti-Gravity Core",
        FullName = "Exotic Anti-Gravity Core",
        NqId = 2999509692,
        NqRecipeId = 82629945,
        GroupId = "08d8a31f-511d-4b6e-8d59-bd04dbbbe00c"
    },
    ["burner_5"] = {
        Name = "Exotic Burner",
        FullName = "Exotic Burner",
        NqId = 2660328732,
        NqRecipeId = 1272865130,
        GroupId = "08d8a31f-50f7-42af-8cbd-a4edf5ff865c"
    },
    ["casing_5_s"] = {
        Name = "Exotic Casing",
        FullName = "Exotic Casing S",
        NqId = 567007899,
        NqRecipeId = 669694253,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["coresystem_5_s"] = {
        Name = "Exotic Core System",
        FullName = "Exotic Core System S",
        NqId = 1775106424,
        NqRecipeId = 958886316,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["WeaponCannonLargeDefense5"] = {
        Name = "Exotic Defense Cannon",
        FullName = "Exotic Defense Cannon L",
        NqId = 418164308,
        NqRecipeId = 2075676706,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonSmallDefense5"] = {
        Name = "Exotic Defense Cannon",
        FullName = "Exotic Defense Cannon S",
        NqId = 1073121335,
        NqRecipeId = 542848386,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonMediumDefense5"] = {
        Name = "Exotic Defense Cannon",
        FullName = "Exotic Defense Cannon M",
        NqId = 2383624966,
        NqRecipeId = 84872827,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmallDefense5"] = {
        Name = "Exotic Defense Cannon",
        FullName = "Exotic Defense Cannon XS",
        NqId = 3467785553,
        NqRecipeId = 1096591346,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponLaserExtraSmallDefense5"] = {
        Name = "Exotic Defense Laser",
        FullName = "Exotic Defense Laser XS",
        NqId = 796456747,
        NqRecipeId = 1394719554,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserMediumDefense5"] = {
        Name = "Exotic Defense Laser",
        FullName = "Exotic Defense Laser M",
        NqId = 3805044395,
        NqRecipeId = 2049928207,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserLargeDefense5"] = {
        Name = "Exotic Defense Laser",
        FullName = "Exotic Defense Laser L",
        NqId = 3991674464,
        NqRecipeId = 1303569303,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserSmallDefense5"] = {
        Name = "Exotic Defense Laser",
        FullName = "Exotic Defense Laser S",
        NqId = 1737118475,
        NqRecipeId = 480977831,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargeDefense5"] = {
        Name = "Exotic Defense Missile",
        FullName = "Exotic Defense Missile L",
        NqId = 3453451050,
        NqRecipeId = 1090131843,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileMediumDefense5"] = {
        Name = "Exotic Defense Missile",
        FullName = "Exotic Defense Missile M",
        NqId = 1068910656,
        NqRecipeId = 1585468821,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileExtraSmallDefense5"] = {
        Name = "Exotic Defense Missile",
        FullName = "Exotic Defense Missile XS",
        NqId = 134390789,
        NqRecipeId = 100930653,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileSmallDefense5"] = {
        Name = "Exotic Defense Missile",
        FullName = "Exotic Defense Missile S",
        NqId = 136359048,
        NqRecipeId = 2121766259,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunExtraSmallDefense5"] = {
        Name = "Exotic Defense Railgun",
        FullName = "Exotic Defense Railgun XS",
        NqId = 2108818541,
        NqRecipeId = 1911355874,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunMediumDefense5"] = {
        Name = "Exotic Defense Railgun",
        FullName = "Exotic Defense Railgun M",
        NqId = 3396072237,
        NqRecipeId = 661205343,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunSmallDefense5"] = {
        Name = "Exotic Defense Railgun",
        FullName = "Exotic Defense Railgun S",
        NqId = 223437807,
        NqRecipeId = 1492798494,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunLargeDefense5"] = {
        Name = "Exotic Defense Railgun",
        FullName = "Exotic Defense Railgun L",
        NqId = 3670363953,
        NqRecipeId = 564701329,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["electronics_5"] = {
        Name = "Exotic Electronics",
        FullName = "Exotic Electronics",
        NqId = 1297540450,
        NqRecipeId = 1026118820,
        GroupId = "08d8a31f-50f8-4d6f-835c-9f32f00e2ee9"
    },
    ["firingsystem_5_l"] = {
        Name = "Exotic Firing System",
        FullName = "Exotic Firing System L",
        NqId = 3242492875,
        NqRecipeId = 564982362,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_5_m"] = {
        Name = "Exotic Firing System",
        FullName = "Exotic Firing System M",
        NqId = 3242492874,
        NqRecipeId = 564982365,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_5_s"] = {
        Name = "Exotic Firing System",
        FullName = "Exotic Firing System S",
        NqId = 3242492880,
        NqRecipeId = 564982355,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_5_xs"] = {
        Name = "Exotic Firing System",
        FullName = "Exotic Firing System XS",
        NqId = 3740078396,
        NqRecipeId = 812891671,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["WeaponCannonExtraSmallHeavy5"] = {
        Name = "Exotic Heavy Cannon",
        FullName = "Exotic Heavy Cannon XS",
        NqId = 3384934783,
        NqRecipeId = 1378758801,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonLargeHeavy5"] = {
        Name = "Exotic Heavy Cannon",
        FullName = "Exotic Heavy Cannon L",
        NqId = 3960316609,
        NqRecipeId = 748835216,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonMediumHeavy5"] = {
        Name = "Exotic Heavy Cannon",
        FullName = "Exotic Heavy Cannon M",
        NqId = 2188788022,
        NqRecipeId = 645100383,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonSmallHeavy5"] = {
        Name = "Exotic Heavy Cannon",
        FullName = "Exotic Heavy Cannon S",
        NqId = 2058706005,
        NqRecipeId = 2116333302,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponLaserMediumHeavy5"] = {
        Name = "Exotic Heavy Laser",
        FullName = "Exotic Heavy Laser M",
        NqId = 3588766026,
        NqRecipeId = 1135448899,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserLargeHeavy5"] = {
        Name = "Exotic Heavy Laser",
        FullName = "Exotic Heavy Laser L",
        NqId = 4270062440,
        NqRecipeId = 945836172,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserExtraSmallHeavy5"] = {
        Name = "Exotic Heavy Laser",
        FullName = "Exotic Heavy Laser XS",
        NqId = 3698237863,
        NqRecipeId = 522166232,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserSmallHeavy5"] = {
        Name = "Exotic Heavy Laser",
        FullName = "Exotic Heavy Laser S",
        NqId = 338218841,
        NqRecipeId = 928844448,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileMediumHeavy5"] = {
        Name = "Exotic Heavy Missile",
        FullName = "Exotic Heavy Missile M",
        NqId = 1102564706,
        NqRecipeId = 800973884,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileExtraSmallHeavy5"] = {
        Name = "Exotic Heavy Missile",
        FullName = "Exotic Heavy Missile XS",
        NqId = 3611570509,
        NqRecipeId = 922568178,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileLargeHeavy5"] = {
        Name = "Exotic Heavy Missile",
        FullName = "Exotic Heavy Missile L",
        NqId = 708864067,
        NqRecipeId = 1883135601,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileSmallHeavy5"] = {
        Name = "Exotic Heavy Missile",
        FullName = "Exotic Heavy Missile S",
        NqId = 1100091711,
        NqRecipeId = 673694709,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunLargeHeavy5"] = {
        Name = "Exotic Heavy Railgun",
        FullName = "Exotic Heavy Railgun L",
        NqId = 30018135,
        NqRecipeId = 642878075,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallHeavy5"] = {
        Name = "Exotic Heavy Railgun",
        FullName = "Exotic Heavy Railgun S",
        NqId = 2991505105,
        NqRecipeId = 1706288001,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunMediumHeavy5"] = {
        Name = "Exotic Heavy Railgun",
        FullName = "Exotic Heavy Railgun M",
        NqId = 1641776328,
        NqRecipeId = 990274945,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallHeavy5"] = {
        Name = "Exotic Heavy Railgun",
        FullName = "Exotic Heavy Railgun XS",
        NqId = 1816732409,
        NqRecipeId = 989109286,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["hydraulics_5"] = {
        Name = "Exotic hydraulics",
        FullName = "Exotic hydraulics",
        NqId = 1331181091,
        NqRecipeId = 30134924,
        GroupId = "08d8a31f-50fa-4803-8ecf-b8ad089f721b"
    },
    ["laserchamber_5_l"] = {
        Name = "Exotic Laser Chamber",
        FullName = "Exotic Laser Chamber L",
        NqId = 2825506266,
        NqRecipeId = 1825383396,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_5_xs"] = {
        Name = "Exotic Laser Chamber",
        FullName = "Exotic Laser Chamber XS",
        NqId = 1252823771,
        NqRecipeId = 8315602,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_5_s"] = {
        Name = "Exotic Laser Chamber",
        FullName = "Exotic Laser Chamber S",
        NqId = 2825506243,
        NqRecipeId = 1825383395,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_5_m"] = {
        Name = "Exotic Laser Chamber",
        FullName = "Exotic Laser Chamber M",
        NqId = 2825506265,
        NqRecipeId = 1825383397,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["magnet_5"] = {
        Name = "Exotic Magnet",
        FullName = "Exotic Magnet",
        NqId = 1246524866,
        NqRecipeId = 1949200612,
        GroupId = "08d8a31f-50ff-45dd-8793-4e9e09a6afd6"
    },
    ["magneticrail_5_l"] = {
        Name = "Exotic Magnetic Rail",
        FullName = "Exotic Magnetic Rail L",
        NqId = 2722609339,
        NqRecipeId = 546985671,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_5_m"] = {
        Name = "Exotic Magnetic Rail",
        FullName = "Exotic Magnetic Rail M",
        NqId = 2722609340,
        NqRecipeId = 546985688,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_5_s"] = {
        Name = "Exotic Magnetic Rail",
        FullName = "Exotic Magnetic Rail S",
        NqId = 2722609330,
        NqRecipeId = 546985694,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_5_xs"] = {
        Name = "Exotic Magnetic Rail",
        FullName = "Exotic Magnetic Rail XS",
        NqId = 4210044590,
        NqRecipeId = 1818858099,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["mechanicalsensor_5_xs"] = {
        Name = "Exotic Mechanical Sensor",
        FullName = "Exotic Mechanical Sensor XS",
        NqId = 204462057,
        NqRecipeId = 352387552,
        GroupId = "08d8a31f-513b-460d-896b-c132d9265abd"
    },
    ["ExoticMiningUnitL"] = {
        Name = "Exotic Mining Unit",
        FullName = "Exotic Mining Unit L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["silo_5_xs"] = {
        Name = "Exotic Missile Silo",
        FullName = "Exotic Missile Silo XS",
        NqId = 3026262169,
        NqRecipeId = 1761283392,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_5_s"] = {
        Name = "Exotic Missile Silo",
        FullName = "Exotic Missile Silo S",
        NqId = 3857142764,
        NqRecipeId = 1764062861,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_5_m"] = {
        Name = "Exotic Missile Silo",
        FullName = "Exotic Missile Silo M",
        NqId = 3857142758,
        NqRecipeId = 1764062855,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_5_l"] = {
        Name = "Exotic Missile Silo",
        FullName = "Exotic Missile Silo L",
        NqId = 3857142757,
        NqRecipeId = 1764062852,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["optics_5"] = {
        Name = "Exotic Optics",
        FullName = "Exotic Optics",
        NqId = 3739200055,
        NqRecipeId = 73420220,
        GroupId = "08d8a31f-5101-4014-86b8-ac0ddcd19eb2"
    },
    ["orescanner_5_l"] = {
        Name = "Exotic Ore Scanner",
        FullName = "Exotic Ore Scanner L",
        NqId = 3501535314,
        NqRecipeId = 260114633,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["RadarPVPSpaceMediumPhasedarray5"] = {
        Name = "Exotic Phased-Array Space Radar",
        FullName = "Exotic Phased-Array Space Radar M",
        NqId = 1707018148,
        NqRecipeId = 1852711359,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargePhasedarray5"] = {
        Name = "Exotic Phased-Array Space Radar",
        FullName = "Exotic Phased-Array Space Radar L",
        NqId = 2075264590,
        NqRecipeId = 316271443,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceSmallPhasedarray5"] = {
        Name = "Exotic Phased-Array Space Radar",
        FullName = "Exotic Phased-Array Space Radar S",
        NqId = 809783310,
        NqRecipeId = 1710615338,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["powersystem_5"] = {
        Name = "Exotic Power System",
        FullName = "Exotic Power System",
        NqId = 527681751,
        NqRecipeId = 1458022908,
        GroupId = "08d8a31f-5102-4a00-82ae-1521925be2a3"
    },
    ["WeaponCannonLargePrecision5"] = {
        Name = "Exotic Precision Cannon",
        FullName = "Exotic Precision Cannon L",
        NqId = 845167468,
        NqRecipeId = 1439705093,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonMediumPrecision5"] = {
        Name = "Exotic Precision Cannon",
        FullName = "Exotic Precision Cannon M",
        NqId = 2457342402,
        NqRecipeId = 1693863575,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmallPrecision5"] = {
        Name = "Exotic Precision Cannon",
        FullName = "Exotic Precision Cannon XS",
        NqId = 3455226647,
        NqRecipeId = 1861248016,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonSmallPrecision5"] = {
        Name = "Exotic Precision Cannon",
        FullName = "Exotic Precision Cannon S",
        NqId = 3567179845,
        NqRecipeId = 2083650530,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponLaserExtraSmallPrecision5"] = {
        Name = "Exotic Precision Laser",
        FullName = "Exotic Precision Laser XS",
        NqId = 1604660455,
        NqRecipeId = 211643281,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargePrecision5"] = {
        Name = "Exotic Precision Laser",
        FullName = "Exotic Precision Laser L",
        NqId = 2356629410,
        NqRecipeId = 282920721,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumPrecision5"] = {
        Name = "Exotic Precision Laser",
        FullName = "Exotic Precision Laser M",
        NqId = 3840109426,
        NqRecipeId = 1867707070,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallPrecision5"] = {
        Name = "Exotic Precision Laser",
        FullName = "Exotic Precision Laser S",
        NqId = 3730148320,
        NqRecipeId = 1823871678,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargePrecision5"] = {
        Name = "Exotic Precision Missile",
        FullName = "Exotic Precision Missile L",
        NqId = 1205879483,
        NqRecipeId = 221816655,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileExtraSmallPrecision5"] = {
        Name = "Exotic Precision Missile",
        FullName = "Exotic Precision Missile XS",
        NqId = 2239993846,
        NqRecipeId = 1590398412,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileMediumPrecision5"] = {
        Name = "Exotic Precision Missile",
        FullName = "Exotic Precision Missile M",
        NqId = 1217644363,
        NqRecipeId = 398759720,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileSmallPrecision5"] = {
        Name = "Exotic Precision Missile",
        FullName = "Exotic Precision Missile S",
        NqId = 2668363433,
        NqRecipeId = 1082750840,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunLargePrecision5"] = {
        Name = "Exotic Precision Railgun",
        FullName = "Exotic Precision Railgun L",
        NqId = 2916726760,
        NqRecipeId = 1655982715,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallPrecision5"] = {
        Name = "Exotic Precision Railgun",
        FullName = "Exotic Precision Railgun S",
        NqId = 831043071,
        NqRecipeId = 852069130,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunMediumPrecision5"] = {
        Name = "Exotic Precision Railgun",
        FullName = "Exotic Precision Railgun M",
        NqId = 111253024,
        NqRecipeId = 640256506,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallPrecision5"] = {
        Name = "Exotic Precision Railgun",
        FullName = "Exotic Precision Railgun XS",
        NqId = 690643419,
        NqRecipeId = 449173945,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["RadarPVPSpaceSmallProtected5"] = {
        Name = "Exotic Protected Space Radar",
        FullName = "Exotic Protected Space Radar S",
        NqId = 2375197137,
        NqRecipeId = 890188975,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceLargeProtected5"] = {
        Name = "Exotic Protected Space Radar",
        FullName = "Exotic Protected Space Radar L",
        NqId = 3250064334,
        NqRecipeId = 1395894642,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceMediumProtected5"] = {
        Name = "Exotic Protected Space Radar",
        FullName = "Exotic Protected Space Radar M",
        NqId = 3060580944,
        NqRecipeId = 1962270475,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["quantumalignmentunit_5"] = {
        Name = "Exotic Quantum Alignment Unit",
        FullName = "Exotic Quantum Alignment Unit",
        NqId = 2601646634,
        NqRecipeId = 1150226652,
        GroupId = "08d8a31f-5121-4056-803b-0a9105e28ff4"
    },
    ["quantumcore_5"] = {
        Name = "Exotic Quantum Core",
        FullName = "Exotic Quantum Core",
        NqId = 850241762,
        NqRecipeId = 1457246788,
        GroupId = "08d8a31f-5114-4794-8c3c-f3756c8d4ca9"
    },
    ["RadarPVPSpaceMediumQuickwired5"] = {
        Name = "Exotic Quick-Wired Space Radar",
        FullName = "Exotic Quick-Wired Space Radar M",
        NqId = 2608116214,
        NqRecipeId = 1615649737,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargeQuickwired5"] = {
        Name = "Exotic Quick-Wired Space Radar",
        FullName = "Exotic Quick-Wired Space Radar L",
        NqId = 3612800254,
        NqRecipeId = 1773946997,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceSmallQuickwired5"] = {
        Name = "Exotic Quick-Wired Space Radar",
        FullName = "Exotic Quick-Wired Space Radar S",
        NqId = 838245690,
        NqRecipeId = 1511409841,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["reinforcedframe_5_m"] = {
        Name = "Exotic Reinforced Frame",
        FullName = "Exotic Reinforced Frame M",
        NqId = 994057943,
        NqRecipeId = 264376875,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_5_s"] = {
        Name = "Exotic Reinforced Frame",
        FullName = "Exotic Reinforced Frame S",
        NqId = 994057929,
        NqRecipeId = 264377041,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_5_xl"] = {
        Name = "Exotic Reinforced Frame",
        FullName = "Exotic Reinforced Frame XL",
        NqId = 1179593236,
        NqRecipeId = 493789454,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_5_xs"] = {
        Name = "Exotic Reinforced Frame",
        FullName = "Exotic Reinforced Frame XS",
        NqId = 1179593235,
        NqRecipeId = 493789493,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_5_l"] = {
        Name = "Exotic Reinforced Frame",
        FullName = "Exotic Reinforced Frame L",
        NqId = 994057936,
        NqRecipeId = 264376872,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["singularitycontainer_5"] = {
        Name = "Exotic Singularity Container",
        FullName = "Exotic Singularity Container",
        NqId = 3640212314,
        NqRecipeId = 1213606732,
        GroupId = "08d8a31f-5116-4472-84d8-1cf2de11b3a3"
    },
    ["standardframe_5_m"] = {
        Name = "Exotic Standard Frame",
        FullName = "Exotic Standard Frame M",
        NqId = 1981363756,
        NqRecipeId = 461735936,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_5_s"] = {
        Name = "Exotic Standard Frame",
        FullName = "Exotic Standard Frame S",
        NqId = 1981363926,
        NqRecipeId = 461735946,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_5_l"] = {
        Name = "Exotic Standard Frame",
        FullName = "Exotic Standard Frame L",
        NqId = 1981363757,
        NqRecipeId = 461735939,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_5_xs"] = {
        Name = "Exotic Standard Frame",
        FullName = "Exotic Standard Frame XS",
        NqId = 873614065,
        NqRecipeId = 503273440,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["StructuralPart5"] = {
        Name = "Exotic Structural Parts",
        FullName = "Exotic Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5159-4bb2-877d-6d69aec28495"
    },
    ["FunctionalPart5"] = {
        Name = "Exotic Structural Parts",
        FullName = "Exotic Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5124-4830-8c0e-147fd07bdd38"
    },
    ["Container_3_XXXL"] = {
        Name = "Expanded Advanced Optimised Container",
        FullName = "Expanded Advanced Optimised Container XL",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["ContainerXXXL"] = {
        Name = "Expanded Container",
        FullName = "Expanded Container XL",
        NqId = 572613525,
        NqRecipeId = 2020573717,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["Gate01_Large"] = {
        Name = "Expanded gate",
        FullName = "Expanded gate L",
        NqId = 1289884535,
        NqRecipeId = 1829978694,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Gate01_Small"] = {
        Name = "Expanded gate",
        FullName = "Expanded gate S",
        NqId = 581667413,
        NqRecipeId = 1815973316,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Container_4_XXXL"] = {
        Name = "Expanded Rare Optimised Container",
        FullName = "Expanded Rare Optimised Container XL",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["Container_2_XXXL"] = {
        Name = "Expanded Uncommon Optimised Container",
        FullName = "Expanded Uncommon Optimised Container XL",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["BacDeco08"] = {
        Name = "Ficus Plant A",
        FullName = "Ficus Plant A",
        NqId = 3106061140,
        NqRecipeId = 1734687572,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["BacDeco09"] = {
        Name = "Ficus Plant B",
        FullName = "Ficus Plant B",
        NqId = 3106061141,
        NqRecipeId = 1734687573,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["HoverEngineLargeUnder"] = {
        Name = "Flat hover engine",
        FullName = "Flat hover engine L",
        NqId = 1105322870,
        NqRecipeId = 1084256146,
        GroupId = "08d8a31f-5035-45c6-8733-05c1b2079f23"
    },
    ["FluorineScrap"] = {
        Name = "Fluorine Scrap",
        FullName = "Fluorine Scrap",
        NqId = 3150580281,
        NqRecipeId = 246016441,
        GroupId = "08d8a31f-4f37-4fa5-882d-57740730e9aa"
    },
    ["FluoropolymerProduct"] = {
        Name = "Fluoropolymer product",
        FullName = "Fluoropolymer product",
        NqId = 918590356,
        NqRecipeId = 265456655,
        GroupId = "08d8a31f-50cf-4f4a-8753-1a02f4b4c1fb"
    },
    ["BacDeco06"] = {
        Name = "Foliage Plant Case A",
        FullName = "Foliage Plant Case A",
        NqId = 3106061142,
        NqRecipeId = 1734687574,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["BacDeco07"] = {
        Name = "Foliage Plant Case B",
        FullName = "Foliage Plant Case B",
        NqId = 3106061143,
        NqRecipeId = 1734687575,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["ForceField1x1"] = {
        Name = "Force Field",
        FullName = "Force Field XS",
        NqId = 3686074288,
        NqRecipeId = 1674266416,
        GroupId = "08d8a31f-4fc5-43b4-8bec-802a1a5e26a1"
    },
    ["ForceField6x1"] = {
        Name = "Force Field",
        FullName = "Force Field L",
        NqId = 3685982092,
        NqRecipeId = 1674311180,
        GroupId = "08d8a31f-4fc5-43b4-8bec-802a1a5e26a1"
    },
    ["ForceField2x1"] = {
        Name = "Force Field",
        FullName = "Force Field S",
        NqId = 3685998465,
        NqRecipeId = 1674294273,
        GroupId = "08d8a31f-4fc5-43b4-8bec-802a1a5e26a1"
    },
    ["ForceField4x1"] = {
        Name = "Force Field",
        FullName = "Force Field M",
        NqId = 3686006062,
        NqRecipeId = 1674286766,
        GroupId = "08d8a31f-4fc5-43b4-8bec-802a1a5e26a1"
    },
    ["FuelIntake01"] = {
        Name = "Fuel Intake",
        FullName = "Fuel Intake XS",
        NqId = 764397251,
        NqRecipeId = 1834144963,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["SteelMattHCBeige"] = {
        Name = "Galvanized beige steel",
        FullName = "Galvanized beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumMattHCBlack"] = {
        Name = "Galvanized black aluminium",
        FullName = "Galvanized black aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumMattHCBlack"] = {
        Name = "Galvanized black Chromium",
        FullName = "Galvanized black Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperMattHCBlack"] = {
        Name = "Galvanized black Copper",
        FullName = "Galvanized black Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldMattHCBlack"] = {
        Name = "Galvanized black Gold",
        FullName = "Galvanized black Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronMattHCBlack"] = {
        Name = "Galvanized black iron",
        FullName = "Galvanized black iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["SteelMattHCBlack"] = {
        Name = "Galvanized black steel",
        FullName = "Galvanized black steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumMattHCBlack"] = {
        Name = "Galvanized black Titanium",
        FullName = "Galvanized black Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["SteelMattHCBlue"] = {
        Name = "Galvanized blue steel",
        FullName = "Galvanized blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCBeigeD"] = {
        Name = "Galvanized dark beige steel",
        FullName = "Galvanized dark beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCBlueD"] = {
        Name = "Galvanized dark blue steel",
        FullName = "Galvanized dark blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumMattHCGrayD"] = {
        Name = "Galvanized dark gray aluminium",
        FullName = "Galvanized dark gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumMattHCGrayD"] = {
        Name = "Galvanized dark gray Chromium",
        FullName = "Galvanized dark gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["GoldMattHCGrayD"] = {
        Name = "Galvanized dark gray Gold",
        FullName = "Galvanized dark gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronMattHCGrayD"] = {
        Name = "Galvanized dark gray iron",
        FullName = "Galvanized dark gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["SteelMattHCGrayD"] = {
        Name = "Galvanized dark gray steel",
        FullName = "Galvanized dark gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumMattHCGrayD"] = {
        Name = "Galvanized dark gray Titanium",
        FullName = "Galvanized dark gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["SteelMattHCGreenD"] = {
        Name = "Galvanized dark green steel",
        FullName = "Galvanized dark green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCOrangeD"] = {
        Name = "Galvanized dark orange steel",
        FullName = "Galvanized dark orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCRedD"] = {
        Name = "Galvanized dark red steel",
        FullName = "Galvanized dark red steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCYellowD"] = {
        Name = "Galvanized dark yellow steel",
        FullName = "Galvanized dark yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumMattHCGray"] = {
        Name = "Galvanized gray aluminium",
        FullName = "Galvanized gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumMattHCGray"] = {
        Name = "Galvanized gray Chromium",
        FullName = "Galvanized gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperMattHCGray"] = {
        Name = "Galvanized gray Copper",
        FullName = "Galvanized gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldMattHCGray"] = {
        Name = "Galvanized gray Gold",
        FullName = "Galvanized gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronMattHCGray"] = {
        Name = "Galvanized gray iron",
        FullName = "Galvanized gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["SteelMattHCGray"] = {
        Name = "Galvanized gray steel",
        FullName = "Galvanized gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumMattHCGray"] = {
        Name = "Galvanized gray Titanium",
        FullName = "Galvanized gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["SteelMattHCGreen"] = {
        Name = "Galvanized green steel",
        FullName = "Galvanized green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCBeigeL"] = {
        Name = "Galvanized light beige steel",
        FullName = "Galvanized light beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCBlueL"] = {
        Name = "Galvanized light blue steel",
        FullName = "Galvanized light blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumMattHCGrayL"] = {
        Name = "Galvanized light gray aluminium",
        FullName = "Galvanized light gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumMattHCGrayL"] = {
        Name = "Galvanized light gray Chromium",
        FullName = "Galvanized light gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperMattHCGrayL"] = {
        Name = "Galvanized light gray Copper",
        FullName = "Galvanized light gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldMattHCGrayL"] = {
        Name = "Galvanized light gray Gold",
        FullName = "Galvanized light gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronMattHCGrayL"] = {
        Name = "Galvanized light gray iron",
        FullName = "Galvanized light gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["SteelMattHCGrayL"] = {
        Name = "Galvanized light gray steel",
        FullName = "Galvanized light gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumMattHCGrayL"] = {
        Name = "Galvanized light gray Titanium",
        FullName = "Galvanized light gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["SteelMattHCGreenL"] = {
        Name = "Galvanized light green steel",
        FullName = "Galvanized light green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCOrangeL"] = {
        Name = "Galvanized light orange steel",
        FullName = "Galvanized light orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCRedL"] = {
        Name = "Galvanized light red steel",
        FullName = "Galvanized light red steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCYellowL"] = {
        Name = "Galvanized light yellow steel",
        FullName = "Galvanized light yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCOrange"] = {
        Name = "Galvanized orange steel",
        FullName = "Galvanized orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCRed"] = {
        Name = "Galvanized red steel",
        FullName = "Galvanized red steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["SteelMattHCRedCold"] = {
        Name = "Galvanized red steel (cold)",
        FullName = "Galvanized red steel (cold)",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumMattHCWhite"] = {
        Name = "Galvanized white aluminium",
        FullName = "Galvanized white aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumMattHCWhite"] = {
        Name = "Galvanized white Chromium",
        FullName = "Galvanized white Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperMattHCWhite"] = {
        Name = "Galvanized white Copper",
        FullName = "Galvanized white Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldMattHCWhite"] = {
        Name = "Galvanized white Gold",
        FullName = "Galvanized white Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronMattHCWhite"] = {
        Name = "Galvanized white iron",
        FullName = "Galvanized white iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["SteelMattHCWhite"] = {
        Name = "Galvanized white steel",
        FullName = "Galvanized white steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumMattHCWhite"] = {
        Name = "Galvanized white Titanium",
        FullName = "Galvanized white Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["SteelMattHCYellow"] = {
        Name = "Galvanized yellow steel",
        FullName = "Galvanized yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["NickelOre"] = {
        Name = "Garnierite",
        FullName = "Garnierite",
        NqId = 1065079614,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50bd-45c4-8ea5-3601d1f3d821"
    },
    ["Gate01_XSmall"] = {
        Name = "Gate",
        FullName = "Gate XS",
        NqId = 1097676949,
        NqRecipeId = 1043964370,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Gate01_XLarge"] = {
        Name = "Gate",
        FullName = "Gate XL",
        NqId = 1256519882,
        NqRecipeId = 1755885930,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Gate01_Medium"] = {
        Name = "Gate",
        FullName = "Gate M",
        NqId = 2858887382,
        NqRecipeId = 1350592195,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["GlassMedium"] = {
        Name = "Glass Panel",
        FullName = "Glass Panel M",
        NqId = 2266946860,
        NqRecipeId = 283407660,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["GlassLarge"] = {
        Name = "Glass Panel",
        FullName = "Glass Panel L",
        NqId = 1165506034,
        NqRecipeId = 2045974002,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["GlassSmall"] = {
        Name = "Glass Panel",
        FullName = "Glass Panel S",
        NqId = 561162197,
        NqRecipeId = 441567189,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["GlassProduct"] = {
        Name = "Glass product",
        FullName = "Glass product",
        NqId = 3308209457,
        NqRecipeId = 2118283057,
        GroupId = "08d8a31f-50cb-451e-8b92-1451ab8f4b38"
    },
    ["hcAlLiGlossy"] = {
        Name = "Glossy Al-Li",
        FullName = "Glossy Al-Li",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumGlossy"] = {
        Name = "Glossy Aluminium",
        FullName = "Glossy Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["PlasticBrightHCBeige"] = {
        Name = "Glossy beige plastic",
        FullName = "Glossy beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBeigeCold"] = {
        Name = "Glossy beige plastic (cold)",
        FullName = "Glossy beige plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["CarbonfiberBrightHCBlack"] = {
        Name = "Glossy black carbon fiber",
        FullName = "Glossy black carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["PlasticBrightHCBlack"] = {
        Name = "Glossy black plastic",
        FullName = "Glossy black plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlue"] = {
        Name = "Glossy blue plastic",
        FullName = "Glossy blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlueCold"] = {
        Name = "Glossy blue plastic (cold)",
        FullName = "Glossy blue plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcCalciumGlossy"] = {
        Name = "Glossy Calcium",
        FullName = "Glossy Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonGlossy"] = {
        Name = "Glossy Carbon",
        FullName = "Glossy Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumGlossy"] = {
        Name = "Glossy Chromium",
        FullName = "Glossy Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltGlossy"] = {
        Name = "Glossy Cobalt",
        FullName = "Glossy Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperGlossy"] = {
        Name = "Glossy Copper",
        FullName = "Glossy Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["PlasticBrightHCBeigeD"] = {
        Name = "Glossy dark beige plastic",
        FullName = "Glossy dark beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBeigeColdD"] = {
        Name = "Glossy dark beige plastic (cold)",
        FullName = "Glossy dark beige plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlueD"] = {
        Name = "Glossy dark blue plastic",
        FullName = "Glossy dark blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlueColdD"] = {
        Name = "Glossy dark blue plastic (cold)",
        FullName = "Glossy dark blue plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["CarbonfiberBrightHCGrayD"] = {
        Name = "Glossy dark gray carbon fiber",
        FullName = "Glossy dark gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["PlasticBrightHCGrayD"] = {
        Name = "Glossy dark gray plastic",
        FullName = "Glossy dark gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreenD"] = {
        Name = "Glossy dark green plastic",
        FullName = "Glossy dark green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreenColdD"] = {
        Name = "Glossy dark green plastic (cold)",
        FullName = "Glossy dark green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCOrangeD"] = {
        Name = "Glossy dark orange plastic",
        FullName = "Glossy dark orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCOrangeColdD"] = {
        Name = "Glossy dark orange plastic (cold)",
        FullName = "Glossy dark orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRedD"] = {
        Name = "Glossy dark red plastic",
        FullName = "Glossy dark red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRedColdD"] = {
        Name = "Glossy dark red plastic (cold)",
        FullName = "Glossy dark red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellowD"] = {
        Name = "Glossy dark yellow plastic",
        FullName = "Glossy dark yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellowColdD"] = {
        Name = "Glossy dark yellow plastic (cold)",
        FullName = "Glossy dark yellow plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcDuraluminGlossy"] = {
        Name = "Glossy Duralumin",
        FullName = "Glossy Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorineGlossy"] = {
        Name = "Glossy Fluorine",
        FullName = "Glossy Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldGlossy"] = {
        Name = "Glossy Gold",
        FullName = "Glossy Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyGlossy"] = {
        Name = "Glossy Grade 5 Titanium Alloy",
        FullName = "Glossy Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["CarbonfiberBrightHCGray"] = {
        Name = "Glossy gray carbon fiber",
        FullName = "Glossy gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["PlasticBrightHCGray"] = {
        Name = "Glossy gray plastic",
        FullName = "Glossy gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreen"] = {
        Name = "Glossy green plastic",
        FullName = "Glossy green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreenCold"] = {
        Name = "Glossy green plastic (cold)",
        FullName = "Glossy green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcInconelGlossy"] = {
        Name = "Glossy Inconel",
        FullName = "Glossy Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronGlossy"] = {
        Name = "Glossy Iron",
        FullName = "Glossy Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["PlasticBrightHCBeigeL"] = {
        Name = "Glossy light beige plastic",
        FullName = "Glossy light beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBeigeColdL"] = {
        Name = "Glossy light beige plastic (cold)",
        FullName = "Glossy light beige plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlueL"] = {
        Name = "Glossy light blue plastic",
        FullName = "Glossy light blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCBlueColdL"] = {
        Name = "Glossy light blue plastic (cold)",
        FullName = "Glossy light blue plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["CarbonfiberBrightHCGrayL"] = {
        Name = "Glossy light gray carbon fiber",
        FullName = "Glossy light gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["PlasticBrightHCGrayL"] = {
        Name = "Glossy light gray plastic",
        FullName = "Glossy light gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreenL"] = {
        Name = "Glossy light green plastic",
        FullName = "Glossy light green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCGreenColdL"] = {
        Name = "Glossy light green plastic (cold)",
        FullName = "Glossy light green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCOrangeL"] = {
        Name = "Glossy light orange plastic",
        FullName = "Glossy light orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCOrangeColdL"] = {
        Name = "Glossy light orange plastic (cold)",
        FullName = "Glossy light orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRedL"] = {
        Name = "Glossy light red plastic",
        FullName = "Glossy light red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRedColdL"] = {
        Name = "Glossy light red plastic (cold)",
        FullName = "Glossy light red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellowL"] = {
        Name = "Glossy light yellow plastic",
        FullName = "Glossy light yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellowColdL"] = {
        Name = "Glossy light yellow plastic (cold)",
        FullName = "Glossy light yellow plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcLithiumGlossy"] = {
        Name = "Glossy Lithium",
        FullName = "Glossy Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyGlossy"] = {
        Name = "Glossy Mangalloy",
        FullName = "Glossy Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganeseGlossy"] = {
        Name = "Glossy Manganese",
        FullName = "Glossy Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelGlossy"] = {
        Name = "Glossy Maraging Steel",
        FullName = "Glossy Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelGlossy"] = {
        Name = "Glossy Nickel",
        FullName = "Glossy Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumGlossy"] = {
        Name = "Glossy Niobium",
        FullName = "Glossy Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["PlasticBrightHCOrange"] = {
        Name = "Glossy orange plastic",
        FullName = "Glossy orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCOrangeCold"] = {
        Name = "Glossy orange plastic (cold)",
        FullName = "Glossy orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRed"] = {
        Name = "Glossy red plastic",
        FullName = "Glossy red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCRedCold"] = {
        Name = "Glossy red plastic (cold)",
        FullName = "Glossy red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcScAlGlossy"] = {
        Name = "Glossy Sc-Al",
        FullName = "Glossy Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumGlossy"] = {
        Name = "Glossy Scandium",
        FullName = "Glossy Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconGlossy"] = {
        Name = "Glossy Silicon",
        FullName = "Glossy Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminGlossy"] = {
        Name = "Glossy Silumin",
        FullName = "Glossy Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverGlossy"] = {
        Name = "Glossy Silver",
        FullName = "Glossy Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumGlossy"] = {
        Name = "Glossy Sodium",
        FullName = "Glossy Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelGlossy"] = {
        Name = "Glossy Stainless Steel",
        FullName = "Glossy Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelGlossy"] = {
        Name = "Glossy Steel",
        FullName = "Glossy Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurGlossy"] = {
        Name = "Glossy Sulfur",
        FullName = "Glossy Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumGlossy"] = {
        Name = "Glossy Titanium",
        FullName = "Glossy Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumGlossy"] = {
        Name = "Glossy Vanadium",
        FullName = "Glossy Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["CarbonfiberBrightHCWhite"] = {
        Name = "Glossy white carbon fiber",
        FullName = "Glossy white carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["PlasticBrightHCWhite"] = {
        Name = "Glossy white plastic",
        FullName = "Glossy white plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellow"] = {
        Name = "Glossy yellow plastic",
        FullName = "Glossy yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticBrightHCYellowCold"] = {
        Name = "Glossy yellow plastic",
        FullName = "Glossy yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["GoldOre"] = {
        Name = "Gold nuggets",
        FullName = "Gold nuggets",
        NqId = 1866812055,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c1-4ec5-8739-9b7ac95ed2d9"
    },
    ["GoldScrap"] = {
        Name = "Gold Scrap",
        FullName = "Gold Scrap",
        NqId = 1032380176,
        NqRecipeId = 882728720,
        GroupId = "08d8a31f-4f37-4fa5-882d-57740730e9aa"
    },
    ["GoldCoatedGlassProduct"] = {
        Name = "Gold-Coated glass product",
        FullName = "Gold-Coated glass product",
        NqId = 606249095,
        NqRecipeId = 1937471208,
        GroupId = "08d8a31f-50cb-451e-8b92-1451ab8f4b38"
    },
    ["Grade5TitaniumAlloyProduct"] = {
        Name = "Grade 5 Titanium Alloy product",
        FullName = "Grade 5 Titanium Alloy product",
        NqId = 3292291904,
        NqRecipeId = 268240299,
        GroupId = "08d8a31f-50ce-45fd-88b9-0da7fa7c4e5a"
    },
    ["hcAlLiPanelGray"] = {
        Name = "Gray Al-Li Panel",
        FullName = "Gray Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelGray"] = {
        Name = "Gray Aluminium Panel",
        FullName = "Gray Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelGray"] = {
        Name = "Gray Calcium Panel",
        FullName = "Gray Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelGray"] = {
        Name = "Gray Carbon Panel",
        FullName = "Gray Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelGray"] = {
        Name = "Gray Chromium Panel",
        FullName = "Gray Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelGray"] = {
        Name = "Gray Cobalt Panel",
        FullName = "Gray Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelGray"] = {
        Name = "Gray Copper Panel",
        FullName = "Gray Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelGray"] = {
        Name = "Gray Duralumin Panel",
        FullName = "Gray Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelGray"] = {
        Name = "Gray Fluorine Panel",
        FullName = "Gray Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelGray"] = {
        Name = "Gray Gold Panel",
        FullName = "Gray Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelGray"] = {
        Name = "Gray Grade 5 Titanium Alloy Panel",
        FullName = "Gray Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelGray"] = {
        Name = "Gray Inconel Panel",
        FullName = "Gray Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelGray"] = {
        Name = "Gray Iron Panel",
        FullName = "Gray Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelGray"] = {
        Name = "Gray Lithium Panel",
        FullName = "Gray Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelGray"] = {
        Name = "Gray Mangalloy Panel",
        FullName = "Gray Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelGray"] = {
        Name = "Gray Manganese Panel",
        FullName = "Gray Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelGray"] = {
        Name = "Gray Maraging Steel Panel",
        FullName = "Gray Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelGray"] = {
        Name = "Gray Nickel Panel",
        FullName = "Gray Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelGray"] = {
        Name = "Gray Niobium Panel",
        FullName = "Gray Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["BrickTileHCGray"] = {
        Name = "Gray pattern brick",
        FullName = "Gray pattern brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberTileHCGray"] = {
        Name = "Gray pattern carbon fiber",
        FullName = "Gray pattern carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ChromiumTileHCGray"] = {
        Name = "Gray pattern Chromium",
        FullName = "Gray pattern Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["ConcreteTileHCGray"] = {
        Name = "Gray pattern concrete",
        FullName = "Gray pattern concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["CopperTileHCGray"] = {
        Name = "Gray pattern Copper",
        FullName = "Gray pattern Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldTileHCGray"] = {
        Name = "Gray pattern Gold",
        FullName = "Gray pattern Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronTileHCGray"] = {
        Name = "Gray pattern iron",
        FullName = "Gray pattern iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleTileHCGray"] = {
        Name = "Gray pattern marble",
        FullName = "Gray pattern marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGray"] = {
        Name = "Gray pattern plastic",
        FullName = "Gray pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGray"] = {
        Name = "Gray pattern steel",
        FullName = "Gray pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumTileHCGray"] = {
        Name = "Gray pattern Titanium",
        FullName = "Gray pattern Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodTileHCGray"] = {
        Name = "Gray pattern wood",
        FullName = "Gray pattern wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["hcScAlPanelGray"] = {
        Name = "Gray Sc-Al Panel",
        FullName = "Gray Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelGray"] = {
        Name = "Gray Scandium Panel",
        FullName = "Gray Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelGray"] = {
        Name = "Gray Silicon Panel",
        FullName = "Gray Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelGray"] = {
        Name = "Gray Silumin Panel",
        FullName = "Gray Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelGray"] = {
        Name = "Gray Silver Panel",
        FullName = "Gray Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelGray"] = {
        Name = "Gray Sodium Panel",
        FullName = "Gray Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelGray"] = {
        Name = "Gray Stainless Steel Panel",
        FullName = "Gray Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelGray"] = {
        Name = "Gray Steel Panel",
        FullName = "Gray Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelGray"] = {
        Name = "Gray Sulfur Panel",
        FullName = "Gray Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelGray"] = {
        Name = "Gray Titanium Panel",
        FullName = "Gray Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelGray"] = {
        Name = "Gray Vanadium Panel",
        FullName = "Gray Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAlLiPanelGreen"] = {
        Name = "Green Al-Li Panel",
        FullName = "Green Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelGreen"] = {
        Name = "Green Aluminium Panel",
        FullName = "Green Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelGreen"] = {
        Name = "Green Calcium Panel",
        FullName = "Green Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelGreen"] = {
        Name = "Green Carbon Panel",
        FullName = "Green Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelGreen"] = {
        Name = "Green Chromium Panel",
        FullName = "Green Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelGreen"] = {
        Name = "Green Cobalt Panel",
        FullName = "Green Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelGreen"] = {
        Name = "Green Copper Panel",
        FullName = "Green Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelGreen"] = {
        Name = "Green Duralumin Panel",
        FullName = "Green Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelGreen"] = {
        Name = "Green Fluorine Panel",
        FullName = "Green Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelGreen"] = {
        Name = "Green Gold Panel",
        FullName = "Green Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelGreen"] = {
        Name = "Green Grade 5 Titanium Alloy Panel",
        FullName = "Green Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelGreen"] = {
        Name = "Green Inconel Panel",
        FullName = "Green Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelGreen"] = {
        Name = "Green Iron Panel",
        FullName = "Green Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelGreen"] = {
        Name = "Green Lithium Panel",
        FullName = "Green Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelGreen"] = {
        Name = "Green Mangalloy Panel",
        FullName = "Green Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelGreen"] = {
        Name = "Green Manganese Panel",
        FullName = "Green Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelGreen"] = {
        Name = "Green Maraging Steel Panel",
        FullName = "Green Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelGreen"] = {
        Name = "Green Nickel Panel",
        FullName = "Green Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelGreen"] = {
        Name = "Green Niobium Panel",
        FullName = "Green Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleTileHCGreenCold"] = {
        Name = "Green pattern marble (cold)",
        FullName = "Green pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGreen"] = {
        Name = "Green pattern plastic",
        FullName = "Green pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCGreenCold"] = {
        Name = "Green pattern plastic (cold)",
        FullName = "Green pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGreen"] = {
        Name = "Green pattern steel",
        FullName = "Green pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcScAlPanelGreen"] = {
        Name = "Green Sc-Al Panel",
        FullName = "Green Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelGreen"] = {
        Name = "Green Scandium Panel",
        FullName = "Green Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelGreen"] = {
        Name = "Green Silicon Panel",
        FullName = "Green Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelGreen"] = {
        Name = "Green Silumin Panel",
        FullName = "Green Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelGreen"] = {
        Name = "Green Silver Panel",
        FullName = "Green Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelGreen"] = {
        Name = "Green Sodium Panel",
        FullName = "Green Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelGreen"] = {
        Name = "Green Stainless Steel Panel",
        FullName = "Green Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelGreen"] = {
        Name = "Green Steel Panel",
        FullName = "Green Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelGreen"] = {
        Name = "Green Sulfur Panel",
        FullName = "Green Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelGreen"] = {
        Name = "Green Titanium Panel",
        FullName = "Green Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelGreen"] = {
        Name = "Green Vanadium Panel",
        FullName = "Green Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["PVPSeatMedium"] = {
        Name = "Gunner Module",
        FullName = "Gunner Module M",
        NqId = 564736657,
        NqRecipeId = 481252113,
        GroupId = "08d8a31f-4f40-496a-8321-7e5f9379bf7a"
    },
    ["PVPSeat"] = {
        Name = "Gunner Module",
        FullName = "Gunner Module S",
        NqId = 1373443625,
        NqRecipeId = 92608041,
        GroupId = "08d8a31f-4f40-496a-8321-7e5f9379bf7a"
    },
    ["PVPSeatLarge"] = {
        Name = "Gunner Module",
        FullName = "Gunner Module L",
        NqId = 3327293642,
        NqRecipeId = 1169456842,
        GroupId = "08d8a31f-4f40-496a-8321-7e5f9379bf7a"
    },
    ["Gyroscope"] = {
        Name = "Gyroscope",
        FullName = "Gyroscope",
        NqId = 2585415184,
        NqRecipeId = 1864027664,
        GroupId = "08d8a31f-5040-4413-8dbd-c171a7e84129"
    },
    ["HatchSmall"] = {
        Name = "Hatch",
        FullName = "Hatch S",
        NqId = 297147615,
        NqRecipeId = 707706079,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Headlight"] = {
        Name = "Headlight",
        FullName = "Headlight",
        NqId = 787207321,
        NqRecipeId = 1371427993,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["IronOre"] = {
        Name = "Hematite",
        FullName = "Hematite",
        NqId = 4234772167,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50be-4dfa-8466-916146e77841"
    },
    ["HoverEngineMedium"] = {
        Name = "Hover engine",
        FullName = "Hover engine M",
        NqId = 2991279664,
        NqRecipeId = 1537168127,
        GroupId = "08d8a31f-5035-45c6-8733-05c1b2079f23"
    },
    ["HoverEngineSmall"] = {
        Name = "Hover engine",
        FullName = "Hover engine S",
        NqId = 2333052331,
        NqRecipeId = 1108551777,
        GroupId = "08d8a31f-5035-45c6-8733-05c1b2079f23"
    },
    ["HoverEngineLarge"] = {
        Name = "Hover engine",
        FullName = "Hover engine L",
        NqId = 2494203891,
        NqRecipeId = 344141425,
        GroupId = "08d8a31f-5035-45c6-8733-05c1b2079f23"
    },
    ["CockpitHovercraft"] = {
        Name = "Hovercraft seat controller",
        FullName = "Hovercraft seat controller",
        NqId = 1744160618,
        NqRecipeId = 169430436,
        GroupId = "08d8a31f-4f3f-45e5-862e-fd2f794fed1b"
    },
    ["AdjunctTop_01"] = {
        Name = "Hull decorative Element A",
        FullName = "Hull decorative Element A",
        NqId = 3337817677,
        NqRecipeId = 31749653,
        GroupId = "08d8a31f-4fa1-430f-8ebe-83061310cfc1"
    },
    ["AdjunctTop_02"] = {
        Name = "Hull decorative Element B",
        FullName = "Hull decorative Element B",
        NqId = 3337817674,
        NqRecipeId = 31749652,
        GroupId = "08d8a31f-4fa1-430f-8ebe-83061310cfc1"
    },
    ["AdjunctTop_03"] = {
        Name = "Hull decorative Element C",
        FullName = "Hull decorative Element C",
        NqId = 3337817675,
        NqRecipeId = 31749659,
        GroupId = "08d8a31f-4fa1-430f-8ebe-83061310cfc1"
    },
    ["hcAlLiPanelIce"] = {
        Name = "Ice Al-Li Panel",
        FullName = "Ice Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelIce"] = {
        Name = "Ice Aluminium Panel",
        FullName = "Ice Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelIce"] = {
        Name = "Ice Calcium Panel",
        FullName = "Ice Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelIce"] = {
        Name = "Ice Carbon Panel",
        FullName = "Ice Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelIce"] = {
        Name = "Ice Chromium Panel",
        FullName = "Ice Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelIce"] = {
        Name = "Ice Cobalt Panel",
        FullName = "Ice Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelIce"] = {
        Name = "Ice Copper Panel",
        FullName = "Ice Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelIce"] = {
        Name = "Ice Duralumin Panel",
        FullName = "Ice Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelIce"] = {
        Name = "Ice Fluorine Panel",
        FullName = "Ice Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelIce"] = {
        Name = "Ice Gold Panel",
        FullName = "Ice Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelIce"] = {
        Name = "Ice Grade 5 Titanium Alloy Panel",
        FullName = "Ice Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelIce"] = {
        Name = "Ice Inconel Panel",
        FullName = "Ice Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelIce"] = {
        Name = "Ice Iron Panel",
        FullName = "Ice Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelIce"] = {
        Name = "Ice Lithium Panel",
        FullName = "Ice Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelIce"] = {
        Name = "Ice Mangalloy Panel",
        FullName = "Ice Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelIce"] = {
        Name = "Ice Manganese Panel",
        FullName = "Ice Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelIce"] = {
        Name = "Ice Maraging Steel Panel",
        FullName = "Ice Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelIce"] = {
        Name = "Ice Nickel Panel",
        FullName = "Ice Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelIce"] = {
        Name = "Ice Niobium Panel",
        FullName = "Ice Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelIce"] = {
        Name = "Ice Sc-Al Panel",
        FullName = "Ice Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelIce"] = {
        Name = "Ice Scandium Panel",
        FullName = "Ice Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelIce"] = {
        Name = "Ice Silicon Panel",
        FullName = "Ice Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelIce"] = {
        Name = "Ice Silumin Panel",
        FullName = "Ice Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelIce"] = {
        Name = "Ice Silver Panel",
        FullName = "Ice Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelIce"] = {
        Name = "Ice Sodium Panel",
        FullName = "Ice Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelIce"] = {
        Name = "Ice Stainless Steel Panel",
        FullName = "Ice Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelIce"] = {
        Name = "Ice Steel Panel",
        FullName = "Ice Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelIce"] = {
        Name = "Ice Sulfur Panel",
        FullName = "Ice Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelIce"] = {
        Name = "Ice Titanium Panel",
        FullName = "Ice Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelIce"] = {
        Name = "Ice Vanadium Panel",
        FullName = "Ice Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["TitaniumOre"] = {
        Name = "Illmenite",
        FullName = "Illmenite",
        NqId = 629636034,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c3-4814-875e-27353e233d6c"
    },
    ["InconelProduct"] = {
        Name = "Inconel product",
        FullName = "Inconel product",
        NqId = 167908167,
        NqRecipeId = 395277223,
        GroupId = "08d8a31f-50cc-4ded-8dcb-a7255197db20"
    },
    ["InfoButton"] = {
        Name = "Info Button",
        FullName = "Info Button S",
        NqId = 3996923355,
        NqRecipeId = 573445595,
        GroupId = "08d8a31f-4fa6-412d-861a-084fa302d3d2"
    },
    ["IREmitter"] = {
        Name = "Infrared Laser Emitter",
        FullName = "Infrared Laser Emitter",
        NqId = 609676854,
        NqRecipeId = 353332790,
        GroupId = "08d8a31f-4faf-492f-8d6d-f1999e2e76fc"
    },
    ["IRDetector"] = {
        Name = "Infrared Laser Receiver",
        FullName = "Infrared Laser Receiver",
        NqId = 2153998731,
        NqRecipeId = 2094270859,
        GroupId = "08d8a31f-4fbb-4b9f-8f5a-b11af73b31d6"
    },
    ["Door_interior_01"] = {
        Name = "Interior door",
        FullName = "Interior door",
        NqId = 3709017308,
        NqRecipeId = 1176770283,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["IronScrap"] = {
        Name = "Iron Scrap",
        FullName = "Iron Scrap",
        NqId = 2558961706,
        NqRecipeId = 966207530,
        GroupId = "08d8a31f-4f35-4e5c-84a4-fca5d5dc27d0"
    },
    ["Kergon1"] = {
        Name = "Kergon-X1 fuel",
        FullName = "Kergon-X1 fuel",
        NqId = 840202980,
        NqRecipeId = 1397521124,
        GroupId = "08d8a31f-5050-4555-8741-1bd04504b575"
    },
    ["Kergon2"] = {
        Name = "Kergon-X2 fuel",
        FullName = "Kergon-X2 fuel",
        NqId = 840202981,
        NqRecipeId = 1397521125,
        GroupId = "08d8a31f-5050-4555-8741-1bd04504b575"
    },
    ["Kergon3"] = {
        Name = "Kergon-X3 fuel",
        FullName = "Kergon-X3 fuel",
        NqId = 840202986,
        NqRecipeId = 1397521130,
        GroupId = "08d8a31f-5050-4555-8741-1bd04504b575"
    },
    ["Kergon4"] = {
        Name = "Kergon-X4 fuel",
        FullName = "Kergon-X4 fuel",
        NqId = 840202987,
        NqRecipeId = 1397521131,
        GroupId = "08d8a31f-5050-4555-8741-1bd04504b575"
    },
    ["Board"] = {
        Name = "Keyboard unit",
        FullName = "Keyboard unit",
        NqId = 542805258,
        NqRecipeId = 920292618,
        GroupId = "08d8a31f-4f9d-4685-868d-d11558c84c9b"
    },
    ["ScandiumOre"] = {
        Name = "Kolbeckite",
        FullName = "Kolbeckite",
        NqId = 271971371,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c1-4ec5-8739-9b7ac95ed2d9"
    },
    ["LandingGearLarge"] = {
        Name = "Landing Gear",
        FullName = "Landing Gear L",
        NqId = 2667697870,
        NqRecipeId = 2042441808,
        GroupId = "08d8a31f-5041-475a-8070-219949aeae13"
    },
    ["LandingGearXSmall"] = {
        Name = "Landing Gear",
        FullName = "Landing Gear XS",
        NqId = 4078067869,
        NqRecipeId = 1213445187,
        GroupId = "08d8a31f-5041-475a-8070-219949aeae13"
    },
    ["LandingGearMedium"] = {
        Name = "Landing Gear",
        FullName = "Landing Gear M",
        NqId = 1899560165,
        NqRecipeId = 239089346,
        GroupId = "08d8a31f-5041-475a-8070-219949aeae13"
    },
    ["LandingGearSmall"] = {
        Name = "Landing Gear",
        FullName = "Landing Gear S",
        NqId = 1884031929,
        NqRecipeId = 224722815,
        GroupId = "08d8a31f-5041-475a-8070-219949aeae13"
    },
    ["WeaponLaserExtraSmall1"] = {
        Name = "laser",
        FullName = "laser XS",
        NqId = 11309408,
        NqRecipeId = 1638694749,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserSmall1"] = {
        Name = "laser",
        FullName = "laser S",
        NqId = 32593579,
        NqRecipeId = 133213585,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponLaserMedium1"] = {
        Name = "laser",
        FullName = "laser M",
        NqId = 1117413121,
        NqRecipeId = 152543060,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserLarge1"] = {
        Name = "laser",
        FullName = "laser L",
        NqId = 3516228574,
        NqRecipeId = 1944110665,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["AmmoLaserLargeElectromagneticAdvancedAgile"] = {
        Name = "Laser Agile Electromagnetic Ammo",
        FullName = "Laser Agile Electromagnetic Ammo L",
        NqId = 2170035253,
        NqRecipeId = 344005956,
        GroupId = "08d8a31f-4f20-4203-89db-3d5d8b1a3f18"
    },
    ["AmmoLaserExtraSmallElectromagneticAdvancedAgile"] = {
        Name = "Laser Agile Electromagnetic Ammo",
        FullName = "Laser Agile Electromagnetic Ammo XS",
        NqId = 552630719,
        NqRecipeId = 1581389033,
        GroupId = "08d8a31f-4f1e-4b81-8978-a8b4620c3837"
    },
    ["AmmoLaserSmallElectromagneticAdvancedAgile"] = {
        Name = "Laser Agile Electromagnetic Ammo",
        FullName = "Laser Agile Electromagnetic Ammo S",
        NqId = 3098134459,
        NqRecipeId = 1513392387,
        GroupId = "08d8a31f-4f23-42ea-8f2b-61213124e3b3"
    },
    ["AmmoLaserMediumElectromagneticAdvancedAgile"] = {
        Name = "Laser Agile Electromagnetic Ammo",
        FullName = "Laser Agile Electromagnetic Ammo M",
        NqId = 2948970732,
        NqRecipeId = 1249716347,
        GroupId = "08d8a31f-4f21-4dc8-81a0-b119544085c0"
    },
    ["AmmoLaserSmallThermicAdvancedAgile"] = {
        Name = "Laser Agile Thermic Ammo",
        FullName = "Laser Agile Thermic Ammo S",
        NqId = 3423590348,
        NqRecipeId = 2078074486,
        GroupId = "08d8a31f-4f23-494e-8a09-774493bf0cf5"
    },
    ["AmmoLaserMediumThermicAdvancedAgile"] = {
        Name = "Laser Agile Thermic Ammo",
        FullName = "Laser Agile Thermic Ammo M",
        NqId = 212874547,
        NqRecipeId = 2141752235,
        GroupId = "08d8a31f-4f22-4615-87de-ac192a16114b"
    },
    ["AmmoLaserExtraSmallThermicAdvancedAgile"] = {
        Name = "Laser Agile Thermic Ammo",
        FullName = "Laser Agile Thermic Ammo XS",
        NqId = 570530668,
        NqRecipeId = 1179457308,
        GroupId = "08d8a31f-4f1f-40e3-8d2d-ef94d08a2c39"
    },
    ["AmmoLaserLargeThermicAdvancedAgile"] = {
        Name = "Laser Agile Thermic Ammo",
        FullName = "Laser Agile Thermic Ammo L",
        NqId = 154196902,
        NqRecipeId = 371518577,
        GroupId = "08d8a31f-4f20-4c1b-82b7-c542dbf7edc0"
    },
    ["AmmoLaserLargeElectromagneticAdvancedDefense"] = {
        Name = "Laser Defense Electromagnetic Ammo",
        FullName = "Laser Defense Electromagnetic Ammo L",
        NqId = 2006239134,
        NqRecipeId = 1644899343,
        GroupId = "08d8a31f-4f20-4203-89db-3d5d8b1a3f18"
    },
    ["AmmoLaserExtraSmallElectromagneticAdvancedDefense"] = {
        Name = "Laser Defense Electromagnetic Ammo",
        FullName = "Laser Defense Electromagnetic Ammo XS",
        NqId = 1067471403,
        NqRecipeId = 2110027266,
        GroupId = "08d8a31f-4f1e-4b81-8978-a8b4620c3837"
    },
    ["AmmoLaserMediumElectromagneticAdvancedDefense"] = {
        Name = "Laser Defense Electromagnetic Ammo",
        FullName = "Laser Defense Electromagnetic Ammo M",
        NqId = 483699778,
        NqRecipeId = 1195223763,
        GroupId = "08d8a31f-4f21-4dc8-81a0-b119544085c0"
    },
    ["AmmoLaserSmallElectromagneticAdvancedDefense"] = {
        Name = "Laser Defense Electromagnetic Ammo",
        FullName = "Laser Defense Electromagnetic Ammo S",
        NqId = 2667876309,
        NqRecipeId = 911558157,
        GroupId = "08d8a31f-4f23-42ea-8f2b-61213124e3b3"
    },
    ["AmmoLaserExtraSmallThermicAdvancedDefense"] = {
        Name = "Laser Defense Thermic Ammo",
        FullName = "Laser Defense Thermic Ammo XS",
        NqId = 839159661,
        NqRecipeId = 1403753738,
        GroupId = "08d8a31f-4f1f-40e3-8d2d-ef94d08a2c39"
    },
    ["AmmoLaserMediumThermicAdvancedDefense"] = {
        Name = "Laser Defense Thermic Ammo",
        FullName = "Laser Defense Thermic Ammo M",
        NqId = 1230483435,
        NqRecipeId = 320610684,
        GroupId = "08d8a31f-4f22-4615-87de-ac192a16114b"
    },
    ["AmmoLaserLargeThermicAdvancedDefense"] = {
        Name = "Laser Defense Thermic Ammo",
        FullName = "Laser Defense Thermic Ammo L",
        NqId = 2619099776,
        NqRecipeId = 1277322479,
        GroupId = "08d8a31f-4f20-4c1b-82b7-c542dbf7edc0"
    },
    ["AmmoLaserSmallThermicAdvancedDefense"] = {
        Name = "Laser Defense Thermic Ammo",
        FullName = "Laser Defense Thermic Ammo S",
        NqId = 1933474332,
        NqRecipeId = 1795918572,
        GroupId = "08d8a31f-4f23-494e-8a09-774493bf0cf5"
    },
    ["AmmoLaserMediumElectromagneticUncommon"] = {
        Name = "Laser Electromagnetic Ammo",
        FullName = "Laser Electromagnetic Ammo M",
        NqId = 1693315392,
        NqRecipeId = 1977695834,
        GroupId = "08d8a31f-4f21-4dc8-81a0-b119544085c0"
    },
    ["AmmoLaserLargeElectromagneticUncommon"] = {
        Name = "Laser Electromagnetic Ammo",
        FullName = "Laser Electromagnetic Ammo L",
        NqId = 2465107224,
        NqRecipeId = 272926908,
        GroupId = "08d8a31f-4f20-4203-89db-3d5d8b1a3f18"
    },
    ["AmmoLaserSmallElectromagneticUncommon"] = {
        Name = "Laser Electromagnetic Ammo",
        FullName = "Laser Electromagnetic Ammo S",
        NqId = 1921694649,
        NqRecipeId = 1316609496,
        GroupId = "08d8a31f-4f23-42ea-8f2b-61213124e3b3"
    },
    ["AmmoLaserExtraSmallElectromagneticUncommon"] = {
        Name = "Laser Electromagnetic Ammo",
        FullName = "Laser Electromagnetic Ammo XS",
        NqId = 3637130597,
        NqRecipeId = 1972088695,
        GroupId = "08d8a31f-4f1e-4b81-8978-a8b4620c3837"
    },
    ["LaserEmitter"] = {
        Name = "Laser Emitter",
        FullName = "Laser Emitter",
        NqId = 1784722190,
        NqRecipeId = 835758350,
        GroupId = "08d8a31f-4faf-492f-8d6d-f1999e2e76fc"
    },
    ["AmmoLaserLargeElectromagneticAdvancedHeavy"] = {
        Name = "Laser Heavy Electromagnetic Ammo",
        FullName = "Laser Heavy Electromagnetic Ammo L",
        NqId = 2281477958,
        NqRecipeId = 1629300875,
        GroupId = "08d8a31f-4f20-4203-89db-3d5d8b1a3f18"
    },
    ["AmmoLaserSmallElectromagneticAdvancedHeavy"] = {
        Name = "Laser Heavy Electromagnetic Ammo",
        FullName = "Laser Heavy Electromagnetic Ammo S",
        NqId = 1929049234,
        NqRecipeId = 61178004,
        GroupId = "08d8a31f-4f23-42ea-8f2b-61213124e3b3"
    },
    ["AmmoLaserExtraSmallElectromagneticAdvancedHeavy"] = {
        Name = "Laser Heavy Electromagnetic Ammo",
        FullName = "Laser Heavy Electromagnetic Ammo XS",
        NqId = 902792933,
        NqRecipeId = 1344455519,
        GroupId = "08d8a31f-4f1e-4b81-8978-a8b4620c3837"
    },
    ["AmmoLaserMediumElectromagneticAdvancedHeavy"] = {
        Name = "Laser Heavy Electromagnetic Ammo",
        FullName = "Laser Heavy Electromagnetic Ammo M",
        NqId = 220854647,
        NqRecipeId = 284063445,
        GroupId = "08d8a31f-4f21-4dc8-81a0-b119544085c0"
    },
    ["AmmoLaserMediumThermicAdvancedHeavy"] = {
        Name = "Laser Heavy Thermic Ammo",
        FullName = "Laser Heavy Thermic Ammo M",
        NqId = 984810201,
        NqRecipeId = 1151152991,
        GroupId = "08d8a31f-4f22-4615-87de-ac192a16114b"
    },
    ["AmmoLaserSmallThermicAdvancedHeavy"] = {
        Name = "Laser Heavy Thermic Ammo",
        FullName = "Laser Heavy Thermic Ammo S",
        NqId = 1750052574,
        NqRecipeId = 1691480974,
        GroupId = "08d8a31f-4f23-494e-8a09-774493bf0cf5"
    },
    ["AmmoLaserExtraSmallThermicAdvancedHeavy"] = {
        Name = "Laser Heavy Thermic Ammo",
        FullName = "Laser Heavy Thermic Ammo XS",
        NqId = 2678465305,
        NqRecipeId = 1007613797,
        GroupId = "08d8a31f-4f1f-40e3-8d2d-ef94d08a2c39"
    },
    ["AmmoLaserLargeThermicAdvancedHeavy"] = {
        Name = "Laser Heavy Thermic Ammo",
        FullName = "Laser Heavy Thermic Ammo L",
        NqId = 518572846,
        NqRecipeId = 1828011659,
        GroupId = "08d8a31f-4f20-4c1b-82b7-c542dbf7edc0"
    },
    ["AmmoLaserSmallElectromagneticAdvancedPrecision"] = {
        Name = "Laser Precision Electromagnetic Ammo",
        FullName = "Laser Precision Electromagnetic Ammo S",
        NqId = 4088065384,
        NqRecipeId = 615717736,
        GroupId = "08d8a31f-4f23-42ea-8f2b-61213124e3b3"
    },
    ["AmmoLaserMediumElectromagneticAdvancedPrecision"] = {
        Name = "Laser Precision Electromagnetic Ammo",
        FullName = "Laser Precision Electromagnetic Ammo M",
        NqId = 1610308198,
        NqRecipeId = 1560320163,
        GroupId = "08d8a31f-4f21-4dc8-81a0-b119544085c0"
    },
    ["AmmoLaserLargeElectromagneticAdvancedPrecision"] = {
        Name = "Laser Precision Electromagnetic Ammo",
        FullName = "Laser Precision Electromagnetic Ammo L",
        NqId = 1664787227,
        NqRecipeId = 1386675538,
        GroupId = "08d8a31f-4f20-4203-89db-3d5d8b1a3f18"
    },
    ["AmmoLaserExtraSmallElectromagneticAdvancedPrecision"] = {
        Name = "Laser Precision Electromagnetic Ammo",
        FullName = "Laser Precision Electromagnetic Ammo XS",
        NqId = 3539993652,
        NqRecipeId = 1673462517,
        GroupId = "08d8a31f-4f1e-4b81-8978-a8b4620c3837"
    },
    ["AmmoLaserMediumThermicAdvancedPrecision"] = {
        Name = "Laser Precision Thermic Ammo",
        FullName = "Laser Precision Thermic Ammo M",
        NqId = 3708417017,
        NqRecipeId = 631922325,
        GroupId = "08d8a31f-4f22-4615-87de-ac192a16114b"
    },
    ["AmmoLaserSmallThermicAdvancedPrecision"] = {
        Name = "Laser Precision Thermic Ammo",
        FullName = "Laser Precision Thermic Ammo S",
        NqId = 3820970963,
        NqRecipeId = 161007743,
        GroupId = "08d8a31f-4f23-494e-8a09-774493bf0cf5"
    },
    ["AmmoLaserExtraSmallThermicAdvancedPrecision"] = {
        Name = "Laser Precision Thermic Ammo",
        FullName = "Laser Precision Thermic Ammo XS",
        NqId = 1765328811,
        NqRecipeId = 12095556,
        GroupId = "08d8a31f-4f1f-40e3-8d2d-ef94d08a2c39"
    },
    ["AmmoLaserLargeThermicAdvancedPrecision"] = {
        Name = "Laser Precision Thermic Ammo",
        FullName = "Laser Precision Thermic Ammo L",
        NqId = 36119774,
        NqRecipeId = 1542433809,
        GroupId = "08d8a31f-4f20-4c1b-82b7-c542dbf7edc0"
    },
    ["LaserDetector"] = {
        Name = "Laser Receiver",
        FullName = "Laser Receiver",
        NqId = 783555860,
        NqRecipeId = 674513044,
        GroupId = "08d8a31f-4fbb-4b9f-8f5a-b11af73b31d6"
    },
    ["AmmoLaserSmallThermicUncommon"] = {
        Name = "Laser Thermic Ammo",
        FullName = "Laser Thermic Ammo S",
        NqId = 1363871248,
        NqRecipeId = 1780352161,
        GroupId = "08d8a31f-4f23-494e-8a09-774493bf0cf5"
    },
    ["AmmoLaserMediumThermicUncommon"] = {
        Name = "Laser Thermic Ammo",
        FullName = "Laser Thermic Ammo M",
        NqId = 2843836124,
        NqRecipeId = 1998691277,
        GroupId = "08d8a31f-4f22-4615-87de-ac192a16114b"
    },
    ["AmmoLaserExtraSmallThermicUncommon"] = {
        Name = "Laser Thermic Ammo",
        FullName = "Laser Thermic Ammo XS",
        NqId = 4135531540,
        NqRecipeId = 94661021,
        GroupId = "08d8a31f-4f1f-40e3-8d2d-ef94d08a2c39"
    },
    ["AmmoLaserLargeThermicUncommon"] = {
        Name = "Laser Thermic Ammo",
        FullName = "Laser Thermic Ammo L",
        NqId = 1068250257,
        NqRecipeId = 756674697,
        GroupId = "08d8a31f-4f20-4c1b-82b7-c542dbf7edc0"
    },
    ["hcAlLiPanelLightGray"] = {
        Name = "Light Gray Al-Li Panel",
        FullName = "Light Gray Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelLightGray"] = {
        Name = "Light Gray Aluminium Panel",
        FullName = "Light Gray Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelLightGray"] = {
        Name = "Light Gray Calcium Panel",
        FullName = "Light Gray Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelLightGray"] = {
        Name = "Light Gray Carbon Panel",
        FullName = "Light Gray Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelLightGray"] = {
        Name = "Light Gray Chromium Panel",
        FullName = "Light Gray Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelLightGray"] = {
        Name = "Light Gray Cobalt Panel",
        FullName = "Light Gray Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelLightGray"] = {
        Name = "Light Gray Copper Panel",
        FullName = "Light Gray Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelLightGray"] = {
        Name = "Light Gray Duralumin Panel",
        FullName = "Light Gray Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelLightGray"] = {
        Name = "Light Gray Fluorine Panel",
        FullName = "Light Gray Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelLightGray"] = {
        Name = "Light Gray Gold Panel",
        FullName = "Light Gray Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelLightGray"] = {
        Name = "Light Gray Grade 5 Titanium Alloy Panel",
        FullName = "Light Gray Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelLightGray"] = {
        Name = "Light Gray Inconel Panel",
        FullName = "Light Gray Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelLightGray"] = {
        Name = "Light Gray Iron Panel",
        FullName = "Light Gray Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelLightGray"] = {
        Name = "Light Gray Lithium Panel",
        FullName = "Light Gray Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelLightGray"] = {
        Name = "Light Gray Mangalloy Panel",
        FullName = "Light Gray Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelLightGray"] = {
        Name = "Light Gray Manganese Panel",
        FullName = "Light Gray Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelLightGray"] = {
        Name = "Light Gray Maraging Steel Panel",
        FullName = "Light Gray Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelLightGray"] = {
        Name = "Light Gray Nickel Panel",
        FullName = "Light Gray Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelLightGray"] = {
        Name = "Light Gray Niobium Panel",
        FullName = "Light Gray Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelLightGray"] = {
        Name = "Light Gray Sc-Al Panel",
        FullName = "Light Gray Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelLightGray"] = {
        Name = "Light Gray Scandium Panel",
        FullName = "Light Gray Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelLightGray"] = {
        Name = "Light Gray Silicon Panel",
        FullName = "Light Gray Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelLightGray"] = {
        Name = "Light Gray Silumin Panel",
        FullName = "Light Gray Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelLightGray"] = {
        Name = "Light Gray Silver Panel",
        FullName = "Light Gray Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelLightGray"] = {
        Name = "Light Gray Sodium Panel",
        FullName = "Light Gray Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelLightGray"] = {
        Name = "Light Gray Stainless Steel Panel",
        FullName = "Light Gray Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelLightGray"] = {
        Name = "Light Gray Steel Panel",
        FullName = "Light Gray Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelLightGray"] = {
        Name = "Light Gray Sulfur Panel",
        FullName = "Light Gray Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelLightGray"] = {
        Name = "Light Gray Titanium Panel",
        FullName = "Light Gray Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelLightGray"] = {
        Name = "Light Gray Vanadium Panel",
        FullName = "Light Gray Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["CalciumOre"] = {
        Name = "Limestone",
        FullName = "Limestone",
        NqId = 3086347393,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c0-46f5-845a-43ec26f5978d"
    },
    ["LithiumScrap"] = {
        Name = "Lithium Scrap",
        FullName = "Lithium Scrap",
        NqId = 2115439708,
        NqRecipeId = 1853125212,
        GroupId = "08d8a31f-4f35-421d-8634-1cbcaaf55d86"
    },
    ["LightQuadSmall"] = {
        Name = "Long Light",
        FullName = "Long Light S",
        NqId = 3180371725,
        NqRecipeId = 180130797,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightQuadMedium"] = {
        Name = "Long Light",
        FullName = "Long Light M",
        NqId = 677591159,
        NqRecipeId = 1667599951,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightQuadXsmall"] = {
        Name = "Long Light",
        FullName = "Long Light XS",
        NqId = 25682791,
        NqRecipeId = 1575808575,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightQuadLarge"] = {
        Name = "Long Light",
        FullName = "Long Light L",
        NqId = 3524314552,
        NqRecipeId = 579899544,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["hcEmissive01"] = {
        Name = "Luminescent White Glass",
        FullName = "Luminescent White Glass",
        NqId = 1268122879,
        NqRecipeId = 147743487,
        GroupId = "08d8a31f-5086-41b0-8388-5a5244cc6060"
    },
    ["CopperOre"] = {
        Name = "Malachite",
        FullName = "Malachite",
        NqId = 2289641763,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c0-46f5-845a-43ec26f5978d"
    },
    ["MangalloyProduct"] = {
        Name = "Mangalloy product",
        FullName = "Mangalloy product",
        NqId = 3987872305,
        NqRecipeId = 1050950699,
        GroupId = "08d8a31f-50cc-4ded-8dcb-a7255197db20"
    },
    ["ManganeseReinforcedGlassProduct"] = {
        Name = "Manganese Reinforced glass product",
        FullName = "Manganese Reinforced glass product",
        NqId = 4150961531,
        NqRecipeId = 1330118140,
        GroupId = "08d8a31f-50cb-451e-8b92-1451ab8f4b38"
    },
    ["ManganeseScrap"] = {
        Name = "Manganese Scrap",
        FullName = "Manganese Scrap",
        NqId = 1182663952,
        NqRecipeId = 1515787440,
        GroupId = "08d8a31f-4f37-4592-8af0-385eb1f61fa7"
    },
    ["ManualButtonSmall"] = {
        Name = "Manual Button",
        FullName = "Manual Button XS",
        NqId = 1550904282,
        NqRecipeId = 1210245076,
        GroupId = "08d8a31f-4fbf-4955-803d-552fa54adbfa"
    },
    ["ManualButton"] = {
        Name = "Manual Button",
        FullName = "Manual Button S",
        NqId = 2896791363,
        NqRecipeId = 1870914883,
        GroupId = "08d8a31f-4fbf-4955-803d-552fa54adbfa"
    },
    ["ManualSwitch"] = {
        Name = "Manual Switch",
        FullName = "Manual Switch",
        NqId = 4181147843,
        NqRecipeId = 1623233219,
        GroupId = "08d8a31f-4fc0-486f-8ba5-a2ec2cf3e3b5"
    },
    ["MaragingSteelProduct"] = {
        Name = "Maraging Steel product",
        FullName = "Maraging Steel product",
        NqId = 3518490274,
        NqRecipeId = 820163460,
        GroupId = "08d8a31f-50cc-4ded-8dcb-a7255197db20"
    },
    ["MarbleProduct"] = {
        Name = "Marble product",
        FullName = "Marble product",
        NqId = 331532952,
        NqRecipeId = 214259480,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["hcAlLiMatte"] = {
        Name = "Matte Al-Li",
        FullName = "Matte Al-Li",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumMatte"] = {
        Name = "Matte Aluminium",
        FullName = "Matte Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["MarbleMattHCBeigeCold"] = {
        Name = "Matte beige marble (cold)",
        FullName = "Matte beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBeige"] = {
        Name = "Matte beige plastic",
        FullName = "Matte beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCBeigeCold"] = {
        Name = "Matte beige plastic (cold)",
        FullName = "Matte beige plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["BrickMattHCBlack"] = {
        Name = "Matte black brick",
        FullName = "Matte black brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick01"] = {
        Name = "Matte black brick 1",
        FullName = "Matte black brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick02"] = {
        Name = "Matte black brick 2",
        FullName = "Matte black brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick03"] = {
        Name = "Matte black brick 3",
        FullName = "Matte black brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick04"] = {
        Name = "Matte black brick 4",
        FullName = "Matte black brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberMattHCBlack"] = {
        Name = "Matte black carbon fiber",
        FullName = "Matte black carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ConcreteMattHCBlack"] = {
        Name = "Matte black concrete",
        FullName = "Matte black concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["MarbleMattHCBlack"] = {
        Name = "Matte black marble",
        FullName = "Matte black marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBlack"] = {
        Name = "Matte black plastic",
        FullName = "Matte black plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCBlack"] = {
        Name = "Matte black wood",
        FullName = "Matte black wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["PlasticMattHCBlueCold"] = {
        Name = "Matte blue (cold) plastic",
        FullName = "Matte blue (cold) plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCBlueCold"] = {
        Name = "Matte blue marble (cold)",
        FullName = "Matte blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBlue"] = {
        Name = "Matte blue plastic",
        FullName = "Matte blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCBrown01"] = {
        Name = "Matte brown wood 1",
        FullName = "Matte brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown02"] = {
        Name = "Matte brown wood 2",
        FullName = "Matte brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown03"] = {
        Name = "Matte brown wood 3",
        FullName = "Matte brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown04"] = {
        Name = "Matte brown wood 4",
        FullName = "Matte brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["hcCalciumMatte"] = {
        Name = "Matte Calcium",
        FullName = "Matte Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonMatte"] = {
        Name = "Matte Carbon",
        FullName = "Matte Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumMatte"] = {
        Name = "Matte Chromium",
        FullName = "Matte Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltMatte"] = {
        Name = "Matte Cobalt",
        FullName = "Matte Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperMatte"] = {
        Name = "Matte Copper",
        FullName = "Matte Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["MarbleMattHCBeigeColdD"] = {
        Name = "Matte dark beige marble (cold)",
        FullName = "Matte dark beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBeigeD"] = {
        Name = "Matte dark beige plastic",
        FullName = "Matte dark beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCBeigeColdD"] = {
        Name = "Matte dark beige plastic (cold)",
        FullName = "Matte dark beige plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCBlueColdD"] = {
        Name = "Matte dark blue marble (cold)",
        FullName = "Matte dark blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBlueD"] = {
        Name = "Matte dark blue plastic",
        FullName = "Matte dark blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCBlueColdD"] = {
        Name = "Matte dark blue plastic (cold)",
        FullName = "Matte dark blue plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["BrickMattHCBrick01D"] = {
        Name = "Matte dark brick 1",
        FullName = "Matte dark brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick02D"] = {
        Name = "Matte dark brick 2",
        FullName = "Matte dark brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick03D"] = {
        Name = "Matte dark brick 3",
        FullName = "Matte dark brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick04D"] = {
        Name = "Matte dark brick 4",
        FullName = "Matte dark brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["WoodMattHCBrown01D"] = {
        Name = "Matte dark brown wood 1",
        FullName = "Matte dark brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown02D"] = {
        Name = "Matte dark brown wood 2",
        FullName = "Matte dark brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown03D"] = {
        Name = "Matte dark brown wood 3",
        FullName = "Matte dark brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown04D"] = {
        Name = "Matte dark brown wood 4",
        FullName = "Matte dark brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["BrickMattHCGrayD"] = {
        Name = "Matte dark gray brick",
        FullName = "Matte dark gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberMattHCGrayD"] = {
        Name = "Matte dark gray carbon fiber",
        FullName = "Matte dark gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ConcreteMattHCGrayD"] = {
        Name = "Matte dark gray concrete",
        FullName = "Matte dark gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["MarbleMattHCGrayD"] = {
        Name = "Matte dark gray marble",
        FullName = "Matte dark gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGrayD"] = {
        Name = "Matte dark gray plastic",
        FullName = "Matte dark gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCGrayD"] = {
        Name = "Matte dark gray wood",
        FullName = "Matte dark gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleMattHCGreenColdD"] = {
        Name = "Matte dark green marble (cold)",
        FullName = "Matte dark green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGreenD"] = {
        Name = "Matte dark green plastic",
        FullName = "Matte dark green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCGreenColdD"] = {
        Name = "Matte dark green plastic (cold)",
        FullName = "Matte dark green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCOrangeColdD"] = {
        Name = "Matte dark orange marble (cold)",
        FullName = "Matte dark orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCOrangeD"] = {
        Name = "Matte dark orange plastic",
        FullName = "Matte dark orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCOrangeColdD"] = {
        Name = "Matte dark orange plastic (cold)",
        FullName = "Matte dark orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCRedColdD"] = {
        Name = "Matte dark red marble (cold)",
        FullName = "Matte dark red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCRedD"] = {
        Name = "Matte dark red plastic",
        FullName = "Matte dark red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCRedColdD"] = {
        Name = "Matte dark red plastic (cold)",
        FullName = "Matte dark red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCYellowColdD"] = {
        Name = "Matte dark yellow marble (cold)",
        FullName = "Matte dark yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCYellowD"] = {
        Name = "Matte dark yellow plastic",
        FullName = "Matte dark yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCYellowColdD"] = {
        Name = "Matte dark yellow plastic (cold)",
        FullName = "Matte dark yellow plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcDuraluminMatte"] = {
        Name = "Matte Duralumin",
        FullName = "Matte Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorineMatte"] = {
        Name = "Matte Fluorine",
        FullName = "Matte Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldMatte"] = {
        Name = "Matte Gold",
        FullName = "Matte Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyMatte"] = {
        Name = "Matte Grade 5 Titanium Alloy",
        FullName = "Matte Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["BrickMattHCGray"] = {
        Name = "Matte gray brick",
        FullName = "Matte gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberMattHCGray"] = {
        Name = "Matte gray carbon fiber",
        FullName = "Matte gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ConcreteMattHCGray"] = {
        Name = "Matte gray concrete",
        FullName = "Matte gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["MarbleMattHCGray"] = {
        Name = "Matte gray marble",
        FullName = "Matte gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGray"] = {
        Name = "Matte gray plastic",
        FullName = "Matte gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCGray"] = {
        Name = "Matte gray wood",
        FullName = "Matte gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleMattHCGreenCold"] = {
        Name = "Matte green marble (cold)",
        FullName = "Matte green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGreen"] = {
        Name = "Matte green plastic",
        FullName = "Matte green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCGreenCold"] = {
        Name = "Matte green plastic (cold)",
        FullName = "Matte green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcInconelMatte"] = {
        Name = "Matte Inconel",
        FullName = "Matte Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronMatte"] = {
        Name = "Matte Iron",
        FullName = "Matte Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleMattHCBeigeColdL"] = {
        Name = "Matte light beige marble (cold)",
        FullName = "Matte light beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBeigeL"] = {
        Name = "Matte light beige plastic",
        FullName = "Matte light beige plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCBeigeColdL"] = {
        Name = "Matte light beige plastic(cold)",
        FullName = "Matte light beige plastic(cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCBlueColdL"] = {
        Name = "Matte light blue marble (cold)",
        FullName = "Matte light blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCBlueL"] = {
        Name = "Matte light blue plastic",
        FullName = "Matte light blue plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCBlueColdL"] = {
        Name = "Matte light blue plastic (cold)",
        FullName = "Matte light blue plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["BrickMattHCBrick01L"] = {
        Name = "Matte light brick 1",
        FullName = "Matte light brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick02L"] = {
        Name = "Matte light brick 2",
        FullName = "Matte light brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick03L"] = {
        Name = "Matte light brick 3",
        FullName = "Matte light brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickMattHCBrick04L"] = {
        Name = "Matte light brick 4",
        FullName = "Matte light brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["WoodMattHCBrown01L"] = {
        Name = "Matte light brown wood 1",
        FullName = "Matte light brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown02L"] = {
        Name = "Matte light brown wood 2",
        FullName = "Matte light brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown03L"] = {
        Name = "Matte light brown wood 3",
        FullName = "Matte light brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodMattHCBrown04L"] = {
        Name = "Matte light brown wood 4",
        FullName = "Matte light brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["BrickMattHCGrayL"] = {
        Name = "Matte light gray brick",
        FullName = "Matte light gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberMattHCGrayL"] = {
        Name = "Matte light gray carbon fiber",
        FullName = "Matte light gray carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ConcreteMattHCGrayL"] = {
        Name = "Matte light gray concrete",
        FullName = "Matte light gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["MarbleMattHCGrayL"] = {
        Name = "Matte light gray marble",
        FullName = "Matte light gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGrayL"] = {
        Name = "Matte light gray plastic",
        FullName = "Matte light gray plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCGrayL"] = {
        Name = "Matte light gray wood",
        FullName = "Matte light gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleMattHCGreenColdL"] = {
        Name = "Matte light green marble (cold)",
        FullName = "Matte light green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCGreenL"] = {
        Name = "Matte light green plastic",
        FullName = "Matte light green plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCGreenColdL"] = {
        Name = "Matte light green plastic (cold)",
        FullName = "Matte light green plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCOrangeColdL"] = {
        Name = "Matte light orange marble (cold)",
        FullName = "Matte light orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCOrangeL"] = {
        Name = "Matte light orange plastic",
        FullName = "Matte light orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCOrangeColdL"] = {
        Name = "Matte light orange plastic (cold)",
        FullName = "Matte light orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCRedColdL"] = {
        Name = "Matte light red marble (cold)",
        FullName = "Matte light red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCRedL"] = {
        Name = "Matte light red plastic",
        FullName = "Matte light red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCRedColdL"] = {
        Name = "Matte light red plastic (cold)",
        FullName = "Matte light red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCYellowColdL"] = {
        Name = "Matte light yellow marble (cold)",
        FullName = "Matte light yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCYellowL"] = {
        Name = "Matte light yellow plastic",
        FullName = "Matte light yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCYellowColdL"] = {
        Name = "Matte light yellow plastic (cold)",
        FullName = "Matte light yellow plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcLithiumMatte"] = {
        Name = "Matte Lithium",
        FullName = "Matte Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyMatte"] = {
        Name = "Matte Mangalloy",
        FullName = "Matte Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganeseMatte"] = {
        Name = "Matte Manganese",
        FullName = "Matte Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelMatte"] = {
        Name = "Matte Maraging Steel",
        FullName = "Matte Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelMatte"] = {
        Name = "Matte Nickel",
        FullName = "Matte Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumMatte"] = {
        Name = "Matte Niobium",
        FullName = "Matte Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleMattHCOrangeCold"] = {
        Name = "Matte orange marble (cold)",
        FullName = "Matte orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCOrange"] = {
        Name = "Matte orange plastic",
        FullName = "Matte orange plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCOrangeCold"] = {
        Name = "Matte orange plastic (cold)",
        FullName = "Matte orange plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["MarbleMattHCRedCold"] = {
        Name = "Matte red marble (cold)",
        FullName = "Matte red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCRed"] = {
        Name = "Matte red plastic",
        FullName = "Matte red plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCRedCold"] = {
        Name = "Matte red plastic (cold)",
        FullName = "Matte red plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcScAlMatte"] = {
        Name = "Matte Sc-Al",
        FullName = "Matte Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumMatte"] = {
        Name = "Matte Scandium",
        FullName = "Matte Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconMatte"] = {
        Name = "Matte Silicon",
        FullName = "Matte Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminMatte"] = {
        Name = "Matte Silumin",
        FullName = "Matte Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverMatte"] = {
        Name = "Matte Silver",
        FullName = "Matte Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumMatte"] = {
        Name = "Matte Sodium",
        FullName = "Matte Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelMatte"] = {
        Name = "Matte Stainless Steel",
        FullName = "Matte Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelMatte"] = {
        Name = "Matte Steel",
        FullName = "Matte Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurMatte"] = {
        Name = "Matte Sulfur",
        FullName = "Matte Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumMatte"] = {
        Name = "Matte Titanium",
        FullName = "Matte Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumMatte"] = {
        Name = "Matte Vanadium",
        FullName = "Matte Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["BrickMattHCWhite"] = {
        Name = "Matte white brick",
        FullName = "Matte white brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberMattHCWhite"] = {
        Name = "Matte white carbon fiber",
        FullName = "Matte white carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ConcreteMattHCWhite"] = {
        Name = "Matte white concrete",
        FullName = "Matte white concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["MarbleMattHCWhite"] = {
        Name = "Matte white marble",
        FullName = "Matte white marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCWhite"] = {
        Name = "Matte white plastic",
        FullName = "Matte white plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["WoodMattHCWhite"] = {
        Name = "Matte white wood",
        FullName = "Matte white wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleMattHCYellowCold"] = {
        Name = "Matte yellow marble (cold)",
        FullName = "Matte yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticMattHCYellow"] = {
        Name = "Matte yellow plastic",
        FullName = "Matte yellow plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticMattHCYellowCold"] = {
        Name = "Matte yellow plastic (cold)",
        FullName = "Matte yellow plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["hcAlLiPanelMilitary"] = {
        Name = "Military Al-Li Panel",
        FullName = "Military Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelMilitary"] = {
        Name = "Military Aluminium Panel",
        FullName = "Military Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelMilitary"] = {
        Name = "Military Calcium Panel",
        FullName = "Military Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelMilitary"] = {
        Name = "Military Carbon Panel",
        FullName = "Military Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelMilitary"] = {
        Name = "Military Chromium Panel",
        FullName = "Military Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelMilitary"] = {
        Name = "Military Cobalt Panel",
        FullName = "Military Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelMilitary"] = {
        Name = "Military Copper Panel",
        FullName = "Military Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelMilitary"] = {
        Name = "Military Duralumin Panel",
        FullName = "Military Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelMilitary"] = {
        Name = "Military Fluorine Panel",
        FullName = "Military Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelMilitary"] = {
        Name = "Military Gold Panel",
        FullName = "Military Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelMilitary"] = {
        Name = "Military Grade 5 Titanium Alloy Panel",
        FullName = "Military Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelMilitary"] = {
        Name = "Military Inconel Panel",
        FullName = "Military Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelMilitary"] = {
        Name = "Military Iron Panel",
        FullName = "Military Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelMilitary"] = {
        Name = "Military Lithium Panel",
        FullName = "Military Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelMilitary"] = {
        Name = "Military Mangalloy Panel",
        FullName = "Military Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelMilitary"] = {
        Name = "Military Manganese Panel",
        FullName = "Military Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelMilitary"] = {
        Name = "Military Maraging Steel Panel",
        FullName = "Military Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelMilitary"] = {
        Name = "Military Nickel Panel",
        FullName = "Military Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelMilitary"] = {
        Name = "Military Niobium Panel",
        FullName = "Military Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelMilitary"] = {
        Name = "Military Sc-Al Panel",
        FullName = "Military Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelMilitary"] = {
        Name = "Military Scandium Panel",
        FullName = "Military Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelMilitary"] = {
        Name = "Military Silicon Panel",
        FullName = "Military Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelMilitary"] = {
        Name = "Military Silumin Panel",
        FullName = "Military Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelMilitary"] = {
        Name = "Military Silver Panel",
        FullName = "Military Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelMilitary"] = {
        Name = "Military Sodium Panel",
        FullName = "Military Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelMilitary"] = {
        Name = "Military Stainless Steel Panel",
        FullName = "Military Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelMilitary"] = {
        Name = "Military Steel Panel",
        FullName = "Military Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelMilitary"] = {
        Name = "Military Sulfur Panel",
        FullName = "Military Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelMilitary"] = {
        Name = "Military Titanium Panel",
        FullName = "Military Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelMilitary"] = {
        Name = "Military Vanadium Panel",
        FullName = "Military Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["WeaponMissileExtraSmall1"] = {
        Name = "missile",
        FullName = "missile XS",
        NqId = 1260582276,
        NqRecipeId = 1819449456,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileLarge1"] = {
        Name = "missile",
        FullName = "missile L",
        NqId = 3873532190,
        NqRecipeId = 1617316143,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileMedium1"] = {
        Name = "missile",
        FullName = "missile M",
        NqId = 1557865377,
        NqRecipeId = 17274614,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileSmall1"] = {
        Name = "missile",
        FullName = "missile S",
        NqId = 1109891544,
        NqRecipeId = 738245003,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["AmmoMissileMediumAntimatterAdvancedAgile"] = {
        Name = "Missile Agile Antimatter Ammo",
        FullName = "Missile Agile Antimatter Ammo M",
        NqId = 326385703,
        NqRecipeId = 449822856,
        GroupId = "08d8a31f-4f27-4fba-8617-689ca885f520"
    },
    ["AmmoMissileSmallAntimatterAdvancedAgile"] = {
        Name = "Missile Agile Antimatter Ammo",
        FullName = "Missile Agile Antimatter Ammo S",
        NqId = 1284945646,
        NqRecipeId = 2000972558,
        GroupId = "08d8a31f-4f29-467c-8b20-9197b8e65277"
    },
    ["AmmoMissileExtraSmallAntimatterAdvancedAgile"] = {
        Name = "Missile Agile Antimatter Ammo",
        FullName = "Missile Agile Antimatter Ammo XS",
        NqId = 2340151566,
        NqRecipeId = 11804403,
        GroupId = "08d8a31f-4f25-443b-8ac2-fedeaf0afaae"
    },
    ["AmmoMissileLargeAntimatterAdvancedAgile"] = {
        Name = "Missile Agile Antimatter Ammo",
        FullName = "Missile Agile Antimatter Ammo L",
        NqId = 3594012056,
        NqRecipeId = 1048886795,
        GroupId = "08d8a31f-4f26-4ab7-84f2-33a4aec1795e"
    },
    ["AmmoMissileLargeKineticAdvancedAgile"] = {
        Name = "Missile Agile Kinetic Ammo",
        FullName = "Missile Agile Kinetic Ammo L",
        NqId = 2529340738,
        NqRecipeId = 1416416649,
        GroupId = "08d8a31f-4f27-419d-8247-d7b99f7d6200"
    },
    ["AmmoMissileMediumKineticAdvancedAgile"] = {
        Name = "Missile Agile Kinetic Ammo",
        FullName = "Missile Agile Kinetic Ammo M",
        NqId = 1491281175,
        NqRecipeId = 1753608682,
        GroupId = "08d8a31f-4f28-46f5-81af-ffdb1a69f60a"
    },
    ["AmmoMissileSmallKineticAdvancedAgile"] = {
        Name = "Missile Agile Kinetic Ammo",
        FullName = "Missile Agile Kinetic Ammo S",
        NqId = 2679053199,
        NqRecipeId = 1928618999,
        GroupId = "08d8a31f-4f29-4e78-826f-58258c890dda"
    },
    ["AmmoMissileExtraSmallKineticAdvancedAgile"] = {
        Name = "Missile Agile Kinetic Ammo",
        FullName = "Missile Agile Kinetic Ammo XS",
        NqId = 2148925933,
        NqRecipeId = 1804645496,
        GroupId = "08d8a31f-4f25-4d03-8637-0c857d3fef1b"
    },
    ["AmmoMissileLargeAntimatterUncommon"] = {
        Name = "Missile Antimatter Ammo",
        FullName = "Missile Antimatter Ammo L",
        NqId = 995805029,
        NqRecipeId = 1042455896,
        GroupId = "08d8a31f-4f26-4ab7-84f2-33a4aec1795e"
    },
    ["AmmoMissileMediumAntimatterUncommon"] = {
        Name = "Missile Antimatter Ammo",
        FullName = "Missile Antimatter Ammo M",
        NqId = 403006216,
        NqRecipeId = 261765584,
        GroupId = "08d8a31f-4f27-4fba-8617-689ca885f520"
    },
    ["AmmoMissileExtraSmallAntimatterUncommon"] = {
        Name = "Missile Antimatter Ammo",
        FullName = "Missile Antimatter Ammo XS",
        NqId = 2845912456,
        NqRecipeId = 115577737,
        GroupId = "08d8a31f-4f25-443b-8ac2-fedeaf0afaae"
    },
    ["AmmoMissileSmallAntimatterUncommon"] = {
        Name = "Missile Antimatter Ammo",
        FullName = "Missile Antimatter Ammo S",
        NqId = 2425505244,
        NqRecipeId = 1117035964,
        GroupId = "08d8a31f-4f29-467c-8b20-9197b8e65277"
    },
    ["AmmoMissileExtraSmallAntimatterAdvancedDefense"] = {
        Name = "Missile Defense Antimatter Ammo",
        FullName = "Missile Defense Antimatter Ammo XS",
        NqId = 2059964042,
        NqRecipeId = 933455671,
        GroupId = "08d8a31f-4f25-443b-8ac2-fedeaf0afaae"
    },
    ["AmmoMissileMediumAntimatterAdvancedDefense"] = {
        Name = "Missile Defense Antimatter Ammo",
        FullName = "Missile Defense Antimatter Ammo M",
        NqId = 3987182986,
        NqRecipeId = 1835988930,
        GroupId = "08d8a31f-4f27-4fba-8617-689ca885f520"
    },
    ["AmmoMissileSmallAntimatterAdvancedDefense"] = {
        Name = "Missile Defense Antimatter Ammo",
        FullName = "Missile Defense Antimatter Ammo S",
        NqId = 116711443,
        NqRecipeId = 1439447963,
        GroupId = "08d8a31f-4f29-467c-8b20-9197b8e65277"
    },
    ["AmmoMissileLargeAntimatterAdvancedDefense"] = {
        Name = "Missile Defense Antimatter Ammo",
        FullName = "Missile Defense Antimatter Ammo L",
        NqId = 579968086,
        NqRecipeId = 1139663796,
        GroupId = "08d8a31f-4f26-4ab7-84f2-33a4aec1795e"
    },
    ["AmmoMissileMediumKineticAdvancedDefense"] = {
        Name = "Missile Defense Kinetic Ammo",
        FullName = "Missile Defense Kinetic Ammo M",
        NqId = 397326901,
        NqRecipeId = 1428998713,
        GroupId = "08d8a31f-4f28-46f5-81af-ffdb1a69f60a"
    },
    ["AmmoMissileSmallKineticAdvancedDefense"] = {
        Name = "Missile Defense Kinetic Ammo",
        FullName = "Missile Defense Kinetic Ammo S",
        NqId = 1256805327,
        NqRecipeId = 76790340,
        GroupId = "08d8a31f-4f29-4e78-826f-58258c890dda"
    },
    ["AmmoMissileExtraSmallKineticAdvancedDefense"] = {
        Name = "Missile Defense Kinetic Ammo",
        FullName = "Missile Defense Kinetic Ammo XS",
        NqId = 3939368391,
        NqRecipeId = 2024704888,
        GroupId = "08d8a31f-4f25-4d03-8637-0c857d3fef1b"
    },
    ["AmmoMissileLargeKineticAdvancedDefense"] = {
        Name = "Missile Defense Kinetic Ammo",
        FullName = "Missile Defense Kinetic Ammo L",
        NqId = 1186613579,
        NqRecipeId = 748154552,
        GroupId = "08d8a31f-4f27-419d-8247-d7b99f7d6200"
    },
    ["AmmoMissileExtraSmallAntimatterAdvancedHeavy"] = {
        Name = "Missile Heavy Antimatter Ammo",
        FullName = "Missile Heavy Antimatter Ammo XS",
        NqId = 1154972320,
        NqRecipeId = 2012436633,
        GroupId = "08d8a31f-4f25-443b-8ac2-fedeaf0afaae"
    },
    ["AmmoMissileLargeAntimatterAdvancedHeavy"] = {
        Name = "Missile Heavy Antimatter Ammo",
        FullName = "Missile Heavy Antimatter Ammo L",
        NqId = 3376140874,
        NqRecipeId = 802778139,
        GroupId = "08d8a31f-4f26-4ab7-84f2-33a4aec1795e"
    },
    ["AmmoMissileSmallAntimatterAdvancedHeavy"] = {
        Name = "Missile Heavy Antimatter Ammo",
        FullName = "Missile Heavy Antimatter Ammo S",
        NqId = 1333805710,
        NqRecipeId = 1988877142,
        GroupId = "08d8a31f-4f29-467c-8b20-9197b8e65277"
    },
    ["AmmoMissileMediumAntimatterAdvancedHeavy"] = {
        Name = "Missile Heavy Antimatter Ammo",
        FullName = "Missile Heavy Antimatter Ammo M",
        NqId = 291497016,
        NqRecipeId = 1716808796,
        GroupId = "08d8a31f-4f27-4fba-8617-689ca885f520"
    },
    ["AmmoMissileSmallKineticAdvancedHeavy"] = {
        Name = "Missile Heavy Kinetic Ammo",
        FullName = "Missile Heavy Kinetic Ammo S",
        NqId = 578039658,
        NqRecipeId = 2134711452,
        GroupId = "08d8a31f-4f29-4e78-826f-58258c890dda"
    },
    ["AmmoMissileLargeKineticAdvancedHeavy"] = {
        Name = "Missile Heavy Kinetic Ammo",
        FullName = "Missile Heavy Kinetic Ammo L",
        NqId = 3073125595,
        NqRecipeId = 1452634728,
        GroupId = "08d8a31f-4f27-419d-8247-d7b99f7d6200"
    },
    ["AmmoMissileMediumKineticAdvancedHeavy"] = {
        Name = "Missile Heavy Kinetic Ammo",
        FullName = "Missile Heavy Kinetic Ammo M",
        NqId = 1209270788,
        NqRecipeId = 322506153,
        GroupId = "08d8a31f-4f28-46f5-81af-ffdb1a69f60a"
    },
    ["AmmoMissileExtraSmallKineticAdvancedHeavy"] = {
        Name = "Missile Heavy Kinetic Ammo",
        FullName = "Missile Heavy Kinetic Ammo XS",
        NqId = 2591026571,
        NqRecipeId = 1994318953,
        GroupId = "08d8a31f-4f25-4d03-8637-0c857d3fef1b"
    },
    ["AmmoMissileSmallKineticUncommon"] = {
        Name = "Missile Kinetic Ammo",
        FullName = "Missile Kinetic Ammo S",
        NqId = 108337911,
        NqRecipeId = 1017997744,
        GroupId = "08d8a31f-4f29-4e78-826f-58258c890dda"
    },
    ["AmmoMissileLargeKineticUncommon"] = {
        Name = "Missile Kinetic Ammo",
        FullName = "Missile Kinetic Ammo L",
        NqId = 934893004,
        NqRecipeId = 1421922155,
        GroupId = "08d8a31f-4f27-419d-8247-d7b99f7d6200"
    },
    ["AmmoMissileMediumKineticUncommon"] = {
        Name = "Missile Kinetic Ammo",
        FullName = "Missile Kinetic Ammo M",
        NqId = 3718373809,
        NqRecipeId = 1971301496,
        GroupId = "08d8a31f-4f28-46f5-81af-ffdb1a69f60a"
    },
    ["AmmoMissileExtraSmallKineticUncommon"] = {
        Name = "Missile Kinetic Ammo",
        FullName = "Missile Kinetic Ammo XS",
        NqId = 2392386214,
        NqRecipeId = 13304404,
        GroupId = "08d8a31f-4f25-4d03-8637-0c857d3fef1b"
    },
    ["AmmoMissileMediumAntimatterAdvancedPrecision"] = {
        Name = "Missile Precision Antimatter Ammo",
        FullName = "Missile Precision Antimatter Ammo M",
        NqId = 144252385,
        NqRecipeId = 1295911412,
        GroupId = "08d8a31f-4f27-4fba-8617-689ca885f520"
    },
    ["AmmoMissileSmallAntimatterAdvancedPrecision"] = {
        Name = "Missile Precision Antimatter Ammo",
        FullName = "Missile Precision Antimatter Ammo S",
        NqId = 2982583326,
        NqRecipeId = 630468618,
        GroupId = "08d8a31f-4f29-467c-8b20-9197b8e65277"
    },
    ["AmmoMissileExtraSmallAntimatterAdvancedPrecision"] = {
        Name = "Missile Precision Antimatter Ammo",
        FullName = "Missile Precision Antimatter Ammo XS",
        NqId = 2239958675,
        NqRecipeId = 220271294,
        GroupId = "08d8a31f-4f25-443b-8ac2-fedeaf0afaae"
    },
    ["AmmoMissileLargeAntimatterAdvancedPrecision"] = {
        Name = "Missile Precision Antimatter Ammo",
        FullName = "Missile Precision Antimatter Ammo L",
        NqId = 3164761417,
        NqRecipeId = 560026979,
        GroupId = "08d8a31f-4f26-4ab7-84f2-33a4aec1795e"
    },
    ["AmmoMissileMediumKineticAdvancedPrecision"] = {
        Name = "Missile Precision Kinetic Ammo",
        FullName = "Missile Precision Kinetic Ammo M",
        NqId = 871384738,
        NqRecipeId = 1643415528,
        GroupId = "08d8a31f-4f28-46f5-81af-ffdb1a69f60a"
    },
    ["AmmoMissileExtraSmallKineticAdvancedPrecision"] = {
        Name = "Missile Precision Kinetic Ammo",
        FullName = "Missile Precision Kinetic Ammo XS",
        NqId = 1503181393,
        NqRecipeId = 1732781713,
        GroupId = "08d8a31f-4f25-4d03-8637-0c857d3fef1b"
    },
    ["AmmoMissileSmallKineticAdvancedPrecision"] = {
        Name = "Missile Precision Kinetic Ammo",
        FullName = "Missile Precision Kinetic Ammo S",
        NqId = 2116379443,
        NqRecipeId = 222870395,
        GroupId = "08d8a31f-4f29-4e78-826f-58258c890dda"
    },
    ["AmmoMissileLargeKineticAdvancedPrecision"] = {
        Name = "Missile Precision Kinetic Ammo",
        FullName = "Missile Precision Kinetic Ammo L",
        NqId = 897887498,
        NqRecipeId = 2018883287,
        GroupId = "08d8a31f-4f27-419d-8247-d7b99f7d6200"
    },
    ["NandOperator"] = {
        Name = "NAND Operator",
        FullName = "NAND Operator",
        NqId = 3600874516,
        NqRecipeId = 201914900,
        GroupId = "08d8a31f-4fb2-41ad-8ea9-0ab4b2b7db6f"
    },
    ["SodiumOre"] = {
        Name = "Natron",
        FullName = "Natron",
        NqId = 343766315,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c0-46f5-845a-43ec26f5978d"
    },
    ["NavigatorChair"] = {
        Name = "Navigator Chair",
        FullName = "Navigator Chair",
        NqId = 1261703398,
        NqRecipeId = 299480582,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["NickelPure"] = {
        Name = "Nickel pure",
        FullName = "Nickel pure",
        NqId = 3012303017,
        NqRecipeId = 1085756222,
        GroupId = "08d8a31f-50d3-41e5-87da-e64c4a37e842"
    },
    ["NickelScrap"] = {
        Name = "Nickel Scrap",
        FullName = "Nickel Scrap",
        NqId = 409671366,
        NqRecipeId = 1427312326,
        GroupId = "08d8a31f-4f35-421d-8634-1cbcaaf55d86"
    },
    ["NightStand"] = {
        Name = "Nightstand",
        FullName = "Nightstand",
        NqId = 2216112746,
        NqRecipeId = 2083132010,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["NiobiumPure"] = {
        Name = "Niobium pure",
        FullName = "Niobium pure",
        NqId = 1126600143,
        NqRecipeId = 1745780769,
        GroupId = "08d8a31f-50d7-4fed-8282-3dbc9d7cd0c4"
    },
    ["NiobiumScrap"] = {
        Name = "Niobium Scrap",
        FullName = "Niobium Scrap",
        NqId = 877202037,
        NqRecipeId = 2042211445,
        GroupId = "08d8a31f-4f37-4592-8af0-385eb1f61fa7"
    },
    ["Nitron"] = {
        Name = "Nitron Fuel",
        FullName = "Nitron Fuel",
        NqId = 2579672037,
        NqRecipeId = 1814211557,
        GroupId = "08d8a31f-504d-4cdb-8a45-4bd020f993ca"
    },
    ["NorOperator"] = {
        Name = "NOR Operator",
        FullName = "NOR Operator",
        NqId = 1839029088,
        NqRecipeId = 1591620448,
        GroupId = "08d8a31f-4fb2-4e88-84fc-8691a5e45a16"
    },
    ["NotOperator"] = {
        Name = "NOT operator",
        FullName = "NOT operator",
        NqId = 2629309308,
        NqRecipeId = 2050468732,
        GroupId = "08d8a31f-4fb3-4e04-8f86-5afe47edd0d7"
    },
    ["Chair"] = {
        Name = "Office Chair",
        FullName = "Office Chair",
        NqId = 554266799,
        NqRecipeId = 931754159,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["OrOperator"] = {
        Name = "OR operator",
        FullName = "OR operator",
        NqId = 1707712023,
        NqRecipeId = 1349418519,
        GroupId = "08d8a31f-4fb4-4b4e-87aa-1d74dd8396bd"
    },
    ["hcAlLiPanelOrange"] = {
        Name = "Orange Al-Li Panel",
        FullName = "Orange Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelOrange"] = {
        Name = "Orange Aluminium Panel",
        FullName = "Orange Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelOrange"] = {
        Name = "Orange Calcium Panel",
        FullName = "Orange Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelOrange"] = {
        Name = "Orange Carbon Panel",
        FullName = "Orange Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelOrange"] = {
        Name = "Orange Chromium Panel",
        FullName = "Orange Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelOrange"] = {
        Name = "Orange Cobalt Panel",
        FullName = "Orange Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelOrange"] = {
        Name = "Orange Copper Panel",
        FullName = "Orange Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelOrange"] = {
        Name = "Orange Duralumin Panel",
        FullName = "Orange Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelOrange"] = {
        Name = "Orange Fluorine Panel",
        FullName = "Orange Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelOrange"] = {
        Name = "Orange Gold Panel",
        FullName = "Orange Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelOrange"] = {
        Name = "Orange Grade 5 Titanium Alloy Panel",
        FullName = "Orange Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelOrange"] = {
        Name = "Orange Inconel Panel",
        FullName = "Orange Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelOrange"] = {
        Name = "Orange Iron Panel",
        FullName = "Orange Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelOrange"] = {
        Name = "Orange Lithium Panel",
        FullName = "Orange Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelOrange"] = {
        Name = "Orange Mangalloy Panel",
        FullName = "Orange Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelOrange"] = {
        Name = "Orange Manganese Panel",
        FullName = "Orange Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelOrange"] = {
        Name = "Orange Maraging Steel Panel",
        FullName = "Orange Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelOrange"] = {
        Name = "Orange Nickel Panel",
        FullName = "Orange Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelOrange"] = {
        Name = "Orange Niobium Panel",
        FullName = "Orange Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleTileHCOrangeCold"] = {
        Name = "Orange pattern marble (cold)",
        FullName = "Orange pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCOrange"] = {
        Name = "Orange pattern plastic",
        FullName = "Orange pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCOrangeCold"] = {
        Name = "Orange pattern plastic (cold)",
        FullName = "Orange pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCOrange"] = {
        Name = "Orange pattern steel",
        FullName = "Orange pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcScAlPanelOrange"] = {
        Name = "Orange Sc-Al Panel",
        FullName = "Orange Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelOrange"] = {
        Name = "Orange Scandium Panel",
        FullName = "Orange Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelOrange"] = {
        Name = "Orange Silicon Panel",
        FullName = "Orange Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelOrange"] = {
        Name = "Orange Silumin Panel",
        FullName = "Orange Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelOrange"] = {
        Name = "Orange Silver Panel",
        FullName = "Orange Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelOrange"] = {
        Name = "Orange Sodium Panel",
        FullName = "Orange Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelOrange"] = {
        Name = "Orange Stainless Steel Panel",
        FullName = "Orange Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelOrange"] = {
        Name = "Orange Steel Panel",
        FullName = "Orange Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelOrange"] = {
        Name = "Orange Sulfur Panel",
        FullName = "Orange Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelOrange"] = {
        Name = "Orange Titanium Panel",
        FullName = "Orange Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelOrange"] = {
        Name = "Orange Vanadium Panel",
        FullName = "Orange Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedBlack"] = {
        Name = "Painted Black Aluminium",
        FullName = "Painted Black Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedBlack"] = {
        Name = "Painted Black Calcium",
        FullName = "Painted Black Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedBlack"] = {
        Name = "Painted Black Carbon",
        FullName = "Painted Black Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedBlack"] = {
        Name = "Painted Black Chromium",
        FullName = "Painted Black Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedBlack"] = {
        Name = "Painted Black Cobalt",
        FullName = "Painted Black Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedBlack"] = {
        Name = "Painted Black Copper",
        FullName = "Painted Black Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedBlack"] = {
        Name = "Painted Black Duralumin",
        FullName = "Painted Black Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedBlack"] = {
        Name = "Painted Black Fluorine",
        FullName = "Painted Black Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedBlack"] = {
        Name = "Painted Black Gold",
        FullName = "Painted Black Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedBlack"] = {
        Name = "Painted Black Grade 5 Titanium Alloy",
        FullName = "Painted Black Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedBlack"] = {
        Name = "Painted Black Inconel",
        FullName = "Painted Black Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedBlack"] = {
        Name = "Painted Black Iron",
        FullName = "Painted Black Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedBlack"] = {
        Name = "Painted Black Lithium",
        FullName = "Painted Black Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedBlack"] = {
        Name = "Painted Black Mangalloy",
        FullName = "Painted Black Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedBlack"] = {
        Name = "Painted Black Manganese",
        FullName = "Painted Black Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedBlack"] = {
        Name = "Painted Black Maraging Steel",
        FullName = "Painted Black Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedBlack"] = {
        Name = "Painted Black Nickel",
        FullName = "Painted Black Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedBlack"] = {
        Name = "Painted Black Niobium",
        FullName = "Painted Black Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedBlack"] = {
        Name = "Painted Black Sc-Al",
        FullName = "Painted Black Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedBlack"] = {
        Name = "Painted Black Scandium",
        FullName = "Painted Black Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedBlack"] = {
        Name = "Painted Black Silicon",
        FullName = "Painted Black Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedBlack"] = {
        Name = "Painted Black Silumin",
        FullName = "Painted Black Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedBlack"] = {
        Name = "Painted Black Silver",
        FullName = "Painted Black Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedBlack"] = {
        Name = "Painted Black Sodium",
        FullName = "Painted Black Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedBlack"] = {
        Name = "Painted Black Stainless Steel",
        FullName = "Painted Black Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedBlack"] = {
        Name = "Painted Black Steel",
        FullName = "Painted Black Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedBlack"] = {
        Name = "Painted Black Sulfur",
        FullName = "Painted Black Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedBlack"] = {
        Name = "Painted Black Titanium",
        FullName = "Painted Black Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedBlack"] = {
        Name = "Painted Black Vanadium",
        FullName = "Painted Black Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Aluminium",
        FullName = "Painted Dark Gray Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Calcium",
        FullName = "Painted Dark Gray Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedDarkGray"] = {
        Name = "Painted Dark Gray Carbon",
        FullName = "Painted Dark Gray Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Chromium",
        FullName = "Painted Dark Gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedDarkGray"] = {
        Name = "Painted Dark Gray Cobalt",
        FullName = "Painted Dark Gray Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedDarkGray"] = {
        Name = "Painted Dark Gray Copper",
        FullName = "Painted Dark Gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedDarkGray"] = {
        Name = "Painted Dark Gray Duralumin",
        FullName = "Painted Dark Gray Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedDarkGray"] = {
        Name = "Painted Dark Gray Fluorine",
        FullName = "Painted Dark Gray Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedDarkGray"] = {
        Name = "Painted Dark Gray Gold",
        FullName = "Painted Dark Gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedDarkGray"] = {
        Name = "Painted Dark Gray Grade 5 Titanium Alloy",
        FullName = "Painted Dark Gray Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedDarkGray"] = {
        Name = "Painted Dark Gray Inconel",
        FullName = "Painted Dark Gray Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedDarkGray"] = {
        Name = "Painted Dark Gray Iron",
        FullName = "Painted Dark Gray Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Lithium",
        FullName = "Painted Dark Gray Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedDarkGray"] = {
        Name = "Painted Dark Gray Mangalloy",
        FullName = "Painted Dark Gray Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedDarkGray"] = {
        Name = "Painted Dark Gray Manganese",
        FullName = "Painted Dark Gray Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedDarkGray"] = {
        Name = "Painted Dark Gray Maraging Steel",
        FullName = "Painted Dark Gray Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedDarkGray"] = {
        Name = "Painted Dark Gray Nickel",
        FullName = "Painted Dark Gray Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Niobium",
        FullName = "Painted Dark Gray Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedDarkGray"] = {
        Name = "Painted Dark Gray Sc-Al",
        FullName = "Painted Dark Gray Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Scandium",
        FullName = "Painted Dark Gray Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedDarkGray"] = {
        Name = "Painted Dark Gray Silicon",
        FullName = "Painted Dark Gray Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedDarkGray"] = {
        Name = "Painted Dark Gray Silumin",
        FullName = "Painted Dark Gray Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedDarkGray"] = {
        Name = "Painted Dark Gray Silver",
        FullName = "Painted Dark Gray Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Sodium",
        FullName = "Painted Dark Gray Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedDarkGray"] = {
        Name = "Painted Dark Gray Stainless Steel",
        FullName = "Painted Dark Gray Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedDarkGray"] = {
        Name = "Painted Dark Gray Steel",
        FullName = "Painted Dark Gray Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedDarkGray"] = {
        Name = "Painted Dark Gray Sulfur",
        FullName = "Painted Dark Gray Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Titanium",
        FullName = "Painted Dark Gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedDarkGray"] = {
        Name = "Painted Dark Gray Vanadium",
        FullName = "Painted Dark Gray Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedGray"] = {
        Name = "Painted Gray Aluminium",
        FullName = "Painted Gray Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedGray"] = {
        Name = "Painted Gray Calcium",
        FullName = "Painted Gray Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedGray"] = {
        Name = "Painted Gray Carbon",
        FullName = "Painted Gray Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedGray"] = {
        Name = "Painted Gray Chromium",
        FullName = "Painted Gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedGray"] = {
        Name = "Painted Gray Cobalt",
        FullName = "Painted Gray Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedGray"] = {
        Name = "Painted Gray Copper",
        FullName = "Painted Gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedGray"] = {
        Name = "Painted Gray Duralumin",
        FullName = "Painted Gray Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedGray"] = {
        Name = "Painted Gray Fluorine",
        FullName = "Painted Gray Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedGray"] = {
        Name = "Painted Gray Gold",
        FullName = "Painted Gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedGray"] = {
        Name = "Painted Gray Grade 5 Titanium Alloy",
        FullName = "Painted Gray Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedGray"] = {
        Name = "Painted Gray Inconel",
        FullName = "Painted Gray Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedGray"] = {
        Name = "Painted Gray Iron",
        FullName = "Painted Gray Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedGray"] = {
        Name = "Painted Gray Lithium",
        FullName = "Painted Gray Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedGray"] = {
        Name = "Painted Gray Mangalloy",
        FullName = "Painted Gray Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedGray"] = {
        Name = "Painted Gray Manganese",
        FullName = "Painted Gray Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedGray"] = {
        Name = "Painted Gray Maraging Steel",
        FullName = "Painted Gray Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedGray"] = {
        Name = "Painted Gray Nickel",
        FullName = "Painted Gray Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedGray"] = {
        Name = "Painted Gray Niobium",
        FullName = "Painted Gray Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedGray"] = {
        Name = "Painted Gray Sc-Al",
        FullName = "Painted Gray Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedGray"] = {
        Name = "Painted Gray Scandium",
        FullName = "Painted Gray Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedGray"] = {
        Name = "Painted Gray Silicon",
        FullName = "Painted Gray Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedGray"] = {
        Name = "Painted Gray Silumin",
        FullName = "Painted Gray Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedGray"] = {
        Name = "Painted Gray Silver",
        FullName = "Painted Gray Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedGray"] = {
        Name = "Painted Gray Sodium",
        FullName = "Painted Gray Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedGray"] = {
        Name = "Painted Gray Stainless Steel",
        FullName = "Painted Gray Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedGray"] = {
        Name = "Painted Gray Steel",
        FullName = "Painted Gray Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedGray"] = {
        Name = "Painted Gray Sulfur",
        FullName = "Painted Gray Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedGray"] = {
        Name = "Painted Gray Titanium",
        FullName = "Painted Gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedGray"] = {
        Name = "Painted Gray Vanadium",
        FullName = "Painted Gray Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedGreen"] = {
        Name = "Painted Green Aluminium",
        FullName = "Painted Green Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedGreen"] = {
        Name = "Painted Green Calcium",
        FullName = "Painted Green Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedGreen"] = {
        Name = "Painted Green Carbon",
        FullName = "Painted Green Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedGreen"] = {
        Name = "Painted Green Chromium",
        FullName = "Painted Green Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedGreen"] = {
        Name = "Painted Green Cobalt",
        FullName = "Painted Green Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedGreen"] = {
        Name = "Painted Green Copper",
        FullName = "Painted Green Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedGreen"] = {
        Name = "Painted Green Duralumin",
        FullName = "Painted Green Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedGreen"] = {
        Name = "Painted Green Fluorine",
        FullName = "Painted Green Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedGreen"] = {
        Name = "Painted Green Gold",
        FullName = "Painted Green Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedGreen"] = {
        Name = "Painted Green Grade 5 Titanium Alloy",
        FullName = "Painted Green Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedGreen"] = {
        Name = "Painted Green Inconel",
        FullName = "Painted Green Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedGreen"] = {
        Name = "Painted Green Iron",
        FullName = "Painted Green Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedGreen"] = {
        Name = "Painted Green Lithium",
        FullName = "Painted Green Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedGreen"] = {
        Name = "Painted Green Mangalloy",
        FullName = "Painted Green Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedGreen"] = {
        Name = "Painted Green Manganese",
        FullName = "Painted Green Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedGreen"] = {
        Name = "Painted Green Maraging Steel",
        FullName = "Painted Green Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedGreen"] = {
        Name = "Painted Green Nickel",
        FullName = "Painted Green Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedGreen"] = {
        Name = "Painted Green Niobium",
        FullName = "Painted Green Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedGreen"] = {
        Name = "Painted Green Sc-Al",
        FullName = "Painted Green Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedGreen"] = {
        Name = "Painted Green Scandium",
        FullName = "Painted Green Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedGreen"] = {
        Name = "Painted Green Silicon",
        FullName = "Painted Green Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedGreen"] = {
        Name = "Painted Green Silumin",
        FullName = "Painted Green Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedGreen"] = {
        Name = "Painted Green Silver",
        FullName = "Painted Green Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedGreen"] = {
        Name = "Painted Green Sodium",
        FullName = "Painted Green Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedGreen"] = {
        Name = "Painted Green Stainless Steel",
        FullName = "Painted Green Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedGreen"] = {
        Name = "Painted Green Steel",
        FullName = "Painted Green Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedGreen"] = {
        Name = "Painted Green Sulfur",
        FullName = "Painted Green Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedGreen"] = {
        Name = "Painted Green Titanium",
        FullName = "Painted Green Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedGreen"] = {
        Name = "Painted Green Vanadium",
        FullName = "Painted Green Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedIce"] = {
        Name = "Painted Ice Aluminium",
        FullName = "Painted Ice Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedIce"] = {
        Name = "Painted Ice Calcium",
        FullName = "Painted Ice Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedIce"] = {
        Name = "Painted Ice Carbon",
        FullName = "Painted Ice Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedIce"] = {
        Name = "Painted Ice Chromium",
        FullName = "Painted Ice Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedIce"] = {
        Name = "Painted Ice Cobalt",
        FullName = "Painted Ice Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedIce"] = {
        Name = "Painted Ice Copper",
        FullName = "Painted Ice Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedIce"] = {
        Name = "Painted Ice Duralumin",
        FullName = "Painted Ice Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedIce"] = {
        Name = "Painted Ice Fluorine",
        FullName = "Painted Ice Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedIce"] = {
        Name = "Painted Ice Gold",
        FullName = "Painted Ice Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedIce"] = {
        Name = "Painted Ice Grade 5 Titanium Alloy",
        FullName = "Painted Ice Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedIce"] = {
        Name = "Painted Ice Inconel",
        FullName = "Painted Ice Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedIce"] = {
        Name = "Painted Ice Iron",
        FullName = "Painted Ice Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedIce"] = {
        Name = "Painted Ice Lithium",
        FullName = "Painted Ice Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedIce"] = {
        Name = "Painted Ice Mangalloy",
        FullName = "Painted Ice Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedIce"] = {
        Name = "Painted Ice Manganese",
        FullName = "Painted Ice Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedIce"] = {
        Name = "Painted Ice Maraging Steel",
        FullName = "Painted Ice Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedIce"] = {
        Name = "Painted Ice Nickel",
        FullName = "Painted Ice Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedIce"] = {
        Name = "Painted Ice Niobium",
        FullName = "Painted Ice Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedIce"] = {
        Name = "Painted Ice Sc-Al",
        FullName = "Painted Ice Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedIce"] = {
        Name = "Painted Ice Scandium",
        FullName = "Painted Ice Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedIce"] = {
        Name = "Painted Ice Silicon",
        FullName = "Painted Ice Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedIce"] = {
        Name = "Painted Ice Silumin",
        FullName = "Painted Ice Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedIce"] = {
        Name = "Painted Ice Silver",
        FullName = "Painted Ice Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedIce"] = {
        Name = "Painted Ice Sodium",
        FullName = "Painted Ice Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedIce"] = {
        Name = "Painted Ice Stainless Steel",
        FullName = "Painted Ice Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedIce"] = {
        Name = "Painted Ice Steel",
        FullName = "Painted Ice Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedIce"] = {
        Name = "Painted Ice Sulfur",
        FullName = "Painted Ice Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedIce"] = {
        Name = "Painted Ice Titanium",
        FullName = "Painted Ice Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedIce"] = {
        Name = "Painted Ice Vanadium",
        FullName = "Painted Ice Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedLightGray"] = {
        Name = "Painted Light Gray Aluminium",
        FullName = "Painted Light Gray Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedLightGray"] = {
        Name = "Painted Light Gray Calcium",
        FullName = "Painted Light Gray Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedLightGray"] = {
        Name = "Painted Light Gray Carbon",
        FullName = "Painted Light Gray Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedLightGray"] = {
        Name = "Painted Light Gray Chromium",
        FullName = "Painted Light Gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedLightGray"] = {
        Name = "Painted Light Gray Cobalt",
        FullName = "Painted Light Gray Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedLightGray"] = {
        Name = "Painted Light Gray Copper",
        FullName = "Painted Light Gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedLightGray"] = {
        Name = "Painted Light Gray Duralumin",
        FullName = "Painted Light Gray Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedLightGray"] = {
        Name = "Painted Light Gray Fluorine",
        FullName = "Painted Light Gray Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedLightGray"] = {
        Name = "Painted Light Gray Gold",
        FullName = "Painted Light Gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedLightGray"] = {
        Name = "Painted Light Gray Grade 5 Titanium Alloy",
        FullName = "Painted Light Gray Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedLightGray"] = {
        Name = "Painted Light Gray Inconel",
        FullName = "Painted Light Gray Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedLightGray"] = {
        Name = "Painted Light Gray Iron",
        FullName = "Painted Light Gray Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedLightGray"] = {
        Name = "Painted Light Gray Lithium",
        FullName = "Painted Light Gray Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedLightGray"] = {
        Name = "Painted Light Gray Mangalloy",
        FullName = "Painted Light Gray Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedLightGray"] = {
        Name = "Painted Light Gray Manganese",
        FullName = "Painted Light Gray Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedLightGray"] = {
        Name = "Painted Light Gray Maraging Steel",
        FullName = "Painted Light Gray Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedLightGray"] = {
        Name = "Painted Light Gray Nickel",
        FullName = "Painted Light Gray Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedLightGray"] = {
        Name = "Painted Light Gray Niobium",
        FullName = "Painted Light Gray Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedLightGray"] = {
        Name = "Painted Light Gray Sc-Al",
        FullName = "Painted Light Gray Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedLightGray"] = {
        Name = "Painted Light Gray Scandium",
        FullName = "Painted Light Gray Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedLightGray"] = {
        Name = "Painted Light Gray Silicon",
        FullName = "Painted Light Gray Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedLightGray"] = {
        Name = "Painted Light Gray Silumin",
        FullName = "Painted Light Gray Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedLightGray"] = {
        Name = "Painted Light Gray Silver",
        FullName = "Painted Light Gray Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedLightGray"] = {
        Name = "Painted Light Gray Sodium",
        FullName = "Painted Light Gray Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedLightGray"] = {
        Name = "Painted Light Gray Stainless Steel",
        FullName = "Painted Light Gray Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedLightGray"] = {
        Name = "Painted Light Gray Steel",
        FullName = "Painted Light Gray Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedLightGray"] = {
        Name = "Painted Light Gray Sulfur",
        FullName = "Painted Light Gray Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedLightGray"] = {
        Name = "Painted Light Gray Titanium",
        FullName = "Painted Light Gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedLightGray"] = {
        Name = "Painted Light Gray Vanadium",
        FullName = "Painted Light Gray Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedMilitary"] = {
        Name = "Painted Military Aluminium",
        FullName = "Painted Military Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedMilitary"] = {
        Name = "Painted Military Calcium",
        FullName = "Painted Military Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedMilitary"] = {
        Name = "Painted Military Carbon",
        FullName = "Painted Military Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedMilitary"] = {
        Name = "Painted Military Chromium",
        FullName = "Painted Military Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedMilitary"] = {
        Name = "Painted Military Cobalt",
        FullName = "Painted Military Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedMilitary"] = {
        Name = "Painted Military Copper",
        FullName = "Painted Military Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedMilitary"] = {
        Name = "Painted Military Duralumin",
        FullName = "Painted Military Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedMilitary"] = {
        Name = "Painted Military Fluorine",
        FullName = "Painted Military Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedMilitary"] = {
        Name = "Painted Military Gold",
        FullName = "Painted Military Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedMilitary"] = {
        Name = "Painted Military Grade 5 Titanium Alloy",
        FullName = "Painted Military Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedMilitary"] = {
        Name = "Painted Military Inconel",
        FullName = "Painted Military Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedMilitary"] = {
        Name = "Painted Military Iron",
        FullName = "Painted Military Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedMilitary"] = {
        Name = "Painted Military Lithium",
        FullName = "Painted Military Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedMilitary"] = {
        Name = "Painted Military Mangalloy",
        FullName = "Painted Military Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedMilitary"] = {
        Name = "Painted Military Manganese",
        FullName = "Painted Military Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedMilitary"] = {
        Name = "Painted Military Maraging Steel",
        FullName = "Painted Military Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedMilitary"] = {
        Name = "Painted Military Nickel",
        FullName = "Painted Military Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedMilitary"] = {
        Name = "Painted Military Niobium",
        FullName = "Painted Military Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedMilitary"] = {
        Name = "Painted Military Sc-Al",
        FullName = "Painted Military Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedMilitary"] = {
        Name = "Painted Military Scandium",
        FullName = "Painted Military Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedMilitary"] = {
        Name = "Painted Military Silicon",
        FullName = "Painted Military Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedMilitary"] = {
        Name = "Painted Military Silumin",
        FullName = "Painted Military Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedMilitary"] = {
        Name = "Painted Military Silver",
        FullName = "Painted Military Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedMilitary"] = {
        Name = "Painted Military Sodium",
        FullName = "Painted Military Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedMilitary"] = {
        Name = "Painted Military Stainless Steel",
        FullName = "Painted Military Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedMilitary"] = {
        Name = "Painted Military Steel",
        FullName = "Painted Military Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedMilitary"] = {
        Name = "Painted Military Sulfur",
        FullName = "Painted Military Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedMilitary"] = {
        Name = "Painted Military Titanium",
        FullName = "Painted Military Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedMilitary"] = {
        Name = "Painted Military Vanadium",
        FullName = "Painted Military Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedOrange"] = {
        Name = "Painted Orange Aluminium",
        FullName = "Painted Orange Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedOrange"] = {
        Name = "Painted Orange Calcium",
        FullName = "Painted Orange Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedOrange"] = {
        Name = "Painted Orange Carbon",
        FullName = "Painted Orange Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedOrange"] = {
        Name = "Painted Orange Chromium",
        FullName = "Painted Orange Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedOrange"] = {
        Name = "Painted Orange Cobalt",
        FullName = "Painted Orange Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedOrange"] = {
        Name = "Painted Orange Copper",
        FullName = "Painted Orange Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedOrange"] = {
        Name = "Painted Orange Duralumin",
        FullName = "Painted Orange Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedOrange"] = {
        Name = "Painted Orange Fluorine",
        FullName = "Painted Orange Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedOrange"] = {
        Name = "Painted Orange Gold",
        FullName = "Painted Orange Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedOrange"] = {
        Name = "Painted Orange Grade 5 Titanium Alloy",
        FullName = "Painted Orange Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedOrange"] = {
        Name = "Painted Orange Inconel",
        FullName = "Painted Orange Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedOrange"] = {
        Name = "Painted Orange Iron",
        FullName = "Painted Orange Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedOrange"] = {
        Name = "Painted Orange Lithium",
        FullName = "Painted Orange Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedOrange"] = {
        Name = "Painted Orange Mangalloy",
        FullName = "Painted Orange Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedOrange"] = {
        Name = "Painted Orange Manganese",
        FullName = "Painted Orange Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedOrange"] = {
        Name = "Painted Orange Maraging Steel",
        FullName = "Painted Orange Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedOrange"] = {
        Name = "Painted Orange Nickel",
        FullName = "Painted Orange Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedOrange"] = {
        Name = "Painted Orange Niobium",
        FullName = "Painted Orange Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedOrange"] = {
        Name = "Painted Orange Sc-Al",
        FullName = "Painted Orange Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedOrange"] = {
        Name = "Painted Orange Scandium",
        FullName = "Painted Orange Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedOrange"] = {
        Name = "Painted Orange Silicon",
        FullName = "Painted Orange Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedOrange"] = {
        Name = "Painted Orange Silumin",
        FullName = "Painted Orange Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedOrange"] = {
        Name = "Painted Orange Silver",
        FullName = "Painted Orange Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedOrange"] = {
        Name = "Painted Orange Sodium",
        FullName = "Painted Orange Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedOrange"] = {
        Name = "Painted Orange Stainless Steel",
        FullName = "Painted Orange Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedOrange"] = {
        Name = "Painted Orange Steel",
        FullName = "Painted Orange Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedOrange"] = {
        Name = "Painted Orange Sulfur",
        FullName = "Painted Orange Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedOrange"] = {
        Name = "Painted Orange Titanium",
        FullName = "Painted Orange Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedOrange"] = {
        Name = "Painted Orange Vanadium",
        FullName = "Painted Orange Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedPurple"] = {
        Name = "Painted Purple Aluminium",
        FullName = "Painted Purple Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedPurple"] = {
        Name = "Painted Purple Calcium",
        FullName = "Painted Purple Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedPurple"] = {
        Name = "Painted Purple Carbon",
        FullName = "Painted Purple Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedPurple"] = {
        Name = "Painted Purple Chromium",
        FullName = "Painted Purple Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedPurple"] = {
        Name = "Painted Purple Cobalt",
        FullName = "Painted Purple Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedPurple"] = {
        Name = "Painted Purple Copper",
        FullName = "Painted Purple Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedPurple"] = {
        Name = "Painted Purple Duralumin",
        FullName = "Painted Purple Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedPurple"] = {
        Name = "Painted Purple Fluorine",
        FullName = "Painted Purple Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedPurple"] = {
        Name = "Painted Purple Gold",
        FullName = "Painted Purple Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedPurple"] = {
        Name = "Painted Purple Grade 5 Titanium Alloy",
        FullName = "Painted Purple Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedPurple"] = {
        Name = "Painted Purple Inconel",
        FullName = "Painted Purple Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedPurple"] = {
        Name = "Painted Purple Iron",
        FullName = "Painted Purple Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedPurple"] = {
        Name = "Painted Purple Lithium",
        FullName = "Painted Purple Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedPurple"] = {
        Name = "Painted Purple Mangalloy",
        FullName = "Painted Purple Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedPurple"] = {
        Name = "Painted Purple Manganese",
        FullName = "Painted Purple Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedPurple"] = {
        Name = "Painted Purple Maraging Steel",
        FullName = "Painted Purple Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedPurple"] = {
        Name = "Painted Purple Nickel",
        FullName = "Painted Purple Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedPurple"] = {
        Name = "Painted Purple Niobium",
        FullName = "Painted Purple Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedPurple"] = {
        Name = "Painted Purple Sc-Al",
        FullName = "Painted Purple Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedPurple"] = {
        Name = "Painted Purple Scandium",
        FullName = "Painted Purple Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedPurple"] = {
        Name = "Painted Purple Silicon",
        FullName = "Painted Purple Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedPurple"] = {
        Name = "Painted Purple Silumin",
        FullName = "Painted Purple Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedPurple"] = {
        Name = "Painted Purple Silver",
        FullName = "Painted Purple Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedPurple"] = {
        Name = "Painted Purple Sodium",
        FullName = "Painted Purple Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedPurple"] = {
        Name = "Painted Purple Stainless Steel",
        FullName = "Painted Purple Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedPurple"] = {
        Name = "Painted Purple Steel",
        FullName = "Painted Purple Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedPurple"] = {
        Name = "Painted Purple Sulfur",
        FullName = "Painted Purple Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedPurple"] = {
        Name = "Painted Purple Titanium",
        FullName = "Painted Purple Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedPurple"] = {
        Name = "Painted Purple Vanadium",
        FullName = "Painted Purple Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedRed"] = {
        Name = "Painted Red Aluminium",
        FullName = "Painted Red Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedRed"] = {
        Name = "Painted Red Calcium",
        FullName = "Painted Red Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedRed"] = {
        Name = "Painted Red Carbon",
        FullName = "Painted Red Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedRed"] = {
        Name = "Painted Red Chromium",
        FullName = "Painted Red Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedRed"] = {
        Name = "Painted Red Cobalt",
        FullName = "Painted Red Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedRed"] = {
        Name = "Painted Red Copper",
        FullName = "Painted Red Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedRed"] = {
        Name = "Painted Red Duralumin",
        FullName = "Painted Red Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedRed"] = {
        Name = "Painted Red Fluorine",
        FullName = "Painted Red Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedRed"] = {
        Name = "Painted Red Gold",
        FullName = "Painted Red Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedRed"] = {
        Name = "Painted Red Grade 5 Titanium Alloy",
        FullName = "Painted Red Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedRed"] = {
        Name = "Painted Red Inconel",
        FullName = "Painted Red Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedRed"] = {
        Name = "Painted Red Iron",
        FullName = "Painted Red Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedRed"] = {
        Name = "Painted Red Lithium",
        FullName = "Painted Red Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedRed"] = {
        Name = "Painted Red Mangalloy",
        FullName = "Painted Red Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedRed"] = {
        Name = "Painted Red Manganese",
        FullName = "Painted Red Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedRed"] = {
        Name = "Painted Red Maraging Steel",
        FullName = "Painted Red Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedRed"] = {
        Name = "Painted Red Nickel",
        FullName = "Painted Red Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedRed"] = {
        Name = "Painted Red Niobium",
        FullName = "Painted Red Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedRed"] = {
        Name = "Painted Red Sc-Al",
        FullName = "Painted Red Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedRed"] = {
        Name = "Painted Red Scandium",
        FullName = "Painted Red Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedRed"] = {
        Name = "Painted Red Silicon",
        FullName = "Painted Red Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedRed"] = {
        Name = "Painted Red Silumin",
        FullName = "Painted Red Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedRed"] = {
        Name = "Painted Red Silver",
        FullName = "Painted Red Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedRed"] = {
        Name = "Painted Red Sodium",
        FullName = "Painted Red Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedRed"] = {
        Name = "Painted Red Stainless Steel",
        FullName = "Painted Red Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedRed"] = {
        Name = "Painted Red Steel",
        FullName = "Painted Red Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedRed"] = {
        Name = "Painted Red Sulfur",
        FullName = "Painted Red Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedRed"] = {
        Name = "Painted Red Titanium",
        FullName = "Painted Red Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedRed"] = {
        Name = "Painted Red Vanadium",
        FullName = "Painted Red Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedSky"] = {
        Name = "Painted Sky Aluminium",
        FullName = "Painted Sky Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedSky"] = {
        Name = "Painted Sky Calcium",
        FullName = "Painted Sky Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedSky"] = {
        Name = "Painted Sky Carbon",
        FullName = "Painted Sky Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedSky"] = {
        Name = "Painted Sky Chromium",
        FullName = "Painted Sky Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedSky"] = {
        Name = "Painted Sky Cobalt",
        FullName = "Painted Sky Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedSky"] = {
        Name = "Painted Sky Copper",
        FullName = "Painted Sky Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedSky"] = {
        Name = "Painted Sky Duralumin",
        FullName = "Painted Sky Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedSky"] = {
        Name = "Painted Sky Fluorine",
        FullName = "Painted Sky Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedSky"] = {
        Name = "Painted Sky Gold",
        FullName = "Painted Sky Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedSky"] = {
        Name = "Painted Sky Grade 5 Titanium Alloy",
        FullName = "Painted Sky Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedSky"] = {
        Name = "Painted Sky Inconel",
        FullName = "Painted Sky Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedSky"] = {
        Name = "Painted Sky Iron",
        FullName = "Painted Sky Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedSky"] = {
        Name = "Painted Sky Lithium",
        FullName = "Painted Sky Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedSky"] = {
        Name = "Painted Sky Mangalloy",
        FullName = "Painted Sky Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedSky"] = {
        Name = "Painted Sky Manganese",
        FullName = "Painted Sky Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedSky"] = {
        Name = "Painted Sky Maraging Steel",
        FullName = "Painted Sky Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedSky"] = {
        Name = "Painted Sky Nickel",
        FullName = "Painted Sky Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedSky"] = {
        Name = "Painted Sky Niobium",
        FullName = "Painted Sky Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedSky"] = {
        Name = "Painted Sky Sc-Al",
        FullName = "Painted Sky Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedSky"] = {
        Name = "Painted Sky Scandium",
        FullName = "Painted Sky Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedSky"] = {
        Name = "Painted Sky Silicon",
        FullName = "Painted Sky Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedSky"] = {
        Name = "Painted Sky Silumin",
        FullName = "Painted Sky Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedSky"] = {
        Name = "Painted Sky Silver",
        FullName = "Painted Sky Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedSky"] = {
        Name = "Painted Sky Sodium",
        FullName = "Painted Sky Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedSky"] = {
        Name = "Painted Sky Stainless Steel",
        FullName = "Painted Sky Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedSky"] = {
        Name = "Painted Sky Steel",
        FullName = "Painted Sky Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedSky"] = {
        Name = "Painted Sky Sulfur",
        FullName = "Painted Sky Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedSky"] = {
        Name = "Painted Sky Titanium",
        FullName = "Painted Sky Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedSky"] = {
        Name = "Painted Sky Vanadium",
        FullName = "Painted Sky Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedWhite"] = {
        Name = "Painted White Aluminium",
        FullName = "Painted White Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedWhite"] = {
        Name = "Painted White Calcium",
        FullName = "Painted White Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedWhite"] = {
        Name = "Painted White Carbon",
        FullName = "Painted White Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedWhite"] = {
        Name = "Painted White Chromium",
        FullName = "Painted White Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedWhite"] = {
        Name = "Painted White Cobalt",
        FullName = "Painted White Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedWhite"] = {
        Name = "Painted White Copper",
        FullName = "Painted White Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedWhite"] = {
        Name = "Painted White Duralumin",
        FullName = "Painted White Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedWhite"] = {
        Name = "Painted White Fluorine",
        FullName = "Painted White Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedWhite"] = {
        Name = "Painted White Gold",
        FullName = "Painted White Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedWhite"] = {
        Name = "Painted White Grade 5 Titanium Alloy",
        FullName = "Painted White Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedWhite"] = {
        Name = "Painted White Inconel",
        FullName = "Painted White Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedWhite"] = {
        Name = "Painted White Iron",
        FullName = "Painted White Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedWhite"] = {
        Name = "Painted White Lithium",
        FullName = "Painted White Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedWhite"] = {
        Name = "Painted White Mangalloy",
        FullName = "Painted White Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedWhite"] = {
        Name = "Painted White Manganese",
        FullName = "Painted White Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedWhite"] = {
        Name = "Painted White Maraging Steel",
        FullName = "Painted White Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedWhite"] = {
        Name = "Painted White Nickel",
        FullName = "Painted White Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedWhite"] = {
        Name = "Painted White Niobium",
        FullName = "Painted White Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedWhite"] = {
        Name = "Painted White Sc-Al",
        FullName = "Painted White Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedWhite"] = {
        Name = "Painted White Scandium",
        FullName = "Painted White Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedWhite"] = {
        Name = "Painted White Silicon",
        FullName = "Painted White Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedWhite"] = {
        Name = "Painted White Silumin",
        FullName = "Painted White Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedWhite"] = {
        Name = "Painted White Silver",
        FullName = "Painted White Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedWhite"] = {
        Name = "Painted White Sodium",
        FullName = "Painted White Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedWhite"] = {
        Name = "Painted White Stainless Steel",
        FullName = "Painted White Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedWhite"] = {
        Name = "Painted White Steel",
        FullName = "Painted White Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedWhite"] = {
        Name = "Painted White Sulfur",
        FullName = "Painted White Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedWhite"] = {
        Name = "Painted White Titanium",
        FullName = "Painted White Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedWhite"] = {
        Name = "Painted White Vanadium",
        FullName = "Painted White Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["hcAluminiumPaintedYellow"] = {
        Name = "Painted Yellow Aluminium",
        FullName = "Painted Yellow Aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPaintedYellow"] = {
        Name = "Painted Yellow Calcium",
        FullName = "Painted Yellow Calcium",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPaintedYellow"] = {
        Name = "Painted Yellow Carbon",
        FullName = "Painted Yellow Carbon",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPaintedYellow"] = {
        Name = "Painted Yellow Chromium",
        FullName = "Painted Yellow Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPaintedYellow"] = {
        Name = "Painted Yellow Cobalt",
        FullName = "Painted Yellow Cobalt",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPaintedYellow"] = {
        Name = "Painted Yellow Copper",
        FullName = "Painted Yellow Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPaintedYellow"] = {
        Name = "Painted Yellow Duralumin",
        FullName = "Painted Yellow Duralumin",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePaintedYellow"] = {
        Name = "Painted Yellow Fluorine",
        FullName = "Painted Yellow Fluorine",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPaintedYellow"] = {
        Name = "Painted Yellow Gold",
        FullName = "Painted Yellow Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPaintedYellow"] = {
        Name = "Painted Yellow Grade 5 Titanium Alloy",
        FullName = "Painted Yellow Grade 5 Titanium Alloy",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPaintedYellow"] = {
        Name = "Painted Yellow Inconel",
        FullName = "Painted Yellow Inconel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPaintedYellow"] = {
        Name = "Painted Yellow Iron",
        FullName = "Painted Yellow Iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPaintedYellow"] = {
        Name = "Painted Yellow Lithium",
        FullName = "Painted Yellow Lithium",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPaintedYellow"] = {
        Name = "Painted Yellow Mangalloy",
        FullName = "Painted Yellow Mangalloy",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePaintedYellow"] = {
        Name = "Painted Yellow Manganese",
        FullName = "Painted Yellow Manganese",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPaintedYellow"] = {
        Name = "Painted Yellow Maraging Steel",
        FullName = "Painted Yellow Maraging Steel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPaintedYellow"] = {
        Name = "Painted Yellow Nickel",
        FullName = "Painted Yellow Nickel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPaintedYellow"] = {
        Name = "Painted Yellow Niobium",
        FullName = "Painted Yellow Niobium",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPaintedYellow"] = {
        Name = "Painted Yellow Sc-Al",
        FullName = "Painted Yellow Sc-Al",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPaintedYellow"] = {
        Name = "Painted Yellow Scandium",
        FullName = "Painted Yellow Scandium",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPaintedYellow"] = {
        Name = "Painted Yellow Silicon",
        FullName = "Painted Yellow Silicon",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPaintedYellow"] = {
        Name = "Painted Yellow Silumin",
        FullName = "Painted Yellow Silumin",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPaintedYellow"] = {
        Name = "Painted Yellow Silver",
        FullName = "Painted Yellow Silver",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPaintedYellow"] = {
        Name = "Painted Yellow Sodium",
        FullName = "Painted Yellow Sodium",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPaintedYellow"] = {
        Name = "Painted Yellow Stainless Steel",
        FullName = "Painted Yellow Stainless Steel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPaintedYellow"] = {
        Name = "Painted Yellow Steel",
        FullName = "Painted Yellow Steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPaintedYellow"] = {
        Name = "Painted Yellow Sulfur",
        FullName = "Painted Yellow Sulfur",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPaintedYellow"] = {
        Name = "Painted Yellow Titanium",
        FullName = "Painted Yellow Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPaintedYellow"] = {
        Name = "Painted Yellow Vanadium",
        FullName = "Painted Yellow Vanadium",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["LithiumOre"] = {
        Name = "Petalite",
        FullName = "Petalite",
        NqId = 3837858336,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50bd-45c4-8ea5-3601d1f3d821"
    },
    ["PipeLine01Medium"] = {
        Name = "Pipe A",
        FullName = "Pipe A M",
        NqId = 2824951359,
        NqRecipeId = 962328553,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["PipeLine02Medium"] = {
        Name = "Pipe B",
        FullName = "Pipe B M",
        NqId = 2709793409,
        NqRecipeId = 609436007,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["PipeLine03Medium"] = {
        Name = "Pipe C",
        FullName = "Pipe C M",
        NqId = 2937058341,
        NqRecipeId = 1108168575,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["PipeCrossMedium"] = {
        Name = "Pipe Connector",
        FullName = "Pipe Connector M",
        NqId = 2917319456,
        NqRecipeId = 1216560264,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["PipeCornerMedium"] = {
        Name = "Pipe corner",
        FullName = "Pipe corner M",
        NqId = 2123842216,
        NqRecipeId = 129310710,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["PipeLine04Medium"] = {
        Name = "Pipe D",
        FullName = "Pipe D M",
        NqId = 543225023,
        NqRecipeId = 557341017,
        GroupId = "08d8a31f-4fa2-4195-866e-98f6e1c04b4a"
    },
    ["BigHologramPlanet1"] = {
        Name = "Planet Hologram",
        FullName = "Planet Hologram L",
        NqId = 1541106442,
        NqRecipeId = 787286807,
        GroupId = "08d8a31f-4fa3-4b28-8eb6-dae6c7194db1"
    },
    ["ProjectorHologramPlanet1"] = {
        Name = "Planet Hologram",
        FullName = "Planet Hologram",
        NqId = 4090740447,
        NqRecipeId = 906987364,
        GroupId = "08d8a31f-4fa3-4b28-8eb6-dae6c7194db1"
    },
    ["Plant"] = {
        Name = "Plant",
        FullName = "Plant",
        NqId = 1797415729,
        NqRecipeId = 2007130929,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["BacDeco01"] = {
        Name = "Plant Case",
        FullName = "Plant Case S",
        NqId = 3106061133,
        NqRecipeId = 1734687565,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["BacDeco02"] = {
        Name = "Plant Case",
        FullName = "Plant Case M",
        NqId = 3106061130,
        NqRecipeId = 1734687562,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["PlantDeco01"] = {
        Name = "Plant Case A",
        FullName = "Plant Case A",
        NqId = 195870295,
        NqRecipeId = 1419761239,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["PlantDeco02"] = {
        Name = "Plant Case B",
        FullName = "Plant Case B",
        NqId = 195870294,
        NqRecipeId = 1419761238,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["PlantDeco03"] = {
        Name = "Plant Case C",
        FullName = "Plant Case C",
        NqId = 195870297,
        NqRecipeId = 1419761241,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["PlantDeco04"] = {
        Name = "Plant Case D",
        FullName = "Plant Case D",
        NqId = 195870296,
        NqRecipeId = 1419761240,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["PlantDeco05"] = {
        Name = "Plant Case E",
        FullName = "Plant Case E",
        NqId = 195870299,
        NqRecipeId = 1419761243,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["MarbleBrightHCBeigeCold"] = {
        Name = "Polished beige marble (cold)",
        FullName = "Polished beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBeige"] = {
        Name = "Polished beige steel",
        FullName = "Polished beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumBrightHCBlack"] = {
        Name = "Polished black aluminium",
        FullName = "Polished black aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumBrightHCBlack"] = {
        Name = "Polished black Chromium",
        FullName = "Polished black Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperBrightHCBlack"] = {
        Name = "Polished black Copper",
        FullName = "Polished black Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldBrightHCBlack"] = {
        Name = "Polished black Gold",
        FullName = "Polished black Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronBrightHCBlack"] = {
        Name = "Polished black iron",
        FullName = "Polished black iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleBrightHCBlack"] = {
        Name = "Polished black marble",
        FullName = "Polished black marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBlack"] = {
        Name = "Polished black steel",
        FullName = "Polished black steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumBrightHCBlack"] = {
        Name = "Polished black Titanium",
        FullName = "Polished black Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodBrightHCBlack"] = {
        Name = "Polished black wood",
        FullName = "Polished black wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCBlueCold"] = {
        Name = "Polished blue marble (cold)",
        FullName = "Polished blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBlue"] = {
        Name = "Polished blue steel",
        FullName = "Polished blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["WoodBrightHCBrown01"] = {
        Name = "Polished brown wood 1",
        FullName = "Polished brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown02"] = {
        Name = "Polished brown wood 2",
        FullName = "Polished brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown03"] = {
        Name = "Polished brown wood 3",
        FullName = "Polished brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown04"] = {
        Name = "Polished brown wood 4",
        FullName = "Polished brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCBeigeColdD"] = {
        Name = "Polished dark beige marble (cold)",
        FullName = "Polished dark beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBeigeD"] = {
        Name = "Polished dark beige steel",
        FullName = "Polished dark beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCBlueColdD"] = {
        Name = "Polished dark blue marble (cold)",
        FullName = "Polished dark blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBlueD"] = {
        Name = "Polished dark blue steel",
        FullName = "Polished dark blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["WoodBrightHCBrown01D"] = {
        Name = "Polished dark brown wood 1",
        FullName = "Polished dark brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown02D"] = {
        Name = "Polished dark brown wood 2",
        FullName = "Polished dark brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown03D"] = {
        Name = "Polished dark brown wood 3",
        FullName = "Polished dark brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown04D"] = {
        Name = "Polished dark brown wood 4",
        FullName = "Polished dark brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["AluminiumBrightHCGrayD"] = {
        Name = "Polished dark gray aluminium",
        FullName = "Polished dark gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumBrightHCGrayD"] = {
        Name = "Polished dark gray Chromium",
        FullName = "Polished dark gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperBrightHCGrayD"] = {
        Name = "Polished dark gray Copper",
        FullName = "Polished dark gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldBrightHCGrayD"] = {
        Name = "Polished dark gray Gold",
        FullName = "Polished dark gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronBrightHCGrayD"] = {
        Name = "Polished dark gray iron",
        FullName = "Polished dark gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleBrightHCGrayD"] = {
        Name = "Polished dark gray marble",
        FullName = "Polished dark gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGrayD"] = {
        Name = "Polished dark gray steel",
        FullName = "Polished dark gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumBrightHCGrayD"] = {
        Name = "Polished dark gray Titanium",
        FullName = "Polished dark gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodBrightHCGrayD"] = {
        Name = "Polished dark gray wood",
        FullName = "Polished dark gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCGreenColdD"] = {
        Name = "Polished dark green marble (cold)",
        FullName = "Polished dark green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGreenD"] = {
        Name = "Polished dark green steel",
        FullName = "Polished dark green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCOrangeColdD"] = {
        Name = "Polished dark orange marble (cold)",
        FullName = "Polished dark orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCOrangeD"] = {
        Name = "Polished dark orange steel",
        FullName = "Polished dark orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCRedColdD"] = {
        Name = "Polished dark red marble (cold)",
        FullName = "Polished dark red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCRedD"] = {
        Name = "Polished dark red steel",
        FullName = "Polished dark red steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCYellowColdD"] = {
        Name = "Polished dark yellow marble (cold)",
        FullName = "Polished dark yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCYellowD"] = {
        Name = "Polished dark yellow steel",
        FullName = "Polished dark yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumBrightHCGray"] = {
        Name = "Polished gray aluminium",
        FullName = "Polished gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumBrightHCGray"] = {
        Name = "Polished gray Chromium",
        FullName = "Polished gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperBrightHCGray"] = {
        Name = "Polished gray Copper",
        FullName = "Polished gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldBrightHCGray"] = {
        Name = "Polished gray Gold",
        FullName = "Polished gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronBrightHCGray"] = {
        Name = "Polished gray iron",
        FullName = "Polished gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleBrightHCGray"] = {
        Name = "Polished gray marble",
        FullName = "Polished gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGray"] = {
        Name = "Polished gray steel",
        FullName = "Polished gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumBrightHCGray"] = {
        Name = "Polished gray Titanium",
        FullName = "Polished gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodBrightHCGray"] = {
        Name = "Polished gray wood",
        FullName = "Polished gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCGreenCold"] = {
        Name = "Polished green marble (cold)",
        FullName = "Polished green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGreen"] = {
        Name = "Polished green steel",
        FullName = "Polished green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCBeigeColdL"] = {
        Name = "Polished light beige marble (cold)",
        FullName = "Polished light beige marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBeigeL"] = {
        Name = "Polished light beige steel",
        FullName = "Polished light beige steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCBlueColdL"] = {
        Name = "Polished light blue marble (cold)",
        FullName = "Polished light blue marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCBlueL"] = {
        Name = "Polished light blue steel",
        FullName = "Polished light blue steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["WoodBrightHCBrown01L"] = {
        Name = "Polished light brown wood 1",
        FullName = "Polished light brown wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown02L"] = {
        Name = "Polished light brown wood 2",
        FullName = "Polished light brown wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown03L"] = {
        Name = "Polished light brown wood 3",
        FullName = "Polished light brown wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodBrightHCBrown04L"] = {
        Name = "Polished light brown wood 4",
        FullName = "Polished light brown wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["AluminiumBrightHCGrayL"] = {
        Name = "Polished light gray aluminium",
        FullName = "Polished light gray aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumBrightHCGrayL"] = {
        Name = "Polished light gray Chromium",
        FullName = "Polished light gray Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperBrightHCGrayL"] = {
        Name = "Polished light gray Copper",
        FullName = "Polished light gray Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldBrightHCGrayL"] = {
        Name = "Polished light gray Gold",
        FullName = "Polished light gray Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronBrightHCGrayL"] = {
        Name = "Polished light gray iron",
        FullName = "Polished light gray iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleBrightHCGrayL"] = {
        Name = "Polished light gray marble",
        FullName = "Polished light gray marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGrayL"] = {
        Name = "Polished light gray steel",
        FullName = "Polished light gray steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumBrightHCGrayL"] = {
        Name = "Polished light gray Titanium",
        FullName = "Polished light gray Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodBrightHCGrayL"] = {
        Name = "Polished light gray wood",
        FullName = "Polished light gray wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCGreenColdL"] = {
        Name = "Polished light green marble (cold)",
        FullName = "Polished light green marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCGreenL"] = {
        Name = "Polished light green steel",
        FullName = "Polished light green steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCOrangeColdL"] = {
        Name = "Polished light orange marble (cold)",
        FullName = "Polished light orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCOrangeL"] = {
        Name = "Polished light orange steel",
        FullName = "Polished light orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCRedColdL"] = {
        Name = "Polished light red marble (cold)",
        FullName = "Polished light red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCRedL"] = {
        Name = "Polished light red steel steel",
        FullName = "Polished light red steel steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCYellowColdL"] = {
        Name = "Polished light yellow marble (cold)",
        FullName = "Polished light yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCYellowL"] = {
        Name = "Polished light yellow steel",
        FullName = "Polished light yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCOrangeCold"] = {
        Name = "Polished orange marble (cold)",
        FullName = "Polished orange marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCOrange"] = {
        Name = "Polished orange steel",
        FullName = "Polished orange steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleBrightHCRedCold"] = {
        Name = "Polished red marble (cold)",
        FullName = "Polished red marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCRed"] = {
        Name = "Polished red steel",
        FullName = "Polished red steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["AluminiumBrightHCWhite"] = {
        Name = "Polished white aluminium",
        FullName = "Polished white aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["ChromiumBrightHCWhite"] = {
        Name = "Polished white Chromium",
        FullName = "Polished white Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["CopperBrightHCWhite"] = {
        Name = "Polished white Copper",
        FullName = "Polished white Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldBrightHCWhite"] = {
        Name = "Polished white Gold",
        FullName = "Polished white Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronBrightHCWhite"] = {
        Name = "Polished white iron",
        FullName = "Polished white iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleBrightHCWhite"] = {
        Name = "Polished white marble",
        FullName = "Polished white marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCWhite"] = {
        Name = "Polished white steel",
        FullName = "Polished white steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumBrightHCWhite"] = {
        Name = "Polished white Titanium",
        FullName = "Polished white Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodBrightHCWhite"] = {
        Name = "Polished white wood",
        FullName = "Polished white wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleBrightHCYellowCold"] = {
        Name = "Polished yellow marble (cold)",
        FullName = "Polished yellow marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["SteelBrightHCYellow"] = {
        Name = "Polished yellow steel",
        FullName = "Polished yellow steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["PolycalcitePlasticProduct"] = {
        Name = "Polycalcite plastic product",
        FullName = "Polycalcite plastic product",
        NqId = 4103265826,
        NqRecipeId = 1756458312,
        GroupId = "08d8a31f-50cf-4f4a-8753-1a02f4b4c1fb"
    },
    ["PolycarbonatePlasticProduct"] = {
        Name = "Polycarbonate plastic product",
        FullName = "Polycarbonate plastic product",
        NqId = 2014531313,
        NqRecipeId = 1645885251,
        GroupId = "08d8a31f-50cf-4f4a-8753-1a02f4b4c1fb"
    },
    ["PolysulfidePlasticProduct"] = {
        Name = "Polysulfide plastic product",
        FullName = "Polysulfide plastic product",
        NqId = 2097691217,
        NqRecipeId = 9524849,
        GroupId = "08d8a31f-50cf-4f4a-8753-1a02f4b4c1fb"
    },
    ["PressureTile"] = {
        Name = "Pressure tile",
        FullName = "Pressure tile",
        NqId = 2012928469,
        NqRecipeId = 2146605013,
        GroupId = "08d8a31f-4fc1-47a1-88de-4b5802649c41"
    },
    ["ProgrammingBoard"] = {
        Name = "Programming board",
        FullName = "Programming board",
        NqId = 3415128439,
        NqRecipeId = 1549896461,
        GroupId = "08d8a31f-4f3c-4f9c-84bb-4c1ecc4dd78e"
    },
    ["AluminiumPure"] = {
        Name = "Pure aluminium",
        FullName = "Pure aluminium",
        NqId = 2240749601,
        NqRecipeId = 1199082577,
        GroupId = "08d8a31f-50d4-4a1e-85dd-a72ac7f50b5d"
    },
    ["CalciumPure"] = {
        Name = "Pure Calcium",
        FullName = "Pure Calcium",
        NqId = 2112763718,
        NqRecipeId = 1358793857,
        GroupId = "08d8a31f-50db-4276-8b03-9ab547976621"
    },
    ["CarbonPure"] = {
        Name = "Pure carbon",
        FullName = "Pure carbon",
        NqId = 159858782,
        NqRecipeId = 1262929839,
        GroupId = "08d8a31f-50d4-4a1e-85dd-a72ac7f50b5d"
    },
    ["ChromiumPure"] = {
        Name = "Pure Chromium",
        FullName = "Pure Chromium",
        NqId = 2147954574,
        NqRecipeId = 67742786,
        GroupId = "08d8a31f-50db-4276-8b03-9ab547976621"
    },
    ["CobaltPure"] = {
        Name = "Pure Cobalt",
        FullName = "Pure Cobalt",
        NqId = 2031444137,
        NqRecipeId = 107837465,
        GroupId = "08d8a31f-50d9-49df-811c-51fe3018ee4c"
    },
    ["CopperPure"] = {
        Name = "Pure Copper",
        FullName = "Pure Copper",
        NqId = 1466453887,
        NqRecipeId = 1447143715,
        GroupId = "08d8a31f-50db-4276-8b03-9ab547976621"
    },
    ["FluorinePure"] = {
        Name = "Pure Fluorine",
        FullName = "Pure Fluorine",
        NqId = 3323724376,
        NqRecipeId = 120974149,
        GroupId = "08d8a31f-50d9-49df-811c-51fe3018ee4c"
    },
    ["GoldPure"] = {
        Name = "Pure Gold",
        FullName = "Pure Gold",
        NqId = 3837955371,
        NqRecipeId = 1508723351,
        GroupId = "08d8a31f-50d9-49df-811c-51fe3018ee4c"
    },
    ["HydrogenPure"] = {
        Name = "Pure hydrogen",
        FullName = "Pure hydrogen",
        NqId = 1010524904,
        NqRecipeId = 722030824,
        GroupId = "08d8a31f-50d1-4834-88a0-93b212775142"
    },
    ["IronPure"] = {
        Name = "Pure Iron",
        FullName = "Pure Iron",
        NqId = 198782496,
        NqRecipeId = 1833008839,
        GroupId = "08d8a31f-50d4-4a1e-85dd-a72ac7f50b5d"
    },
    ["LithiumPure"] = {
        Name = "Pure lithium",
        FullName = "Pure lithium",
        NqId = 3810111622,
        NqRecipeId = 214807072,
        GroupId = "08d8a31f-50d3-41e5-87da-e64c4a37e842"
    },
    ["ManganesePure"] = {
        Name = "Pure manganese",
        FullName = "Pure manganese",
        NqId = 2421303625,
        NqRecipeId = 1152725195,
        GroupId = "08d8a31f-50d7-4fed-8282-3dbc9d7cd0c4"
    },
    ["OxygenPure"] = {
        Name = "Pure Oxygen",
        FullName = "Pure Oxygen",
        NqId = 947806142,
        NqRecipeId = 608747454,
        GroupId = "08d8a31f-50d1-4834-88a0-93b212775142"
    },
    ["ScandiumPure"] = {
        Name = "Pure Scandium",
        FullName = "Pure Scandium",
        NqId = 3211418846,
        NqRecipeId = 1990855723,
        GroupId = "08d8a31f-50d9-49df-811c-51fe3018ee4c"
    },
    ["SiliconPure"] = {
        Name = "Pure Silicon",
        FullName = "Pure Silicon",
        NqId = 2589986891,
        NqRecipeId = 1678829760,
        GroupId = "08d8a31f-50d4-4a1e-85dd-a72ac7f50b5d"
    },
    ["SodiumPure"] = {
        Name = "Pure Sodium",
        FullName = "Pure Sodium",
        NqId = 3603734543,
        NqRecipeId = 1843262763,
        GroupId = "08d8a31f-50db-4276-8b03-9ab547976621"
    },
    ["SulfurPure"] = {
        Name = "Pure Sulfur",
        FullName = "Pure Sulfur",
        NqId = 3822811562,
        NqRecipeId = 547899423,
        GroupId = "08d8a31f-50d3-41e5-87da-e64c4a37e842"
    },
    ["TitaniumPure"] = {
        Name = "Pure Titanium",
        FullName = "Pure Titanium",
        NqId = 752542080,
        NqRecipeId = 706438082,
        GroupId = "08d8a31f-50d7-4fed-8282-3dbc9d7cd0c4"
    },
    ["hcAlLiPanelPurple"] = {
        Name = "Purple Al-Li Panel",
        FullName = "Purple Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelPurple"] = {
        Name = "Purple Aluminium Panel",
        FullName = "Purple Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelPurple"] = {
        Name = "Purple Calcium Panel",
        FullName = "Purple Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelPurple"] = {
        Name = "Purple Carbon Panel",
        FullName = "Purple Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelPurple"] = {
        Name = "Purple Chromium Panel",
        FullName = "Purple Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelPurple"] = {
        Name = "Purple Cobalt Panel",
        FullName = "Purple Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelPurple"] = {
        Name = "Purple Copper Panel",
        FullName = "Purple Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelPurple"] = {
        Name = "Purple Duralumin Panel",
        FullName = "Purple Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelPurple"] = {
        Name = "Purple Fluorine Panel",
        FullName = "Purple Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelPurple"] = {
        Name = "Purple Gold Panel",
        FullName = "Purple Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelPurple"] = {
        Name = "Purple Grade 5 Titanium Alloy Panel",
        FullName = "Purple Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelPurple"] = {
        Name = "Purple Inconel Panel",
        FullName = "Purple Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelPurple"] = {
        Name = "Purple Iron Panel",
        FullName = "Purple Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelPurple"] = {
        Name = "Purple Lithium Panel",
        FullName = "Purple Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelPurple"] = {
        Name = "Purple Mangalloy Panel",
        FullName = "Purple Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelPurple"] = {
        Name = "Purple Manganese Panel",
        FullName = "Purple Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelPurple"] = {
        Name = "Purple Maraging Steel Panel",
        FullName = "Purple Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelPurple"] = {
        Name = "Purple Nickel Panel",
        FullName = "Purple Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelPurple"] = {
        Name = "Purple Niobium Panel",
        FullName = "Purple Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelPurple"] = {
        Name = "Purple Sc-Al Panel",
        FullName = "Purple Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelPurple"] = {
        Name = "Purple Scandium Panel",
        FullName = "Purple Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelPurple"] = {
        Name = "Purple Silicon Panel",
        FullName = "Purple Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelPurple"] = {
        Name = "Purple Silumin Panel",
        FullName = "Purple Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelPurple"] = {
        Name = "Purple Silver Panel",
        FullName = "Purple Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelPurple"] = {
        Name = "Purple Sodium Panel",
        FullName = "Purple Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelPurple"] = {
        Name = "Purple Stainless Steel Panel",
        FullName = "Purple Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelPurple"] = {
        Name = "Purple Steel Panel",
        FullName = "Purple Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelPurple"] = {
        Name = "Purple Sulfur Panel",
        FullName = "Purple Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelPurple"] = {
        Name = "Purple Titanium Panel",
        FullName = "Purple Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelPurple"] = {
        Name = "Purple Vanadium Panel",
        FullName = "Purple Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["SulfurOre"] = {
        Name = "Pyrite",
        FullName = "Pyrite",
        NqId = 4041459743,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50bd-45c4-8ea5-3601d1f3d821"
    },
    ["SiliconOre"] = {
        Name = "Quartz",
        FullName = "Quartz",
        NqId = 3724036288,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50be-4dfa-8466-916146e77841"
    },
    ["WeaponRailgunExtraSmall1"] = {
        Name = "railgun",
        FullName = "railgun XS",
        NqId = 31327772,
        NqRecipeId = 1398816217,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunMedium1"] = {
        Name = "railgun",
        FullName = "railgun M",
        NqId = 2733257194,
        NqRecipeId = 415329629,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunSmall1"] = {
        Name = "railgun",
        FullName = "railgun S",
        NqId = 853107412,
        NqRecipeId = 1501354509,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunLarge1"] = {
        Name = "railgun",
        FullName = "railgun L",
        NqId = 430145504,
        NqRecipeId = 2139320644,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["AmmoRailgunExtraSmallAntimatterAdvancedAgile"] = {
        Name = "Railgun Agile Antimatter Ammo",
        FullName = "Railgun Agile Antimatter Ammo XS",
        NqId = 2562077926,
        NqRecipeId = 1207815215,
        GroupId = "08d8a31f-4f2b-4616-8984-d3c12fcffa4f"
    },
    ["AmmoRailgunLargeAntimatterAdvancedAgile"] = {
        Name = "Railgun Agile Antimatter Ammo",
        FullName = "Railgun Agile Antimatter Ammo L",
        NqId = 994404082,
        NqRecipeId = 1416463457,
        GroupId = "08d8a31f-4f2c-4e82-8d47-4cf785323b71"
    },
    ["AmmoRailgunMediumAntimatterAdvancedAgile"] = {
        Name = "Railgun Agile Antimatter Ammo",
        FullName = "Railgun Agile Antimatter Ammo M",
        NqId = 2753235550,
        NqRecipeId = 805300435,
        GroupId = "08d8a31f-4f2e-480a-8d27-a0d3a0ca5960"
    },
    ["AmmoRailgunSmallAntimatterAdvancedAgile"] = {
        Name = "Railgun Agile Antimatter Ammo",
        FullName = "Railgun Agile Antimatter Ammo S",
        NqId = 2765153031,
        NqRecipeId = 390104775,
        GroupId = "08d8a31f-4f30-4276-82c9-92a652ed6184"
    },
    ["AmmoRailgunMediumElectromagneticAdvancedAgile"] = {
        Name = "Railgun Agile Electromagnetic Ammo",
        FullName = "Railgun Agile Electromagnetic Ammo M",
        NqId = 2401068335,
        NqRecipeId = 692121952,
        GroupId = "08d8a31f-4f2f-40da-8e9b-bbbfeda8b3c9"
    },
    ["AmmoRailgunSmallElectromagneticAdvancedAgile"] = {
        Name = "Railgun Agile Electromagnetic Ammo",
        FullName = "Railgun Agile Electromagnetic Ammo S",
        NqId = 1818470694,
        NqRecipeId = 1974417328,
        GroupId = "08d8a31f-4f30-4b7f-8bec-9c89e3bd5fba"
    },
    ["AmmoRailgunLargeElectromagneticAdvancedAgile"] = {
        Name = "Railgun Agile Electromagnetic Ammo",
        FullName = "Railgun Agile Electromagnetic Ammo L",
        NqId = 493646316,
        NqRecipeId = 765718961,
        GroupId = "08d8a31f-4f2d-46f2-862a-2d4d5e16aaae"
    },
    ["AmmoRailgunExtraSmallElectromagneticAdvancedAgile"] = {
        Name = "Railgun Agile Electromagnetic Ammo",
        FullName = "Railgun Agile Electromagnetic Ammo XS",
        NqId = 4121476880,
        NqRecipeId = 124082864,
        GroupId = "08d8a31f-4f2b-4e09-89c7-5cb964e28d87"
    },
    ["AmmoRailgunSmallAntimatterUncommon"] = {
        Name = "Railgun Antimatter Ammo",
        FullName = "Railgun Antimatter Ammo S",
        NqId = 2665059784,
        NqRecipeId = 953777388,
        GroupId = "08d8a31f-4f30-4276-82c9-92a652ed6184"
    },
    ["AmmoRailgunLargeAntimatterUncommon"] = {
        Name = "Railgun Antimatter Ammo",
        FullName = "Railgun Antimatter Ammo L",
        NqId = 4091052814,
        NqRecipeId = 1616775479,
        GroupId = "08d8a31f-4f2c-4e82-8d47-4cf785323b71"
    },
    ["AmmoRailgunExtraSmallAntimatterUncommon"] = {
        Name = "Railgun Antimatter Ammo",
        FullName = "Railgun Antimatter Ammo XS",
        NqId = 3669030673,
        NqRecipeId = 696192432,
        GroupId = "08d8a31f-4f2b-4616-8984-d3c12fcffa4f"
    },
    ["AmmoRailgunMediumAntimatterUncommon"] = {
        Name = "Railgun Antimatter Ammo",
        FullName = "Railgun Antimatter Ammo M",
        NqId = 3025930763,
        NqRecipeId = 1031266357,
        GroupId = "08d8a31f-4f2e-480a-8d27-a0d3a0ca5960"
    },
    ["AmmoRailgunSmallAntimatterAdvancedDefense"] = {
        Name = "Railgun Defense Antimatter Ammo",
        FullName = "Railgun Defense Antimatter Ammo S",
        NqId = 2454971316,
        NqRecipeId = 628328295,
        GroupId = "08d8a31f-4f30-4276-82c9-92a652ed6184"
    },
    ["AmmoRailgunExtraSmallAntimatterAdvancedDefense"] = {
        Name = "Railgun Defense Antimatter Ammo",
        FullName = "Railgun Defense Antimatter Ammo XS",
        NqId = 1685710165,
        NqRecipeId = 1214058286,
        GroupId = "08d8a31f-4f2b-4616-8984-d3c12fcffa4f"
    },
    ["AmmoRailgunLargeAntimatterAdvancedDefense"] = {
        Name = "Railgun Defense Antimatter Ammo",
        FullName = "Railgun Defense Antimatter Ammo L",
        NqId = 1377917611,
        NqRecipeId = 283215299,
        GroupId = "08d8a31f-4f2c-4e82-8d47-4cf785323b71"
    },
    ["AmmoRailgunMediumAntimatterAdvancedDefense"] = {
        Name = "Railgun Defense Antimatter Ammo",
        FullName = "Railgun Defense Antimatter Ammo M",
        NqId = 2519489329,
        NqRecipeId = 971624957,
        GroupId = "08d8a31f-4f2e-480a-8d27-a0d3a0ca5960"
    },
    ["AmmoRailgunExtraSmallElectromagneticAdvancedDefense"] = {
        Name = "Railgun Defense Electromagnetic Ammo",
        FullName = "Railgun Defense Electromagnetic Ammo XS",
        NqId = 1190298485,
        NqRecipeId = 1073529155,
        GroupId = "08d8a31f-4f2b-4e09-89c7-5cb964e28d87"
    },
    ["AmmoRailgunMediumElectromagneticAdvancedDefense"] = {
        Name = "Railgun Defense Electromagnetic Ammo",
        FullName = "Railgun Defense Electromagnetic Ammo M",
        NqId = 2547387530,
        NqRecipeId = 308581350,
        GroupId = "08d8a31f-4f2f-40da-8e9b-bbbfeda8b3c9"
    },
    ["AmmoRailgunLargeElectromagneticAdvancedDefense"] = {
        Name = "Railgun Defense Electromagnetic Ammo",
        FullName = "Railgun Defense Electromagnetic Ammo L",
        NqId = 2997406270,
        NqRecipeId = 687887700,
        GroupId = "08d8a31f-4f2d-46f2-862a-2d4d5e16aaae"
    },
    ["AmmoRailgunSmallElectromagneticAdvancedDefense"] = {
        Name = "Railgun Defense Electromagnetic Ammo",
        FullName = "Railgun Defense Electromagnetic Ammo S",
        NqId = 2890607046,
        NqRecipeId = 933424296,
        GroupId = "08d8a31f-4f30-4b7f-8bec-9c89e3bd5fba"
    },
    ["AmmoRailgunExtraSmallElectromagneticUncommon"] = {
        Name = "Railgun Electromagnetic Ammo",
        FullName = "Railgun Electromagnetic Ammo XS",
        NqId = 2513950249,
        NqRecipeId = 1859000398,
        GroupId = "08d8a31f-4f2b-4e09-89c7-5cb964e28d87"
    },
    ["AmmoRailgunSmallElectromagneticUncommon"] = {
        Name = "Railgun Electromagnetic Ammo",
        FullName = "Railgun Electromagnetic Ammo S",
        NqId = 2277755297,
        NqRecipeId = 1901393692,
        GroupId = "08d8a31f-4f30-4b7f-8bec-9c89e3bd5fba"
    },
    ["AmmoRailgunMediumElectromagneticUncommon"] = {
        Name = "Railgun Electromagnetic Ammo",
        FullName = "Railgun Electromagnetic Ammo M",
        NqId = 1314738719,
        NqRecipeId = 768447999,
        GroupId = "08d8a31f-4f2f-40da-8e9b-bbbfeda8b3c9"
    },
    ["AmmoRailgunLargeElectromagneticUncommon"] = {
        Name = "Railgun Electromagnetic Ammo",
        FullName = "Railgun Electromagnetic Ammo L",
        NqId = 19332250,
        NqRecipeId = 443784314,
        GroupId = "08d8a31f-4f2d-46f2-862a-2d4d5e16aaae"
    },
    ["AmmoRailgunSmallAntimatterAdvancedHeavy"] = {
        Name = "Railgun Heavy Antimatter Ammo",
        FullName = "Railgun Heavy Antimatter Ammo S",
        NqId = 2944291964,
        NqRecipeId = 474684218,
        GroupId = "08d8a31f-4f30-4276-82c9-92a652ed6184"
    },
    ["AmmoRailgunExtraSmallAntimatterAdvancedHeavy"] = {
        Name = "Railgun Heavy Antimatter Ammo",
        FullName = "Railgun Heavy Antimatter Ammo XS",
        NqId = 2975180925,
        NqRecipeId = 961816262,
        GroupId = "08d8a31f-4f2b-4616-8984-d3c12fcffa4f"
    },
    ["AmmoRailgunMediumAntimatterAdvancedHeavy"] = {
        Name = "Railgun Heavy Antimatter Ammo",
        FullName = "Railgun Heavy Antimatter Ammo M",
        NqId = 1129867076,
        NqRecipeId = 1828913366,
        GroupId = "08d8a31f-4f2e-480a-8d27-a0d3a0ca5960"
    },
    ["AmmoRailgunLargeAntimatterAdvancedHeavy"] = {
        Name = "Railgun Heavy Antimatter Ammo",
        FullName = "Railgun Heavy Antimatter Ammo L",
        NqId = 1555786609,
        NqRecipeId = 1299870796,
        GroupId = "08d8a31f-4f2c-4e82-8d47-4cf785323b71"
    },
    ["AmmoRailgunSmallElectromagneticAdvancedHeavy"] = {
        Name = "Railgun Heavy Electromagnetic Ammo",
        FullName = "Railgun Heavy Electromagnetic Ammo S",
        NqId = 3384068103,
        NqRecipeId = 2025430297,
        GroupId = "08d8a31f-4f30-4b7f-8bec-9c89e3bd5fba"
    },
    ["AmmoRailgunMediumElectromagneticAdvancedHeavy"] = {
        Name = "Railgun Heavy Electromagnetic Ammo",
        FullName = "Railgun Heavy Electromagnetic Ammo M",
        NqId = 711588165,
        NqRecipeId = 882781406,
        GroupId = "08d8a31f-4f2f-40da-8e9b-bbbfeda8b3c9"
    },
    ["AmmoRailgunExtraSmallElectromagneticAdvancedHeavy"] = {
        Name = "Railgun Heavy Electromagnetic Ammo",
        FullName = "Railgun Heavy Electromagnetic Ammo XS",
        NqId = 671997275,
        NqRecipeId = 1822099315,
        GroupId = "08d8a31f-4f2b-4e09-89c7-5cb964e28d87"
    },
    ["AmmoRailgunLargeElectromagneticAdvancedHeavy"] = {
        Name = "Railgun Heavy Electromagnetic Ammo",
        FullName = "Railgun Heavy Electromagnetic Ammo L",
        NqId = 985599166,
        NqRecipeId = 1974600386,
        GroupId = "08d8a31f-4f2d-46f2-862a-2d4d5e16aaae"
    },
    ["AmmoRailgunSmallAntimatterAdvancedPrecision"] = {
        Name = "Railgun Precision Antimatter Ammo",
        FullName = "Railgun Precision Antimatter Ammo S",
        NqId = 2423442023,
        NqRecipeId = 2071130173,
        GroupId = "08d8a31f-4f30-4276-82c9-92a652ed6184"
    },
    ["AmmoRailgunMediumAntimatterAdvancedPrecision"] = {
        Name = "Railgun Precision Antimatter Ammo",
        FullName = "Railgun Precision Antimatter Ammo M",
        NqId = 1378313789,
        NqRecipeId = 201269838,
        GroupId = "08d8a31f-4f2e-480a-8d27-a0d3a0ca5960"
    },
    ["AmmoRailgunExtraSmallAntimatterAdvancedPrecision"] = {
        Name = "Railgun Precision Antimatter Ammo",
        FullName = "Railgun Precision Antimatter Ammo XS",
        NqId = 2897347844,
        NqRecipeId = 2049113383,
        GroupId = "08d8a31f-4f2b-4616-8984-d3c12fcffa4f"
    },
    ["AmmoRailgunLargeAntimatterAdvancedPrecision"] = {
        Name = "Railgun Precision Antimatter Ammo",
        FullName = "Railgun Precision Antimatter Ammo L",
        NqId = 2009039852,
        NqRecipeId = 1592672759,
        GroupId = "08d8a31f-4f2c-4e82-8d47-4cf785323b71"
    },
    ["AmmoRailgunSmallElectromagneticAdvancedPrecision"] = {
        Name = "Railgun Precision Electromagnetic Ammo",
        FullName = "Railgun Precision Electromagnetic Ammo S",
        NqId = 3511898141,
        NqRecipeId = 1239451954,
        GroupId = "08d8a31f-4f30-4b7f-8bec-9c89e3bd5fba"
    },
    ["AmmoRailgunExtraSmallElectromagneticAdvancedPrecision"] = {
        Name = "Railgun Precision Electromagnetic Ammo",
        FullName = "Railgun Precision Electromagnetic Ammo XS",
        NqId = 2661753045,
        NqRecipeId = 116786123,
        GroupId = "08d8a31f-4f2b-4e09-89c7-5cb964e28d87"
    },
    ["AmmoRailgunLargeElectromagneticAdvancedPrecision"] = {
        Name = "Railgun Precision Electromagnetic Ammo",
        FullName = "Railgun Precision Electromagnetic Ammo L",
        NqId = 3711223735,
        NqRecipeId = 1010664916,
        GroupId = "08d8a31f-4f2d-46f2-862a-2d4d5e16aaae"
    },
    ["AmmoRailgunMediumElectromagneticAdvancedPrecision"] = {
        Name = "Railgun Precision Electromagnetic Ammo",
        FullName = "Railgun Precision Electromagnetic Ammo M",
        NqId = 3778585474,
        NqRecipeId = 1479196152,
        GroupId = "08d8a31f-4f2f-40da-8e9b-bbbfeda8b3c9"
    },
    ["Industry3DPrinter4"] = {
        Name = "Rare 3D Printer",
        FullName = "Rare 3D Printer M",
        NqId = 2793358076,
        NqRecipeId = 39016075,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["WeaponCannonLargeAgile4"] = {
        Name = "Rare Agile Cannon",
        FullName = "Rare Agile Cannon L",
        NqId = 3152865673,
        NqRecipeId = 249217448,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonSmallAgile4"] = {
        Name = "Rare Agile Cannon",
        FullName = "Rare Agile Cannon S",
        NqId = 429894437,
        NqRecipeId = 1955213857,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonMediumAgile4"] = {
        Name = "Rare Agile Cannon",
        FullName = "Rare Agile Cannon M",
        NqId = 2672575279,
        NqRecipeId = 120523254,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonExtraSmallAgile4"] = {
        Name = "Rare Agile Cannon",
        FullName = "Rare Agile Cannon XS",
        NqId = 684853151,
        NqRecipeId = 911593696,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponLaserExtraSmallAgile4"] = {
        Name = "Rare Agile Laser",
        FullName = "Rare Agile Laser XS",
        NqId = 3972697533,
        NqRecipeId = 1747903960,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserMediumAgile4"] = {
        Name = "Rare Agile Laser",
        FullName = "Rare Agile Laser M",
        NqId = 360504287,
        NqRecipeId = 338688398,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserLargeAgile4"] = {
        Name = "Rare Agile Laser",
        FullName = "Rare Agile Laser L",
        NqId = 679378437,
        NqRecipeId = 1355106983,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserSmallAgile4"] = {
        Name = "Rare Agile Laser",
        FullName = "Rare Agile Laser S",
        NqId = 4124398192,
        NqRecipeId = 1845822062,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileExtraSmallAgile4"] = {
        Name = "Rare Agile Missile",
        FullName = "Rare Agile Missile XS",
        NqId = 1780076561,
        NqRecipeId = 1077969998,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileMediumAgile4"] = {
        Name = "Rare Agile Missile",
        FullName = "Rare Agile Missile M",
        NqId = 598736196,
        NqRecipeId = 677437739,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileLargeAgile4"] = {
        Name = "Rare Agile Missile",
        FullName = "Rare Agile Missile L",
        NqId = 3650288369,
        NqRecipeId = 1424237785,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileSmallAgile4"] = {
        Name = "Rare Agile Missile",
        FullName = "Rare Agile Missile S",
        NqId = 1843877006,
        NqRecipeId = 697649837,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunExtraSmallAgile4"] = {
        Name = "Rare Agile Railgun",
        FullName = "Rare Agile Railgun XS",
        NqId = 549955100,
        NqRecipeId = 2090934872,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunMediumAgile4"] = {
        Name = "Rare Agile Railgun",
        FullName = "Rare Agile Railgun M",
        NqId = 3057550300,
        NqRecipeId = 490609641,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunLargeAgile4"] = {
        Name = "Rare Agile Railgun",
        FullName = "Rare Agile Railgun L",
        NqId = 4062760163,
        NqRecipeId = 1290704547,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunSmallAgile4"] = {
        Name = "Rare Agile Railgun",
        FullName = "Rare Agile Railgun S",
        NqId = 1767704174,
        NqRecipeId = 114495125,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["antenna_4_s"] = {
        Name = "Rare Antenna",
        FullName = "Rare Antenna S",
        NqId = 1080827741,
        NqRecipeId = 1305806647,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_4_m"] = {
        Name = "Rare Antenna",
        FullName = "Rare Antenna M",
        NqId = 1080827739,
        NqRecipeId = 1305806605,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_4_l"] = {
        Name = "Rare Antenna",
        FullName = "Rare Antenna L",
        NqId = 1080827716,
        NqRecipeId = 1305806604,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antigravitycore_4"] = {
        Name = "Rare Anti-Gravity Core",
        FullName = "Rare Anti-Gravity Core",
        NqId = 2999509693,
        NqRecipeId = 82629944,
        GroupId = "08d8a31f-511d-4b6e-8d59-bd04dbbbe00c"
    },
    ["IndustryAssemblyXS4"] = {
        Name = "Rare Assembly Line",
        FullName = "Rare Assembly Line XS",
        NqId = 2480928544,
        NqRecipeId = 2127592344,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["IndustryAssemblyL4"] = {
        Name = "Rare Assembly Line",
        FullName = "Rare Assembly Line L",
        NqId = 1762226674,
        NqRecipeId = 1275490952,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["IndustryAssemblyS4"] = {
        Name = "Rare Assembly Line",
        FullName = "Rare Assembly Line S",
        NqId = 1762226233,
        NqRecipeId = 1275490627,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["IndustryAssemblyXL4"] = {
        Name = "Rare Assembly Line",
        FullName = "Rare Assembly Line XL",
        NqId = 2480866766,
        NqRecipeId = 2127592953,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["IndustryAssemblyM4"] = {
        Name = "Rare Assembly Line",
        FullName = "Rare Assembly Line M",
        NqId = 1762227889,
        NqRecipeId = 1275491016,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["burner_4"] = {
        Name = "Rare Burner",
        FullName = "Rare Burner",
        NqId = 2660328735,
        NqRecipeId = 1272865109,
        GroupId = "08d8a31f-50f7-42af-8cbd-a4edf5ff865c"
    },
    ["casing_4_xs"] = {
        Name = "Rare Casing",
        FullName = "Rare Casing XS",
        NqId = 946524256,
        NqRecipeId = 68471221,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["chemicalcontainer_4_m"] = {
        Name = "Rare Chemical Container",
        FullName = "Rare Chemical Container M",
        NqId = 625115242,
        NqRecipeId = 1815664198,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["IndustryChemical4"] = {
        Name = "Rare Chemical Industry",
        FullName = "Rare Chemical Industry M",
        NqId = 648743081,
        NqRecipeId = 1303072724,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["combustionchamber_4_l"] = {
        Name = "Rare Combustion Chamber",
        FullName = "Rare Combustion Chamber L",
        NqId = 2662310021,
        NqRecipeId = 1027976554,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_4_s"] = {
        Name = "Rare Combustion Chamber",
        FullName = "Rare Combustion Chamber S",
        NqId = 2662310018,
        NqRecipeId = 1027976549,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_4_xs"] = {
        Name = "Rare Combustion Chamber",
        FullName = "Rare Combustion Chamber XS",
        NqId = 4016318475,
        NqRecipeId = 1135710301,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_4_m"] = {
        Name = "Rare Combustion Chamber",
        FullName = "Rare Combustion Chamber M",
        NqId = 2662310020,
        NqRecipeId = 1027976555,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["coresystem_4_l"] = {
        Name = "Rare Core System",
        FullName = "Rare Core System L",
        NqId = 1775106492,
        NqRecipeId = 962145500,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["WeaponCannonLargeDefense4"] = {
        Name = "Rare Defense Cannon",
        FullName = "Rare Defense Cannon L",
        NqId = 418164307,
        NqRecipeId = 2075676707,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonSmallDefense4"] = {
        Name = "Rare Defense Cannon",
        FullName = "Rare Defense Cannon S",
        NqId = 1073121334,
        NqRecipeId = 542848387,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonExtraSmallDefense4"] = {
        Name = "Rare Defense Cannon",
        FullName = "Rare Defense Cannon XS",
        NqId = 3467785552,
        NqRecipeId = 1096591347,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonMediumDefense4"] = {
        Name = "Rare Defense Cannon",
        FullName = "Rare Defense Cannon M",
        NqId = 2383624965,
        NqRecipeId = 84872826,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponLaserLargeDefense4"] = {
        Name = "Rare Defense Laser",
        FullName = "Rare Defense Laser L",
        NqId = 3991674479,
        NqRecipeId = 1303569296,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserExtraSmallDefense4"] = {
        Name = "Rare Defense Laser",
        FullName = "Rare Defense Laser XS",
        NqId = 796456746,
        NqRecipeId = 1394719565,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserMediumDefense4"] = {
        Name = "Rare Defense Laser",
        FullName = "Rare Defense Laser M",
        NqId = 3805044394,
        NqRecipeId = 2049928204,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallDefense4"] = {
        Name = "Rare Defense Laser",
        FullName = "Rare Defense Laser S",
        NqId = 1737118474,
        NqRecipeId = 480977830,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileExtraSmallDefense4"] = {
        Name = "Rare Defense Missile",
        FullName = "Rare Defense Missile XS",
        NqId = 134390788,
        NqRecipeId = 100930654,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileMediumDefense4"] = {
        Name = "Rare Defense Missile",
        FullName = "Rare Defense Missile M",
        NqId = 1068910671,
        NqRecipeId = 1585468818,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponMissileLargeDefense4"] = {
        Name = "Rare Defense Missile",
        FullName = "Rare Defense Missile L",
        NqId = 3453451051,
        NqRecipeId = 1090131852,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileSmallDefense4"] = {
        Name = "Rare Defense Missile",
        FullName = "Rare Defense Missile S",
        NqId = 136359051,
        NqRecipeId = 2121766256,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponRailgunMediumDefense4"] = {
        Name = "Rare Defense Railgun",
        FullName = "Rare Defense Railgun M",
        NqId = 3396072236,
        NqRecipeId = 661205342,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallDefense4"] = {
        Name = "Rare Defense Railgun",
        FullName = "Rare Defense Railgun XS",
        NqId = 2108818540,
        NqRecipeId = 1911355875,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunSmallDefense4"] = {
        Name = "Rare Defense Railgun",
        FullName = "Rare Defense Railgun S",
        NqId = 223437800,
        NqRecipeId = 1492798495,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["WeaponRailgunLargeDefense4"] = {
        Name = "Rare Defense Railgun",
        FullName = "Rare Defense Railgun L",
        NqId = 3670363952,
        NqRecipeId = 564701342,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["electronics_4"] = {
        Name = "Rare Electronics",
        FullName = "Rare Electronics",
        NqId = 1297540451,
        NqRecipeId = 1026118819,
        GroupId = "08d8a31f-50f8-4d6f-835c-9f32f00e2ee9"
    },
    ["IndustryElectronics4"] = {
        Name = "Rare Electronics Industry",
        FullName = "Rare Electronics Industry M",
        NqId = 2861848556,
        NqRecipeId = 1151494168,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["firingsystem_4_xs"] = {
        Name = "Rare Firing System",
        FullName = "Rare Firing System XS",
        NqId = 3740074253,
        NqRecipeId = 987286529,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_4_s"] = {
        Name = "Rare Firing System",
        FullName = "Rare Firing System S",
        NqId = 3242492817,
        NqRecipeId = 567375755,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_4_m"] = {
        Name = "Rare Firing System",
        FullName = "Rare Firing System M",
        NqId = 3242492811,
        NqRecipeId = 567375765,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["firingsystem_4_l"] = {
        Name = "Rare Firing System",
        FullName = "Rare Firing System L",
        NqId = 3242492810,
        NqRecipeId = 567375762,
        GroupId = "08d8a31f-512c-4ff9-8327-f05ff7700553"
    },
    ["AtmosphericEngineSmallFreight4"] = {
        Name = "Rare Freight Atmospheric Engine",
        FullName = "Rare Freight Atmospheric Engine S",
        NqId = 1152783535,
        NqRecipeId = 1433916477,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineXtraSmallFreight4"] = {
        Name = "Rare Freight Atmospheric Engine",
        FullName = "Rare Freight Atmospheric Engine XS",
        NqId = 2711764150,
        NqRecipeId = 835881249,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineLargeFreight4"] = {
        Name = "Rare Freight Atmospheric Engine",
        FullName = "Rare Freight Atmospheric Engine L",
        NqId = 1638517112,
        NqRecipeId = 1724503005,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineMediumFreight4"] = {
        Name = "Rare Freight Atmospheric Engine",
        FullName = "Rare Freight Atmospheric Engine M",
        NqId = 488092471,
        NqRecipeId = 850251754,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["SpaceEngineMediumFreight4"] = {
        Name = "Rare Freight Space Engine",
        FullName = "Rare Freight Space Engine M",
        NqId = 516669711,
        NqRecipeId = 404185423,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineSmallFreight4"] = {
        Name = "Rare Freight Space Engine",
        FullName = "Rare Freight Space Engine S",
        NqId = 270403387,
        NqRecipeId = 1533482931,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraSmallFreight4"] = {
        Name = "Rare Freight Space Engine",
        FullName = "Rare Freight Space Engine XS",
        NqId = 3719125852,
        NqRecipeId = 1874982268,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineXtraLargeFreight4"] = {
        Name = "Rare Freight Space Engine",
        FullName = "Rare Freight Space Engine XL",
        NqId = 2497069959,
        NqRecipeId = 645158705,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineLargeFreight4"] = {
        Name = "Rare Freight Space Engine",
        FullName = "Rare Freight Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["IndustryGlass4"] = {
        Name = "Rare Glass Furnace",
        FullName = "Rare Glass Furnace M",
        NqId = 2200747730,
        NqRecipeId = 1081167026,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["WeaponCannonLargeHeavy4"] = {
        Name = "Rare Heavy Cannon",
        FullName = "Rare Heavy Cannon L",
        NqId = 3960316608,
        NqRecipeId = 748835217,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponCannonExtraSmallHeavy4"] = {
        Name = "Rare Heavy Cannon",
        FullName = "Rare Heavy Cannon XS",
        NqId = 3384934780,
        NqRecipeId = 1378758800,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonMediumHeavy4"] = {
        Name = "Rare Heavy Cannon",
        FullName = "Rare Heavy Cannon M",
        NqId = 2188788021,
        NqRecipeId = 645100380,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonSmallHeavy4"] = {
        Name = "Rare Heavy Cannon",
        FullName = "Rare Heavy Cannon S",
        NqId = 2058706004,
        NqRecipeId = 2116333303,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponLaserExtraSmallHeavy4"] = {
        Name = "Rare Heavy Laser",
        FullName = "Rare Heavy Laser XS",
        NqId = 3698237862,
        NqRecipeId = 522166215,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserLargeHeavy4"] = {
        Name = "Rare Heavy Laser",
        FullName = "Rare Heavy Laser L",
        NqId = 4270062441,
        NqRecipeId = 945836171,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserMediumHeavy4"] = {
        Name = "Rare Heavy Laser",
        FullName = "Rare Heavy Laser M",
        NqId = 3588765877,
        NqRecipeId = 1135448896,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallHeavy4"] = {
        Name = "Rare Heavy Laser",
        FullName = "Rare Heavy Laser S",
        NqId = 338218840,
        NqRecipeId = 928844449,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileLargeHeavy4"] = {
        Name = "Rare Heavy Missile",
        FullName = "Rare Heavy Missile L",
        NqId = 708864066,
        NqRecipeId = 1883135602,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileExtraSmallHeavy4"] = {
        Name = "Rare Heavy Missile",
        FullName = "Rare Heavy Missile XS",
        NqId = 3611570508,
        NqRecipeId = 922568177,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileSmallHeavy4"] = {
        Name = "Rare Heavy Missile",
        FullName = "Rare Heavy Missile S",
        NqId = 1100091708,
        NqRecipeId = 673694708,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponMissileMediumHeavy4"] = {
        Name = "Rare Heavy Missile",
        FullName = "Rare Heavy Missile M",
        NqId = 1102564707,
        NqRecipeId = 800973883,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponRailgunExtraSmallHeavy4"] = {
        Name = "Rare Heavy Railgun",
        FullName = "Rare Heavy Railgun XS",
        NqId = 1816732408,
        NqRecipeId = 989109287,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunLargeHeavy4"] = {
        Name = "Rare Heavy Railgun",
        FullName = "Rare Heavy Railgun L",
        NqId = 30018128,
        NqRecipeId = 642878052,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunMediumHeavy4"] = {
        Name = "Rare Heavy Railgun",
        FullName = "Rare Heavy Railgun M",
        NqId = 1641776331,
        NqRecipeId = 990274944,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunSmallHeavy4"] = {
        Name = "Rare Heavy Railgun",
        FullName = "Rare Heavy Railgun S",
        NqId = 2991505104,
        NqRecipeId = 1706288000,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["IndustryHoneycomber4"] = {
        Name = "Rare Honeycomb Refinery",
        FullName = "Rare Honeycomb Refinery M",
        NqId = 3026799989,
        NqRecipeId = 1993163111,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["hydraulics_4"] = {
        Name = "Rare hydraulics",
        FullName = "Rare hydraulics",
        NqId = 1331181088,
        NqRecipeId = 30134925,
        GroupId = "08d8a31f-50fa-4803-8ecf-b8ad089f721b"
    },
    ["injector_4"] = {
        Name = "Rare Injector",
        FullName = "Rare Injector",
        NqId = 1971447079,
        NqRecipeId = 1293038243,
        GroupId = "08d8a31f-50fd-4c12-8954-19ee8310de60"
    },
    ["ionicchamber_4_m"] = {
        Name = "Rare Ionic Chamber",
        FullName = "Rare Ionic Chamber M",
        NqId = 1390563195,
        NqRecipeId = 763781033,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_4_l"] = {
        Name = "Rare Ionic Chamber",
        FullName = "Rare Ionic Chamber L",
        NqId = 1390563172,
        NqRecipeId = 763781032,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_4_s"] = {
        Name = "Rare Ionic Chamber",
        FullName = "Rare Ionic Chamber S",
        NqId = 1390563197,
        NqRecipeId = 763781043,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_4_xl"] = {
        Name = "Rare Ionic Chamber",
        FullName = "Rare Ionic Chamber XL",
        NqId = 962700657,
        NqRecipeId = 649551528,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_4_xs"] = {
        Name = "Rare Ionic Chamber",
        FullName = "Rare Ionic Chamber XS",
        NqId = 962700664,
        NqRecipeId = 649551527,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["laserchamber_4_xs"] = {
        Name = "Rare Laser Chamber",
        FullName = "Rare Laser Chamber XS",
        NqId = 1252819658,
        NqRecipeId = 2773951,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_4_l"] = {
        Name = "Rare Laser Chamber",
        FullName = "Rare Laser Chamber L",
        NqId = 2825506203,
        NqRecipeId = 1825436309,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_4_s"] = {
        Name = "Rare Laser Chamber",
        FullName = "Rare Laser Chamber S",
        NqId = 2825506178,
        NqRecipeId = 1825436306,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["laserchamber_4_m"] = {
        Name = "Rare Laser Chamber",
        FullName = "Rare Laser Chamber M",
        NqId = 2825506200,
        NqRecipeId = 1825436308,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["magnet_4"] = {
        Name = "Rare Magnet",
        FullName = "Rare Magnet",
        NqId = 1246524877,
        NqRecipeId = 1949200611,
        GroupId = "08d8a31f-50ff-45dd-8793-4e9e09a6afd6"
    },
    ["magneticrail_4_s"] = {
        Name = "Rare Magnetic Rail",
        FullName = "Rare Magnetic Rail S",
        NqId = 2722609523,
        NqRecipeId = 547063021,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_4_m"] = {
        Name = "Rare Magnetic Rail",
        FullName = "Rare Magnetic Rail M",
        NqId = 2722609533,
        NqRecipeId = 547063019,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_4_l"] = {
        Name = "Rare Magnetic Rail",
        FullName = "Rare Magnetic Rail L",
        NqId = 2722609530,
        NqRecipeId = 547062804,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["magneticrail_4_xs"] = {
        Name = "Rare Magnetic Rail",
        FullName = "Rare Magnetic Rail XS",
        NqId = 4210065279,
        NqRecipeId = 1839470468,
        GroupId = "08d8a31f-5139-4b47-847d-8c4623403644"
    },
    ["AtmosphericEngineLargeManeuver4"] = {
        Name = "Rare Maneuver Atmospheric Engine",
        FullName = "Rare Maneuver Atmospheric Engine L",
        NqId = 1397818123,
        NqRecipeId = 1035733960,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineMediumManeuver4"] = {
        Name = "Rare Maneuver Atmospheric Engine",
        FullName = "Rare Maneuver Atmospheric Engine M",
        NqId = 3377917824,
        NqRecipeId = 471177834,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineXtraSmallManeuver4"] = {
        Name = "Rare Maneuver Atmospheric Engine",
        FullName = "Rare Maneuver Atmospheric Engine XS",
        NqId = 4201522392,
        NqRecipeId = 367260237,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineSmallManeuver4"] = {
        Name = "Rare Maneuver Atmospheric Engine",
        FullName = "Rare Maneuver Atmospheric Engine S",
        NqId = 1301142497,
        NqRecipeId = 626408341,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["SpaceEngineXtraLargeManeuver4"] = {
        Name = "Rare Maneuver Space Engine",
        FullName = "Rare Maneuver Space Engine XL",
        NqId = 1773467598,
        NqRecipeId = 1697938584,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineXtraSmallManeuver4"] = {
        Name = "Rare Maneuver Space Engine",
        FullName = "Rare Maneuver Space Engine XS",
        NqId = 2368501171,
        NqRecipeId = 529497015,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineLargeManeuver4"] = {
        Name = "Rare Maneuver Space Engine",
        FullName = "Rare Maneuver Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineMediumManeuver4"] = {
        Name = "Rare Maneuver Space Engine",
        FullName = "Rare Maneuver Space Engine M",
        NqId = 1757019468,
        NqRecipeId = 1475837140,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineSmallManeuver4"] = {
        Name = "Rare Maneuver Space Engine",
        FullName = "Rare Maneuver Space Engine S",
        NqId = 1624640872,
        NqRecipeId = 1574474551,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["IndustryMetalwork4"] = {
        Name = "Rare Metalwork Industry",
        FullName = "Rare Metalwork Industry M",
        NqId = 2808015396,
        NqRecipeId = 127106565,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["AtmosphericEngineXtraSmallMilitary4"] = {
        Name = "Rare Military Atmospheric Engine",
        FullName = "Rare Military Atmospheric Engine XS",
        NqId = 2472120803,
        NqRecipeId = 683249654,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineLargeMilitary4"] = {
        Name = "Rare Military Atmospheric Engine",
        FullName = "Rare Military Atmospheric Engine L",
        NqId = 2559369176,
        NqRecipeId = 1947882312,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineSmallMilitary4"] = {
        Name = "Rare Military Atmospheric Engine",
        FullName = "Rare Military Atmospheric Engine S",
        NqId = 385121459,
        NqRecipeId = 195371963,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineMediumMilitary4"] = {
        Name = "Rare Military Atmospheric Engine",
        FullName = "Rare Military Atmospheric Engine M",
        NqId = 790956382,
        NqRecipeId = 1136983700,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["SpaceEngineXtraLargeMilitary4"] = {
        Name = "Rare Military Space Engine",
        FullName = "Rare Military Space Engine XL",
        NqId = 934426296,
        NqRecipeId = 245643333,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineSmallMilitary4"] = {
        Name = "Rare Military Space Engine",
        FullName = "Rare Military Space Engine S",
        NqId = 2510194717,
        NqRecipeId = 591761622,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineLargeMilitary4"] = {
        Name = "Rare Military Space Engine",
        FullName = "Rare Military Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineMediumMilitary4"] = {
        Name = "Rare Military Space Engine",
        FullName = "Rare Military Space Engine M",
        NqId = 37629189,
        NqRecipeId = 1469676519,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineXtraSmallMilitary4"] = {
        Name = "Rare Military Space Engine",
        FullName = "Rare Military Space Engine XS",
        NqId = 1754053133,
        NqRecipeId = 1516385408,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["RareMiningUnitL"] = {
        Name = "Rare Mining Unit",
        FullName = "Rare Mining Unit L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["silo_4_xs"] = {
        Name = "Rare Missile Silo",
        FullName = "Rare Missile Silo XS",
        NqId = 3026356360,
        NqRecipeId = 1759819880,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_4_s"] = {
        Name = "Rare Missile Silo",
        FullName = "Rare Missile Silo S",
        NqId = 3857142317,
        NqRecipeId = 1764033658,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_4_m"] = {
        Name = "Rare Missile Silo",
        FullName = "Rare Missile Silo M",
        NqId = 3857142311,
        NqRecipeId = 1764033648,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["silo_4_l"] = {
        Name = "Rare Missile Silo",
        FullName = "Rare Missile Silo L",
        NqId = 3857142308,
        NqRecipeId = 1764033649,
        GroupId = "08d8a31f-514a-4f06-8938-d94e05131a35"
    },
    ["mobilepanel_4_xs"] = {
        Name = "Rare Mobile Panel",
        FullName = "Rare Mobile Panel XS",
        NqId = 407844051,
        NqRecipeId = 110624230,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_4_xl"] = {
        Name = "Rare Mobile Panel",
        FullName = "Rare Mobile Panel XL",
        NqId = 407844040,
        NqRecipeId = 110624031,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_4_s"] = {
        Name = "Rare Mobile Panel",
        FullName = "Rare Mobile Panel S",
        NqId = 494823725,
        NqRecipeId = 2096349029,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_4_m"] = {
        Name = "Rare Mobile Panel",
        FullName = "Rare Mobile Panel M",
        NqId = 494823731,
        NqRecipeId = 2096349055,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_4_l"] = {
        Name = "Rare Mobile Panel",
        FullName = "Rare Mobile Panel L",
        NqId = 494823730,
        NqRecipeId = 2096349054,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["optics_4"] = {
        Name = "Rare Optics",
        FullName = "Rare Optics",
        NqId = 3739200048,
        NqRecipeId = 73420221,
        GroupId = "08d8a31f-5101-4014-86b8-ac0ddcd19eb2"
    },
    ["orescanner_4_l"] = {
        Name = "Rare Ore Scanner",
        FullName = "Rare Ore Scanner L",
        NqId = 3501536145,
        NqRecipeId = 260118744,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["RadarPVPSpaceSmallPhasedarray4"] = {
        Name = "Rare Phased-Array Space Radar",
        FullName = "Rare Phased-Array Space Radar S",
        NqId = 809783311,
        NqRecipeId = 1710615317,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceMediumPhasedarray4"] = {
        Name = "Rare Phased-Array Space Radar",
        FullName = "Rare Phased-Array Space Radar M",
        NqId = 1707018149,
        NqRecipeId = 1852711352,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargePhasedarray4"] = {
        Name = "Rare Phased-Array Space Radar",
        FullName = "Rare Phased-Array Space Radar L",
        NqId = 2075264591,
        NqRecipeId = 316271440,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["powersystem_4"] = {
        Name = "Rare Power System",
        FullName = "Rare Power System",
        NqId = 527681750,
        NqRecipeId = 1458022909,
        GroupId = "08d8a31f-5102-4a00-82ae-1521925be2a3"
    },
    ["powerconvertor_4_xl"] = {
        Name = "Rare Power Transformer",
        FullName = "Rare Power Transformer XL",
        NqId = 3291043715,
        NqRecipeId = 1535128977,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["powerconvertor_4_l"] = {
        Name = "Rare Power Transformer",
        FullName = "Rare Power Transformer L",
        NqId = 4186198483,
        NqRecipeId = 1365329545,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["powerconvertor_4_m"] = {
        Name = "Rare Power Transformer",
        FullName = "Rare Power Transformer M",
        NqId = 4186198480,
        NqRecipeId = 1365329544,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["WeaponCannonExtraSmallPrecision4"] = {
        Name = "Rare Precision Cannon",
        FullName = "Rare Precision Cannon XS",
        NqId = 3455226644,
        NqRecipeId = 1861248031,
        GroupId = "08d8a31f-4f5b-494b-881b-b9862b65b7b3"
    },
    ["WeaponCannonMediumPrecision4"] = {
        Name = "Rare Precision Cannon",
        FullName = "Rare Precision Cannon M",
        NqId = 2457342403,
        NqRecipeId = 1693863574,
        GroupId = "08d8a31f-4f5d-4297-82bc-fb38b7711af7"
    },
    ["WeaponCannonSmallPrecision4"] = {
        Name = "Rare Precision Cannon",
        FullName = "Rare Precision Cannon S",
        NqId = 3567179842,
        NqRecipeId = 2083650541,
        GroupId = "08d8a31f-4f5d-4d83-84c4-55d290b4f533"
    },
    ["WeaponCannonLargePrecision4"] = {
        Name = "Rare Precision Cannon",
        FullName = "Rare Precision Cannon L",
        NqId = 845167469,
        NqRecipeId = 1439705092,
        GroupId = "08d8a31f-4f5c-464b-86d5-7e47fc7959da"
    },
    ["WeaponLaserLargePrecision4"] = {
        Name = "Rare Precision Laser",
        FullName = "Rare Precision Laser L",
        NqId = 2356629409,
        NqRecipeId = 282920720,
        GroupId = "08d8a31f-4f60-4649-8c9a-20377688c717"
    },
    ["WeaponLaserExtraSmallPrecision4"] = {
        Name = "Rare Precision Laser",
        FullName = "Rare Precision Laser XS",
        NqId = 1604660448,
        NqRecipeId = 211643282,
        GroupId = "08d8a31f-4f5f-46c4-8b8c-dc1e1383f082"
    },
    ["WeaponLaserMediumPrecision4"] = {
        Name = "Rare Precision Laser",
        FullName = "Rare Precision Laser M",
        NqId = 3840109425,
        NqRecipeId = 1867707065,
        GroupId = "08d8a31f-4f61-4484-81b6-b3ecf3927f86"
    },
    ["WeaponLaserSmallPrecision4"] = {
        Name = "Rare Precision Laser",
        FullName = "Rare Precision Laser S",
        NqId = 3730148335,
        NqRecipeId = 1823871679,
        GroupId = "08d8a31f-4f62-42ba-8729-4ac5979dc3b4"
    },
    ["WeaponMissileExtraSmallPrecision4"] = {
        Name = "Rare Precision Missile",
        FullName = "Rare Precision Missile XS",
        NqId = 2239993845,
        NqRecipeId = 1590398413,
        GroupId = "08d8a31f-4f90-418c-8267-cb319724d97c"
    },
    ["WeaponMissileLargePrecision4"] = {
        Name = "Rare Precision Missile",
        FullName = "Rare Precision Missile L",
        NqId = 1205879482,
        NqRecipeId = 221816654,
        GroupId = "08d8a31f-4f91-4a97-875b-4c3b0238a44e"
    },
    ["WeaponMissileSmallPrecision4"] = {
        Name = "Rare Precision Missile",
        FullName = "Rare Precision Missile S",
        NqId = 2668363432,
        NqRecipeId = 1082750843,
        GroupId = "08d8a31f-4f93-4778-8eb3-ba552a0d7332"
    },
    ["WeaponMissileMediumPrecision4"] = {
        Name = "Rare Precision Missile",
        FullName = "Rare Precision Missile M",
        NqId = 1217643700,
        NqRecipeId = 398759703,
        GroupId = "08d8a31f-4f92-4ba5-88f6-61969b8ccce1"
    },
    ["WeaponRailgunLargePrecision4"] = {
        Name = "Rare Precision Railgun",
        FullName = "Rare Precision Railgun L",
        NqId = 2916726763,
        NqRecipeId = 1655982712,
        GroupId = "08d8a31f-4f96-4091-805d-53511d91cd09"
    },
    ["WeaponRailgunMediumPrecision4"] = {
        Name = "Rare Precision Railgun",
        FullName = "Rare Precision Railgun M",
        NqId = 111253039,
        NqRecipeId = 640256507,
        GroupId = "08d8a31f-4f96-4c89-8e0c-9250ebb84159"
    },
    ["WeaponRailgunExtraSmallPrecision4"] = {
        Name = "Rare Precision Railgun",
        FullName = "Rare Precision Railgun XS",
        NqId = 690643396,
        NqRecipeId = 449173926,
        GroupId = "08d8a31f-4f95-4404-84e5-b689b441fd9d"
    },
    ["WeaponRailgunSmallPrecision4"] = {
        Name = "Rare Precision Railgun",
        FullName = "Rare Precision Railgun S",
        NqId = 831043070,
        NqRecipeId = 852069129,
        GroupId = "08d8a31f-4f97-48b1-8404-6c28d83f17c6"
    },
    ["RadarPVPSpaceSmallProtected4"] = {
        Name = "Rare Protected Space Radar",
        FullName = "Rare Protected Space Radar S",
        NqId = 2375197136,
        NqRecipeId = 890188974,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceLargeProtected4"] = {
        Name = "Rare Protected Space Radar",
        FullName = "Rare Protected Space Radar L",
        NqId = 3250064333,
        NqRecipeId = 1395894643,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceMediumProtected4"] = {
        Name = "Rare Protected Space Radar",
        FullName = "Rare Protected Space Radar M",
        NqId = 3060580945,
        NqRecipeId = 1962270580,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["quantumalignmentunit_4"] = {
        Name = "Rare Quantum Alignment Unit",
        FullName = "Rare Quantum Alignment Unit",
        NqId = 2601646635,
        NqRecipeId = 1150226655,
        GroupId = "08d8a31f-5121-4056-803b-0a9105e28ff4"
    },
    ["quantumcore_4"] = {
        Name = "Rare Quantum Core",
        FullName = "Rare Quantum Core",
        NqId = 850241763,
        NqRecipeId = 1457246787,
        GroupId = "08d8a31f-5114-4794-8c3c-f3756c8d4ca9"
    },
    ["RadarPVPSpaceSmallQuickwired4"] = {
        Name = "Rare Quick-Wired Space Radar",
        FullName = "Rare Quick-Wired Space Radar S",
        NqId = 838245691,
        NqRecipeId = 1511409842,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceMediumQuickwired4"] = {
        Name = "Rare Quick-Wired Space Radar",
        FullName = "Rare Quick-Wired Space Radar M",
        NqId = 2608116213,
        NqRecipeId = 1615649736,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["RadarPVPSpaceLargeQuickwired4"] = {
        Name = "Rare Quick-Wired Space Radar",
        FullName = "Rare Quick-Wired Space Radar L",
        NqId = 3612800255,
        NqRecipeId = 1773946998,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["IndustryRecycler4"] = {
        Name = "Rare Recycler",
        FullName = "Rare Recycler M",
        NqId = 3264314284,
        NqRecipeId = 1952786486,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["IndustryRefiner4"] = {
        Name = "Rare Refiner",
        FullName = "Rare Refiner M",
        NqId = 584577123,
        NqRecipeId = 1597739669,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["reinforcedframe_4_s"] = {
        Name = "Rare Reinforced Frame",
        FullName = "Rare Reinforced Frame S",
        NqId = 994057994,
        NqRecipeId = 264397474,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_4_l"] = {
        Name = "Rare Reinforced Frame",
        FullName = "Rare Reinforced Frame L",
        NqId = 994058003,
        NqRecipeId = 264397499,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_4_m"] = {
        Name = "Rare Reinforced Frame",
        FullName = "Rare Reinforced Frame M",
        NqId = 994058004,
        NqRecipeId = 264397496,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_4_xl"] = {
        Name = "Rare Reinforced Frame",
        FullName = "Rare Reinforced Frame XL",
        NqId = 1179605671,
        NqRecipeId = 486727209,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_4_xs"] = {
        Name = "Rare Reinforced Frame",
        FullName = "Rare Reinforced Frame XS",
        NqId = 1179605664,
        NqRecipeId = 486727218,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["roboticarm_4_m"] = {
        Name = "Rare Robotic Arm",
        FullName = "Rare Robotic Arm M",
        NqId = 997370746,
        NqRecipeId = 1977452842,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["AtmosphericEngineSmallSafe4"] = {
        Name = "Rare Safe Atmospheric Engine",
        FullName = "Rare Safe Atmospheric Engine S",
        NqId = 3689697821,
        NqRecipeId = 1370788421,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineXtraSmallSafe4"] = {
        Name = "Rare Safe Atmospheric Engine",
        FullName = "Rare Safe Atmospheric Engine XS",
        NqId = 3612851272,
        NqRecipeId = 1754203573,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineMediumSafe4"] = {
        Name = "Rare Safe Atmospheric Engine",
        FullName = "Rare Safe Atmospheric Engine M",
        NqId = 2370891600,
        NqRecipeId = 1786777583,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineLargeSafe4"] = {
        Name = "Rare Safe Atmospheric Engine",
        FullName = "Rare Safe Atmospheric Engine L",
        NqId = 3211645332,
        NqRecipeId = 1844825272,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["SpaceEngineXtraLargeSafe4"] = {
        Name = "Rare Safe Space Engine",
        FullName = "Rare Safe Space Engine XL",
        NqId = 3478227882,
        NqRecipeId = 270998446,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineLargeSafe4"] = {
        Name = "Rare Safe Space Engine",
        FullName = "Rare Safe Space Engine L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineSmallSafe4"] = {
        Name = "Rare Safe Space Engine",
        FullName = "Rare Safe Space Engine S",
        NqId = 2682344778,
        NqRecipeId = 705850370,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraSmallSafe4"] = {
        Name = "Rare Safe Space Engine",
        FullName = "Rare Safe Space Engine XS",
        NqId = 175947630,
        NqRecipeId = 1368998335,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineMediumSafe4"] = {
        Name = "Rare Safe Space Engine",
        FullName = "Rare Safe Space Engine M",
        NqId = 1326315525,
        NqRecipeId = 655633791,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["singularitycontainer_4"] = {
        Name = "Rare Singularity Container",
        FullName = "Rare Singularity Container",
        NqId = 3640212315,
        NqRecipeId = 1213606733,
        GroupId = "08d8a31f-5116-4472-84d8-1cf2de11b3a3"
    },
    ["IndustrySmelter4"] = {
        Name = "Rare Smelter",
        FullName = "Rare Smelter M",
        NqId = 1132446358,
        NqRecipeId = 1137084672,
        GroupId = "08d8a31f-4ff8-49fb-8db5-ac6e49ab44d3"
    },
    ["standardframe_4_m"] = {
        Name = "Rare Standard Frame",
        FullName = "Rare Standard Frame M",
        NqId = 1981362671,
        NqRecipeId = 461684147,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_4_s"] = {
        Name = "Rare Standard Frame",
        FullName = "Rare Standard Frame S",
        NqId = 1981362581,
        NqRecipeId = 461684153,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_4_l"] = {
        Name = "Rare Standard Frame",
        FullName = "Rare Standard Frame L",
        NqId = 1981362670,
        NqRecipeId = 461684144,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["StructuralPart4"] = {
        Name = "Rare Structural Parts",
        FullName = "Rare Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5159-4bb2-877d-6d69aec28495"
    },
    ["FunctionalPart4"] = {
        Name = "Rare Structural Parts",
        FullName = "Rare Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5124-4830-8c0e-147fd07bdd38"
    },
    ["Receiver"] = {
        Name = "Receiver",
        FullName = "Receiver XS",
        NqId = 3732634076,
        NqRecipeId = 1331526108,
        GroupId = "08d8a31f-4fb7-448f-81fb-4240fd238541"
    },
    ["ReceiverMedium"] = {
        Name = "Receiver",
        FullName = "Receiver M",
        NqId = 736740615,
        NqRecipeId = 1393357095,
        GroupId = "08d8a31f-4fb7-448f-81fb-4240fd238541"
    },
    ["ReceiverSmall"] = {
        Name = "Receiver",
        FullName = "Receiver S",
        NqId = 2082095499,
        NqRecipeId = 1606594315,
        GroupId = "08d8a31f-4fb7-448f-81fb-4240fd238541"
    },
    ["hcAlLiPanelRed"] = {
        Name = "Red Al-Li Panel",
        FullName = "Red Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelRed"] = {
        Name = "Red Aluminium Panel",
        FullName = "Red Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelRed"] = {
        Name = "Red Calcium Panel",
        FullName = "Red Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelRed"] = {
        Name = "Red Carbon Panel",
        FullName = "Red Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelRed"] = {
        Name = "Red Chromium Panel",
        FullName = "Red Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelRed"] = {
        Name = "Red Cobalt Panel",
        FullName = "Red Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelRed"] = {
        Name = "Red Copper Panel",
        FullName = "Red Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelRed"] = {
        Name = "Red Duralumin Panel",
        FullName = "Red Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelRed"] = {
        Name = "Red Fluorine Panel",
        FullName = "Red Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelRed"] = {
        Name = "Red Gold Panel",
        FullName = "Red Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["RedGoldProduct"] = {
        Name = "Red Gold Product",
        FullName = "Red Gold Product",
        NqId = 2550840787,
        NqRecipeId = 684037683,
        GroupId = "08d8a31f-50c9-4c0d-8195-ca76d714eca0"
    },
    ["hcGrade5TitaniumAlloyPanelRed"] = {
        Name = "Red Grade 5 Titanium Alloy Panel",
        FullName = "Red Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelRed"] = {
        Name = "Red Inconel Panel",
        FullName = "Red Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelRed"] = {
        Name = "Red Iron Panel",
        FullName = "Red Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelRed"] = {
        Name = "Red Lithium Panel",
        FullName = "Red Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelRed"] = {
        Name = "Red Mangalloy Panel",
        FullName = "Red Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelRed"] = {
        Name = "Red Manganese Panel",
        FullName = "Red Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelRed"] = {
        Name = "Red Maraging Steel Panel",
        FullName = "Red Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelRed"] = {
        Name = "Red Nickel Panel",
        FullName = "Red Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelRed"] = {
        Name = "Red Niobium Panel",
        FullName = "Red Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleTileHCRedCold"] = {
        Name = "Red pattern marble (cold)",
        FullName = "Red pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCRed"] = {
        Name = "Red pattern plastic",
        FullName = "Red pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCRedCold"] = {
        Name = "Red pattern plastic (cold)",
        FullName = "Red pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCRed"] = {
        Name = "Red pattern steel",
        FullName = "Red pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcScAlPanelRed"] = {
        Name = "Red Sc-Al Panel",
        FullName = "Red Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelRed"] = {
        Name = "Red Scandium Panel",
        FullName = "Red Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelRed"] = {
        Name = "Red Silicon Panel",
        FullName = "Red Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelRed"] = {
        Name = "Red Silumin Panel",
        FullName = "Red Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelRed"] = {
        Name = "Red Silver Panel",
        FullName = "Red Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelRed"] = {
        Name = "Red Sodium Panel",
        FullName = "Red Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelRed"] = {
        Name = "Red Stainless Steel Panel",
        FullName = "Red Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelRed"] = {
        Name = "Red Steel Panel",
        FullName = "Red Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelRed"] = {
        Name = "Red Sulfur Panel",
        FullName = "Red Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelRed"] = {
        Name = "Red Titanium Panel",
        FullName = "Red Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelRed"] = {
        Name = "Red Vanadium Panel",
        FullName = "Red Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["ShipDoor01"] = {
        Name = "Reinforced Sliding Door",
        FullName = "Reinforced Sliding Door",
        NqId = 1139773633,
        NqRecipeId = 700444865,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["Relay"] = {
        Name = "Relay",
        FullName = "Relay",
        NqId = 1694177571,
        NqRecipeId = 1836783907,
        GroupId = "08d8a31f-4fb8-426c-848c-005032b3cf89"
    },
    ["RemoteControl"] = {
        Name = "Remote Controller",
        FullName = "Remote Controller",
        NqId = 1866437084,
        NqRecipeId = 24594780,
        GroupId = "08d8a31f-4f3f-4fd1-86bf-f54d198f8287"
    },
    ["RepairUnit"] = {
        Name = "Repair Unit",
        FullName = "Repair Unit",
        NqId = 774130122,
        NqRecipeId = 749103562,
        GroupId = "08d8a31f-4f43-4c1b-857d-a83c01d973a8"
    },
    ["ResurrectionNode"] = {
        Name = "Resurrection Node",
        FullName = "Resurrection Node",
        NqId = 1109114394,
        NqRecipeId = 1053616004,
        GroupId = "08d8a31f-4f41-430b-83d3-76de8bd9f0cf"
    },
    ["RetroEngineMedium"] = {
        Name = "Retro-rocket Brake",
        FullName = "Retro-rocket Brake M",
        NqId = 3243532126,
        NqRecipeId = 156933918,
        GroupId = "08d8a31f-5021-45bd-846d-5c7b7ffd67d9"
    },
    ["RetroEngineLarge"] = {
        Name = "Retro-rocket Brake",
        FullName = "Retro-rocket Brake L",
        NqId = 1452351552,
        NqRecipeId = 476284886,
        GroupId = "08d8a31f-5021-45bd-846d-5c7b7ffd67d9"
    },
    ["RetroEngine"] = {
        Name = "Retro-rocket Brake",
        FullName = "Retro-rocket Brake S",
        NqId = 3039211660,
        NqRecipeId = 173201548,
        GroupId = "08d8a31f-5021-45bd-846d-5c7b7ffd67d9"
    },
    ["ManganeseOre"] = {
        Name = "Rhodonite",
        FullName = "Rhodonite",
        NqId = 3934774987,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c3-4814-875e-27353e233d6c"
    },
    ["RocketEngineSmall"] = {
        Name = "Rocket Engine",
        FullName = "Rocket Engine S",
        NqId = 2112772336,
        NqRecipeId = 1359689038,
        GroupId = "08d8a31f-502b-4e76-8f2b-a1495d7a1aec"
    },
    ["RocketEngineMedium"] = {
        Name = "Rocket Engine",
        FullName = "Rocket Engine M",
        NqId = 3623903713,
        NqRecipeId = 1036257592,
        GroupId = "08d8a31f-502b-4e76-8f2b-a1495d7a1aec"
    },
    ["RocketEngineLarge"] = {
        Name = "Rocket Engine",
        FullName = "Rocket Engine L",
        NqId = 359938916,
        NqRecipeId = 769815200,
        GroupId = "08d8a31f-502b-4e76-8f2b-a1495d7a1aec"
    },
    ["RadialRocketFuelTank"] = {
        Name = "Rocket Fuel Tank",
        FullName = "Rocket Fuel Tank S",
        NqId = 3126840739,
        NqRecipeId = 636058384,
        GroupId = "08d8a31f-4fef-41c2-8fb1-52db13d935cb"
    },
    ["RadialRocketFuelTankLarge"] = {
        Name = "Rocket Fuel Tank",
        FullName = "Rocket Fuel Tank L",
        NqId = 4180073139,
        NqRecipeId = 2046909631,
        GroupId = "08d8a31f-4fef-41c2-8fb1-52db13d935cb"
    },
    ["RadialRocketFuelTankMedium"] = {
        Name = "Rocket Fuel Tank",
        FullName = "Rocket Fuel Tank M",
        NqId = 2477859329,
        NqRecipeId = 1580550826,
        GroupId = "08d8a31f-4fef-41c2-8fb1-52db13d935cb"
    },
    ["RadialRocketFuelTankXSmall"] = {
        Name = "Rocket Fuel Tank",
        FullName = "Rocket Fuel Tank XS",
        NqId = 1663412227,
        NqRecipeId = 349296477,
        GroupId = "08d8a31f-4fef-41c2-8fb1-52db13d935cb"
    },
    ["Carpet02"] = {
        Name = "Round carpet",
        FullName = "Round carpet",
        NqId = 3813093434,
        NqRecipeId = 2106142778,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["BacDeco05"] = {
        Name = "Salad Plant Case",
        FullName = "Salad Plant Case",
        NqId = 3106061129,
        NqRecipeId = 1734687561,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["TerritoryUnitBasicSanctuary"] = {
        Name = "Sanctuary Territory Unit",
        FullName = "Sanctuary Territory Unit",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5043-4e51-846c-ba8030c227da"
    },
    ["ScAlProduct"] = {
        Name = "Sc-Al Alloy Product",
        FullName = "Sc-Al Alloy Product",
        NqId = 2929462635,
        NqRecipeId = 160929131,
        GroupId = "08d8a31f-50ce-45fd-88b9-0da7fa7c4e5a"
    },
    ["ScandiumScrap"] = {
        Name = "Scandium Scrap",
        FullName = "Scandium Scrap",
        NqId = 270611770,
        NqRecipeId = 561061818,
        GroupId = "08d8a31f-4f37-4fa5-882d-57740730e9aa"
    },
    ["ScreenOp20x"] = {
        Name = "Screen",
        FullName = "Screen XL",
        NqId = 879675317,
        NqRecipeId = 1397759925,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["Screen3x"] = {
        Name = "Screen",
        FullName = "Screen M",
        NqId = 184261558,
        NqRecipeId = 5872566,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["Screen2x"] = {
        Name = "Screen",
        FullName = "Screen S",
        NqId = 184261490,
        NqRecipeId = 5872498,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["Screen1x"] = {
        Name = "Screen",
        FullName = "Screen XS",
        NqId = 184261427,
        NqRecipeId = 5872435,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["Shelf03"] = {
        Name = "Shelf empty",
        FullName = "Shelf empty",
        NqId = 4083139459,
        NqRecipeId = 405259139,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Shelf01"] = {
        Name = "Shelf full",
        FullName = "Shelf full",
        NqId = 4083139485,
        NqRecipeId = 405259165,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Shelf02"] = {
        Name = "Shelf half full",
        FullName = "Shelf half full",
        NqId = 4083139484,
        NqRecipeId = 405259164,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["shield_0_1"] = {
        Name = "Shield Generator",
        FullName = "Shield Generator XS",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d983f2-4c45-4042-837d-73282f0eaffc"
    },
    ["shield_1_1"] = {
        Name = "Shield Generator",
        FullName = "Shield Generator S",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d983f2-4c45-4042-837d-73282f0eaffc"
    },
    ["shield_2_1"] = {
        Name = "Shield Generator",
        FullName = "Shield Generator M",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d983f2-4c45-4042-837d-73282f0eaffc"
    },
    ["shield_3_1"] = {
        Name = "Shield Generator",
        FullName = "Shield Generator L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d983f2-4c45-4042-837d-73282f0eaffc"
    },
    ["Shower_S01"] = {
        Name = "Shower Unit",
        FullName = "Shower Unit",
        NqId = 2846288811,
        NqRecipeId = 1826545424,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["ScreenSignHLarge"] = {
        Name = "Sign",
        FullName = "Sign L",
        NqId = 166549741,
        NqRecipeId = 2097989603,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["ScreenSignHMedium"] = {
        Name = "Sign",
        FullName = "Sign M",
        NqId = 3068429457,
        NqRecipeId = 748901742,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["ScreenSignHSmall"] = {
        Name = "Sign",
        FullName = "Sign S",
        NqId = 362159734,
        NqRecipeId = 767241928,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["ScreenSignHXSmall"] = {
        Name = "Sign",
        FullName = "Sign XS",
        NqId = 166656023,
        NqRecipeId = 78361156,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["SiliconScrap"] = {
        Name = "Silicon Scrap",
        FullName = "Silicon Scrap",
        NqId = 4063983201,
        NqRecipeId = 833707105,
        GroupId = "08d8a31f-4f35-4e5c-84a4-fca5d5dc27d0"
    },
    ["SiluminProduct"] = {
        Name = "Silumin Product",
        FullName = "Silumin Product",
        NqId = 2565702107,
        NqRecipeId = 1289193723,
        GroupId = "08d8a31f-50ce-45fd-88b9-0da7fa7c4e5a"
    },
    ["SilverPure"] = {
        Name = "Silver Pure",
        FullName = "Silver Pure",
        NqId = 1807690770,
        NqRecipeId = 1689312272,
        GroupId = "08d8a31f-50d3-41e5-87da-e64c4a37e842"
    },
    ["SilverScrap"] = {
        Name = "Silver Scrap",
        FullName = "Silver Scrap",
        NqId = 3814734889,
        NqRecipeId = 234390569,
        GroupId = "08d8a31f-4f35-421d-8634-1cbcaaf55d86"
    },
    ["Washbasin_S01"] = {
        Name = "Sink unit",
        FullName = "Sink unit",
        NqId = 400937499,
        NqRecipeId = 882138164,
        GroupId = "08d8a31f-4f9c-4b18-88ab-5a018cf18af9"
    },
    ["hcAlLiPanelSky"] = {
        Name = "Sky Al-Li Panel",
        FullName = "Sky Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelSky"] = {
        Name = "Sky Aluminium Panel",
        FullName = "Sky Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelSky"] = {
        Name = "Sky Calcium Panel",
        FullName = "Sky Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelSky"] = {
        Name = "Sky Carbon Panel",
        FullName = "Sky Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelSky"] = {
        Name = "Sky Chromium Panel",
        FullName = "Sky Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelSky"] = {
        Name = "Sky Cobalt Panel",
        FullName = "Sky Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelSky"] = {
        Name = "Sky Copper Panel",
        FullName = "Sky Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelSky"] = {
        Name = "Sky Duralumin Panel",
        FullName = "Sky Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelSky"] = {
        Name = "Sky Fluorine Panel",
        FullName = "Sky Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelSky"] = {
        Name = "Sky Gold Panel",
        FullName = "Sky Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelSky"] = {
        Name = "Sky Grade 5 Titanium Alloy Panel",
        FullName = "Sky Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelSky"] = {
        Name = "Sky Inconel Panel",
        FullName = "Sky Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelSky"] = {
        Name = "Sky Iron Panel",
        FullName = "Sky Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelSky"] = {
        Name = "Sky Lithium Panel",
        FullName = "Sky Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelSky"] = {
        Name = "Sky Mangalloy Panel",
        FullName = "Sky Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelSky"] = {
        Name = "Sky Manganese Panel",
        FullName = "Sky Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelSky"] = {
        Name = "Sky Maraging Steel Panel",
        FullName = "Sky Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelSky"] = {
        Name = "Sky Nickel Panel",
        FullName = "Sky Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelSky"] = {
        Name = "Sky Niobium Panel",
        FullName = "Sky Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["hcScAlPanelSky"] = {
        Name = "Sky Sc-Al Panel",
        FullName = "Sky Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelSky"] = {
        Name = "Sky Scandium Panel",
        FullName = "Sky Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelSky"] = {
        Name = "Sky Silicon Panel",
        FullName = "Sky Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelSky"] = {
        Name = "Sky Silumin Panel",
        FullName = "Sky Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelSky"] = {
        Name = "Sky Silver Panel",
        FullName = "Sky Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelSky"] = {
        Name = "Sky Sodium Panel",
        FullName = "Sky Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelSky"] = {
        Name = "Sky Stainless Steel Panel",
        FullName = "Sky Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelSky"] = {
        Name = "Sky Steel Panel",
        FullName = "Sky Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelSky"] = {
        Name = "Sky Sulfur Panel",
        FullName = "Sky Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelSky"] = {
        Name = "Sky Titanium Panel",
        FullName = "Sky Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelSky"] = {
        Name = "Sky Vanadium Panel",
        FullName = "Sky Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["SlidingDoor"] = {
        Name = "Sliding Door",
        FullName = "Sliding Door S",
        NqId = 201196316,
        NqRecipeId = 1405119260,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["BigSlidingDoor"] = {
        Name = "Sliding Door",
        FullName = "Sliding Door M",
        NqId = 741980535,
        NqRecipeId = 952044375,
        GroupId = "08d8a31f-4faa-406f-8235-572bc4f85703"
    },
    ["SodiumScrap"] = {
        Name = "Sodium Scrap",
        FullName = "Sodium Scrap",
        NqId = 1831205658,
        NqRecipeId = 668586778,
        GroupId = "08d8a31f-4f38-4b17-8db3-5c38bc239e22"
    },
    ["Sofa"] = {
        Name = "Sofa",
        FullName = "Sofa",
        NqId = 1235633417,
        NqRecipeId = 1604732169,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["CoreUnitSpace256"] = {
        Name = "Space Core Unit",
        FullName = "Space Core Unit L",
        NqId = 5904544,
        NqRecipeId = 1079927298,
        GroupId = "08d8a31f-5047-490f-820f-02831171f900"
    },
    ["CoreUnitSpace128"] = {
        Name = "Space Core Unit",
        FullName = "Space Core Unit M",
        NqId = 5904195,
        NqRecipeId = 1079910357,
        GroupId = "08d8a31f-5047-490f-820f-02831171f900"
    },
    ["CoreUnitSpace64"] = {
        Name = "Space Core Unit",
        FullName = "Space Core Unit S",
        NqId = 3624940909,
        NqRecipeId = 959685269,
        GroupId = "08d8a31f-5047-490f-820f-02831171f900"
    },
    ["CoreUnitSpace32"] = {
        Name = "Space Core Unit",
        FullName = "Space Core Unit XS",
        NqId = 3624942103,
        NqRecipeId = 959686111,
        GroupId = "08d8a31f-5047-490f-820f-02831171f900"
    },
    ["RadialSpaceFuelLarge"] = {
        Name = "Space Fuel Tank",
        FullName = "Space Fuel Tank L",
        NqId = 2212207656,
        NqRecipeId = 463323479,
        GroupId = "08d8a31f-4ff0-4a28-8ff1-f443dae09ebb"
    },
    ["RadialSpaceFuelTank"] = {
        Name = "Space Fuel Tank",
        FullName = "Space Fuel Tank S",
        NqId = 1790622152,
        NqRecipeId = 1712649089,
        GroupId = "08d8a31f-4ff0-4a28-8ff1-f443dae09ebb"
    },
    ["RadialSpaceFuelTankMedium"] = {
        Name = "Space Fuel Tank",
        FullName = "Space Fuel Tank M",
        NqId = 773467906,
        NqRecipeId = 1145478538,
        GroupId = "08d8a31f-4ff0-4a28-8ff1-f443dae09ebb"
    },
    ["RadialSpaceFuelXtraSmall"] = {
        Name = "Space Fuel Tank",
        FullName = "Space Fuel Tank XS",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4ff0-4a28-8ff1-f443dae09ebb"
    },
    ["RadarPVPSpaceSmall"] = {
        Name = "Space Radar",
        FullName = "Space Radar S",
        NqId = 4118496992,
        NqRecipeId = 517038257,
        GroupId = "08d8a31f-4f47-48b5-8e7c-3995cb11640c"
    },
    ["RadarPVPSpaceLarge"] = {
        Name = "Space Radar",
        FullName = "Space Radar L",
        NqId = 2802863920,
        NqRecipeId = 1464123735,
        GroupId = "08d8a31f-4f46-4476-8649-6ace44db58a7"
    },
    ["RadarPVPSpaceMedium"] = {
        Name = "Space Radar",
        FullName = "Space Radar M",
        NqId = 3831485995,
        NqRecipeId = 57130286,
        GroupId = "08d8a31f-4f46-4e48-88a8-d04b553f8adb"
    },
    ["ProjectorHologramSpaceshipsmall"] = {
        Name = "Spaceship Hologram",
        FullName = "Spaceship Hologram S",
        NqId = 124823209,
        NqRecipeId = 474917863,
        GroupId = "08d8a31f-4fa3-4b28-8eb6-dae6c7194db1"
    },
    ["ProjectorHologramSpaceshipMedium"] = {
        Name = "Spaceship Hologram",
        FullName = "Spaceship Hologram M",
        NqId = 85154060,
        NqRecipeId = 1778183588,
        GroupId = "08d8a31f-4fa3-4b28-8eb6-dae6c7194db1"
    },
    ["ProjectorHologramSpaceshipLarge"] = {
        Name = "Spaceship Hologram",
        FullName = "Spaceship Hologram L",
        NqId = 2137895179,
        NqRecipeId = 361982036,
        GroupId = "08d8a31f-4fa3-4b28-8eb6-dae6c7194db1"
    },
    ["Carpet01"] = {
        Name = "Square carpet",
        FullName = "Square carpet",
        NqId = 3813093435,
        NqRecipeId = 2106142779,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["LightSquareXSmall"] = {
        Name = "Square Light",
        FullName = "Square Light XS",
        NqId = 177821174,
        NqRecipeId = 1013438890,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightSquareSmall"] = {
        Name = "Square Light",
        FullName = "Square Light S",
        NqId = 3981684520,
        NqRecipeId = 287335382,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightSquareMedium"] = {
        Name = "Square Light",
        FullName = "Square Light M",
        NqId = 632353355,
        NqRecipeId = 170837974,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightSquareLarge"] = {
        Name = "Square Light",
        FullName = "Square Light L",
        NqId = 823697268,
        NqRecipeId = 1948380318,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["BacDeco03"] = {
        Name = "Squash Plant Case",
        FullName = "Squash Plant Case",
        NqId = 3106061131,
        NqRecipeId = 1734687563,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["StabilizerXtraSmall"] = {
        Name = "Stabilizer",
        FullName = "Stabilizer XS",
        NqId = 1455311973,
        NqRecipeId = 155801090,
        GroupId = "08d8a31f-5009-4577-8699-fd711293c92f"
    },
    ["StabilizerLarge"] = {
        Name = "Stabilizer",
        FullName = "Stabilizer L",
        NqId = 1090402453,
        NqRecipeId = 260838861,
        GroupId = "08d8a31f-5009-4577-8699-fd711293c92f"
    },
    ["StabilizerMedium"] = {
        Name = "Stabilizer",
        FullName = "Stabilizer M",
        NqId = 3474622996,
        NqRecipeId = 1609056078,
        GroupId = "08d8a31f-5009-4577-8699-fd711293c92f"
    },
    ["StabilizerSmall"] = {
        Name = "Stabilizer",
        FullName = "Stabilizer S",
        NqId = 1234961120,
        NqRecipeId = 368643400,
        GroupId = "08d8a31f-5009-4577-8699-fd711293c92f"
    },
    ["MarbleTileHCBeigeColdL"] = {
        Name = "Stained beige pattern marble (cold)",
        FullName = "Stained beige pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBeigeL"] = {
        Name = "Stained beige pattern plastic",
        FullName = "Stained beige pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBeigeColdL"] = {
        Name = "Stained beige pattern plastic (cold)",
        FullName = "Stained beige pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBeigeL"] = {
        Name = "Stained beige pattern steel",
        FullName = "Stained beige pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleTileHCBlueColdL"] = {
        Name = "Stained blue pattern marble(cold)",
        FullName = "Stained blue pattern marble(cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCBlueL"] = {
        Name = "Stained blue pattern plastic",
        FullName = "Stained blue pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCBlueColdL"] = {
        Name = "Stained blue pattern plastic (cold)",
        FullName = "Stained blue pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCBlueL"] = {
        Name = "Stained blue pattern steel",
        FullName = "Stained blue pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["WoodTileHCBrown01L"] = {
        Name = "Stained brown pattern wood 1",
        FullName = "Stained brown pattern wood 1",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown02L"] = {
        Name = "Stained brown pattern wood 2",
        FullName = "Stained brown pattern wood 2",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown03L"] = {
        Name = "Stained brown pattern wood 3",
        FullName = "Stained brown pattern wood 3",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["WoodTileHCBrown04L"] = {
        Name = "Stained brown pattern wood 4",
        FullName = "Stained brown pattern wood 4",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["AluminiumTileHCGrayL"] = {
        Name = "Stained gray pattern aluminium",
        FullName = "Stained gray pattern aluminium",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["BrickTileHCGrayL"] = {
        Name = "Stained gray pattern brick",
        FullName = "Stained gray pattern brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberTileHCGrayL"] = {
        Name = "Stained gray pattern carbon fiber",
        FullName = "Stained gray pattern carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ChromiumTileHCGrayL"] = {
        Name = "Stained gray pattern Chromium",
        FullName = "Stained gray pattern Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["ConcreteTileHCGrayL"] = {
        Name = "Stained gray pattern concrete",
        FullName = "Stained gray pattern concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["CopperTileHCGrayL"] = {
        Name = "Stained gray pattern Copper",
        FullName = "Stained gray pattern Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldTileHCGrayL"] = {
        Name = "Stained gray pattern Gold",
        FullName = "Stained gray pattern Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronTileHCGrayL"] = {
        Name = "Stained gray pattern iron",
        FullName = "Stained gray pattern iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleTileHCGrayL"] = {
        Name = "Stained gray pattern marble",
        FullName = "Stained gray pattern marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGrayL"] = {
        Name = "Stained gray pattern plastic",
        FullName = "Stained gray pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGrayL"] = {
        Name = "Stained gray pattern steel",
        FullName = "Stained gray pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumTileHCGrayL"] = {
        Name = "Stained gray pattern Titanium",
        FullName = "Stained gray pattern Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodTileHCGrayL"] = {
        Name = "Stained gray pattern wood",
        FullName = "Stained gray pattern wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["MarbleTileHCGreenColdL"] = {
        Name = "Stained green pattern marble (cold)",
        FullName = "Stained green pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCGreenL"] = {
        Name = "Stained green pattern plastic",
        FullName = "Stained green pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCGreenColdL"] = {
        Name = "Stained green pattern plastic (cold)",
        FullName = "Stained green pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCGreenL"] = {
        Name = "Stained green pattern steel",
        FullName = "Stained green pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleTileHCOrangeColdL"] = {
        Name = "Stained orange pattern marble (cold)",
        FullName = "Stained orange pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCOrangeL"] = {
        Name = "Stained orange pattern plastic",
        FullName = "Stained orange pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCOrangeColdL"] = {
        Name = "Stained orange pattern plastic (cold)",
        FullName = "Stained orange pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCOrangeL"] = {
        Name = "Stained orange pattern steel",
        FullName = "Stained orange pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["BrickTileHCBrick01L"] = {
        Name = "Stained pattern brick 1",
        FullName = "Stained pattern brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick02L"] = {
        Name = "Stained pattern brick 2",
        FullName = "Stained pattern brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick03L"] = {
        Name = "Stained pattern brick 3",
        FullName = "Stained pattern brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickTileHCBrick04L"] = {
        Name = "Stained pattern brick 4",
        FullName = "Stained pattern brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["MarbleTileHCRedColdL"] = {
        Name = "Stained red pattern marble (cold)",
        FullName = "Stained red pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCRedL"] = {
        Name = "Stained red pattern plastic",
        FullName = "Stained red pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCRedColdL"] = {
        Name = "Stained red pattern plastic (cold)",
        FullName = "Stained red pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCRedL"] = {
        Name = "Stained red pattern steel",
        FullName = "Stained red pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["MarbleTileHCYellowColdL"] = {
        Name = "Stained yellow pattern marble (cold)",
        FullName = "Stained yellow pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCYellowL"] = {
        Name = "Stained yellow pattern plastic",
        FullName = "Stained yellow pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCYellowColdL"] = {
        Name = "Stained yellow pattern plastic (cold)",
        FullName = "Stained yellow pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCYellowL"] = {
        Name = "Stained yellow pattern steel",
        FullName = "Stained yellow pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["StainlessSteelProduct"] = {
        Name = "Stainless Steel product",
        FullName = "Stainless Steel product",
        NqId = 2984358477,
        NqRecipeId = 1716547361,
        GroupId = "08d8a31f-50cc-4ded-8dcb-a7255197db20"
    },
    ["CoreUnitStatic256"] = {
        Name = "Static Core Unit",
        FullName = "Static Core Unit L",
        NqId = 910155097,
        NqRecipeId = 1339132959,
        GroupId = "08d8a31f-5048-4c99-81a8-ceeeaf6a7bf6"
    },
    ["CoreUnitStatic32"] = {
        Name = "Static Core Unit",
        FullName = "Static Core Unit XS",
        NqId = 2738359963,
        NqRecipeId = 555861577,
        GroupId = "08d8a31f-5048-4c99-81a8-ceeeaf6a7bf6"
    },
    ["CoreUnitStatic64"] = {
        Name = "Static Core Unit",
        FullName = "Static Core Unit S",
        NqId = 2738359893,
        NqRecipeId = 555863691,
        GroupId = "08d8a31f-5048-4c99-81a8-ceeeaf6a7bf6"
    },
    ["CoreUnitStatic128"] = {
        Name = "Static Core Unit",
        FullName = "Static Core Unit M",
        NqId = 909184430,
        NqRecipeId = 1339054248,
        GroupId = "08d8a31f-5048-4c99-81a8-ceeeaf6a7bf6"
    },
    ["DecoColumn2x"] = {
        Name = "Steel column",
        FullName = "Steel column",
        NqId = 1220701936,
        NqRecipeId = 559303920,
        GroupId = "08d8a31f-4fa1-430f-8ebe-83061310cfc1"
    },
    ["DecoPanel1x2"] = {
        Name = "Steel panel",
        FullName = "Steel panel",
        NqId = 4145570204,
        NqRecipeId = 1422985116,
        GroupId = "08d8a31f-4fa1-430f-8ebe-83061310cfc1"
    },
    ["SteelProduct"] = {
        Name = "Steel product",
        FullName = "Steel product",
        NqId = 511774178,
        NqRecipeId = 2116244450,
        GroupId = "08d8a31f-50cc-4ded-8dcb-a7255197db20"
    },
    ["SulfurScrap"] = {
        Name = "Sulfur Scrap",
        FullName = "Sulfur Scrap",
        NqId = 1423148560,
        NqRecipeId = 28196368,
        GroupId = "08d8a31f-4f35-421d-8634-1cbcaaf55d86"
    },
    ["SurrogatePodStation"] = {
        Name = "Surrogate Pod Station",
        FullName = "Surrogate Pod Station",
        NqId = 3667785070,
        NqRecipeId = 1310573727,
        GroupId = "08d8a31f-4f41-4cba-81bf-94764954d890"
    },
    ["SurrogateVRStation"] = {
        Name = "Surrogate VR Station",
        FullName = "Surrogate VR Station",
        NqId = 2093838343,
        NqRecipeId = 312497124,
        GroupId = "08d8a31f-4f41-4cba-81bf-94764954d890"
    },
    ["SacDeco05"] = {
        Name = "Suspended Fruit Plant",
        FullName = "Suspended Fruit Plant",
        NqId = 630574502,
        NqRecipeId = 1389186470,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["SacDeco03"] = {
        Name = "Suspended Plant A",
        FullName = "Suspended Plant A",
        NqId = 630574504,
        NqRecipeId = 1389186472,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["SacDeco04"] = {
        Name = "Suspended Plant B",
        FullName = "Suspended Plant B",
        NqId = 630574503,
        NqRecipeId = 1389186471,
        GroupId = "08d8a31f-4fa2-4e5d-8399-484cabdef569"
    },
    ["Table"] = {
        Name = "Table",
        FullName = "Table",
        NqId = 1395483977,
        NqRecipeId = 2142070089,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Telemeter"] = {
        Name = "Telemeter",
        FullName = "Telemeter",
        NqId = 1722901246,
        NqRecipeId = 819585790,
        GroupId = "08d8a31f-4fbd-4ac0-8098-857498063b9e"
    },
    ["TerritoryScanner"] = {
        Name = "Territory Scanner",
        FullName = "Territory Scanner",
        NqId = 3858829819,
        NqRecipeId = 1142459409,
        GroupId = "08d8a31f-4f43-4139-8031-268d364123c8"
    },
    ["TerritoryUnitBasic"] = {
        Name = "Territory Unit",
        FullName = "Territory Unit",
        NqId = 1358842892,
        NqRecipeId = 55289725,
        GroupId = "08d8a31f-5043-4e51-846c-ba8030c227da"
    },
    ["ThoramineOre"] = {
        Name = "Thoramine",
        FullName = "Thoramine",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c3-4814-875e-27353e233d6c"
    },
    ["TiNbProduct"] = {
        Name = "Ti-Nb Supraconductor product",
        FullName = "Ti-Nb Supraconductor product",
        NqId = 1734893264,
        NqRecipeId = 1183155920,
        GroupId = "08d8a31f-50c9-4c0d-8195-ca76d714eca0"
    },
    ["TitaniumScrap"] = {
        Name = "Titanium Scrap",
        FullName = "Titanium Scrap",
        NqId = 2165650011,
        NqRecipeId = 56396251,
        GroupId = "08d8a31f-4f37-4592-8af0-385eb1f61fa7"
    },
    ["WC_01_S01"] = {
        Name = "Toilet unit A",
        FullName = "Toilet unit A",
        NqId = 4186859262,
        NqRecipeId = 186554044,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["WC_02_S01"] = {
        Name = "Toilet unit B",
        FullName = "Toilet unit B",
        NqId = 3929116491,
        NqRecipeId = 1709879146,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["TransferUnit"] = {
        Name = "Transfer Unit",
        FullName = "Transfer Unit",
        NqId = 4139262245,
        NqRecipeId = 721775397,
        GroupId = "08d8a31f-4ff2-4c9f-883c-0a8b2b6033e7"
    },
    ["ScreenTransparent1x"] = {
        Name = "Transparent Screen",
        FullName = "Transparent Screen XS",
        NqId = 3988665660,
        NqRecipeId = 1337135996,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["ScreenTransparent4x"] = {
        Name = "Transparent Screen",
        FullName = "Transparent Screen L",
        NqId = 3988662884,
        NqRecipeId = 1337135686,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["ScreenTransparent2x"] = {
        Name = "Transparent Screen",
        FullName = "Transparent Screen S",
        NqId = 3988663014,
        NqRecipeId = 1337136191,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["ScreenTransparent3x"] = {
        Name = "Transparent Screen",
        FullName = "Transparent Screen M",
        NqId = 3988662951,
        NqRecipeId = 1337136126,
        GroupId = "08d8a31f-4fa6-4dc5-8d96-209f15bc946a"
    },
    ["TransponderUnit"] = {
        Name = "Transponder",
        FullName = "Transponder",
        NqId = 63667997,
        NqRecipeId = 1324294981,
        GroupId = "08d8a31f-4f43-4c1b-857d-a83c01d973a8"
    },
    ["Trash"] = {
        Name = "Trash can",
        FullName = "Trash can",
        NqId = 1407324391,
        NqRecipeId = 1080168679,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Industry3DPrinter2"] = {
        Name = "Uncommon 3D Printer",
        FullName = "Uncommon 3D Printer M",
        NqId = 2793358078,
        NqRecipeId = 39016077,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["antenna_2_xs"] = {
        Name = "Uncommon Antenna",
        FullName = "Uncommon Antenna XS",
        NqId = 2302027954,
        NqRecipeId = 1784575461,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_2_s"] = {
        Name = "Uncommon Antenna",
        FullName = "Uncommon Antenna S",
        NqId = 1080827615,
        NqRecipeId = 1305964305,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_2_m"] = {
        Name = "Uncommon Antenna",
        FullName = "Uncommon Antenna M",
        NqId = 1080827609,
        NqRecipeId = 1305964395,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antenna_2_l"] = {
        Name = "Uncommon Antenna",
        FullName = "Uncommon Antenna L",
        NqId = 1080827590,
        NqRecipeId = 1305964392,
        GroupId = "08d8a31f-5126-439e-8376-687cf893a6aa"
    },
    ["antimattercapsule_2"] = {
        Name = "Uncommon Antimatter Capsule",
        FullName = "Uncommon Antimatter Capsule",
        NqId = 3661595539,
        NqRecipeId = 1849145537,
        GroupId = "08d8a31f-50f4-4652-84b5-e015a2be2176"
    },
    ["IndustryAssemblyM2"] = {
        Name = "Uncommon Assembly Line",
        FullName = "Uncommon Assembly Line M",
        NqId = 1762227855,
        NqRecipeId = 1275491022,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryAssemblyL2"] = {
        Name = "Uncommon Assembly Line",
        FullName = "Uncommon Assembly Line L",
        NqId = 1762226636,
        NqRecipeId = 1275490954,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryAssemblyXL2"] = {
        Name = "Uncommon Assembly Line",
        FullName = "Uncommon Assembly Line XL",
        NqId = 2480866760,
        NqRecipeId = 2127592959,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryAssemblyXS2"] = {
        Name = "Uncommon Assembly Line",
        FullName = "Uncommon Assembly Line XS",
        NqId = 2480928550,
        NqRecipeId = 2127592346,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryAssemblyS2"] = {
        Name = "Uncommon Assembly Line",
        FullName = "Uncommon Assembly Line S",
        NqId = 1762226235,
        NqRecipeId = 1275490653,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["burner_2"] = {
        Name = "Uncommon Burner",
        FullName = "Uncommon Burner",
        NqId = 2660328729,
        NqRecipeId = 1272865111,
        GroupId = "08d8a31f-50f7-42af-8cbd-a4edf5ff865c"
    },
    ["casing_2_m"] = {
        Name = "Uncommon Casing",
        FullName = "Uncommon Casing M",
        NqId = 567008209,
        NqRecipeId = 669698352,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_2_xs"] = {
        Name = "Uncommon Casing",
        FullName = "Uncommon Casing XS",
        NqId = 946516044,
        NqRecipeId = 84825112,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_2_s"] = {
        Name = "Uncommon Casing",
        FullName = "Uncommon Casing S",
        NqId = 567008215,
        NqRecipeId = 669698362,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["casing_2_xl"] = {
        Name = "Uncommon Casing",
        FullName = "Uncommon Casing XL",
        NqId = 946516085,
        NqRecipeId = 84825107,
        GroupId = "08d8a31f-515c-429d-878b-a37de74b02db"
    },
    ["chemicalcontainer_2_m"] = {
        Name = "Uncommon Chemical Container",
        FullName = "Uncommon Chemical Container M",
        NqId = 625289663,
        NqRecipeId = 1815450741,
        GroupId = "08d8a31f-5127-4f25-8138-779a7f0e5c8d"
    },
    ["IndustryChemical2"] = {
        Name = "Uncommon Chemical Industry",
        FullName = "Uncommon Chemical Industry M",
        NqId = 648743083,
        NqRecipeId = 1303072730,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["combustionchamber_2_xs"] = {
        Name = "Uncommon Combustion Chamber",
        FullName = "Uncommon Combustion Chamber XS",
        NqId = 4016359657,
        NqRecipeId = 1135194615,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_2_s"] = {
        Name = "Uncommon Combustion Chamber",
        FullName = "Uncommon Combustion Chamber S",
        NqId = 2662309888,
        NqRecipeId = 1027968263,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_2_m"] = {
        Name = "Uncommon Combustion Chamber",
        FullName = "Uncommon Combustion Chamber M",
        NqId = 2662309894,
        NqRecipeId = 1027968265,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["combustionchamber_2_l"] = {
        Name = "Uncommon Combustion Chamber",
        FullName = "Uncommon Combustion Chamber L",
        NqId = 2662309895,
        NqRecipeId = 1027968264,
        GroupId = "08d8a31f-512e-4a7b-87aa-271e024c26b5"
    },
    ["component_2"] = {
        Name = "Uncommon Component",
        FullName = "Uncommon Component",
        NqId = 794666748,
        NqRecipeId = 1319718942,
        GroupId = "08d8a31f-514e-4a1e-8d11-a8cd886bbec5"
    },
    ["connector_2"] = {
        Name = "Uncommon Connector",
        FullName = "Uncommon Connector",
        NqId = 2872711778,
        NqRecipeId = 1738589934,
        GroupId = "08d8a31f-5150-4814-89a1-12b878205d04"
    },
    ["coresystem_2_s"] = {
        Name = "Uncommon Core System",
        FullName = "Uncommon Core System S",
        NqId = 1775106620,
        NqRecipeId = 962151225,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["coresystem_2_m"] = {
        Name = "Uncommon Core System",
        FullName = "Uncommon Core System M",
        NqId = 1775106618,
        NqRecipeId = 962151231,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["coresystem_2_l"] = {
        Name = "Uncommon Core System",
        FullName = "Uncommon Core System L",
        NqId = 1775106597,
        NqRecipeId = 962151230,
        GroupId = "08d8a31f-512b-4493-8a83-3b3655131cf8"
    },
    ["electricengine_2_xl"] = {
        Name = "Uncommon Electric Engine",
        FullName = "Uncommon Electric Engine XL",
        NqId = 3172866509,
        NqRecipeId = 1278486831,
        GroupId = "08d8a31f-5130-4606-83c5-095427038994"
    },
    ["electronics_2"] = {
        Name = "Uncommon Electronics",
        FullName = "Uncommon Electronics",
        NqId = 1297540453,
        NqRecipeId = 1026118817,
        GroupId = "08d8a31f-50f8-4d6f-835c-9f32f00e2ee9"
    },
    ["IndustryElectronics2"] = {
        Name = "Uncommon Electronics Industry",
        FullName = "Uncommon Electronics Industry M",
        NqId = 2861848558,
        NqRecipeId = 1151494170,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["igniter_2"] = {
        Name = "Uncommon Explosive Module",
        FullName = "Uncommon Explosive Module",
        NqId = 2541811485,
        NqRecipeId = 21951623,
        GroupId = "08d8a31f-50fc-42c6-8d1a-6c49298010f4"
    },
    ["fixation_2"] = {
        Name = "Uncommon Fixation",
        FullName = "Uncommon Fixation",
        NqId = 466630564,
        NqRecipeId = 577252172,
        GroupId = "08d8a31f-5152-45db-8c9a-415408681c9d"
    },
    ["AtmosphericEngineMediumFreight"] = {
        Name = "Uncommon Freight Atmospheric Engine",
        FullName = "Uncommon Freight Atmospheric Engine M",
        NqId = 230429858,
        NqRecipeId = 1091891742,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineXtraSmallFreight"] = {
        Name = "Uncommon Freight Atmospheric Engine",
        FullName = "Uncommon Freight Atmospheric Engine XS",
        NqId = 3174850377,
        NqRecipeId = 1456262759,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineLargeFreight"] = {
        Name = "Uncommon Freight Atmospheric Engine",
        FullName = "Uncommon Freight Atmospheric Engine L",
        NqId = 1053170502,
        NqRecipeId = 1442706624,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineSmallFreight"] = {
        Name = "Uncommon Freight Atmospheric Engine",
        FullName = "Uncommon Freight Atmospheric Engine S",
        NqId = 1503780712,
        NqRecipeId = 1270248000,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["SpaceEngineSmallFreight"] = {
        Name = "Uncommon Freight Space Engine",
        FullName = "Uncommon Freight Space Engine S",
        NqId = 3764949976,
        NqRecipeId = 2072982392,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraLargeFreight"] = {
        Name = "Uncommon Freight Space Engine",
        FullName = "Uncommon Freight Space Engine XL",
        NqId = 130796680,
        NqRecipeId = 203702138,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineXtraSmallFreight"] = {
        Name = "Uncommon Freight Space Engine",
        FullName = "Uncommon Freight Space Engine XS",
        NqId = 16482091,
        NqRecipeId = 1831177846,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineLargeFreight"] = {
        Name = "Uncommon Freight Space Engine",
        FullName = "Uncommon Freight Space Engine L",
        NqId = 273900142,
        NqRecipeId = 355455361,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineMediumFreight"] = {
        Name = "Uncommon Freight Space Engine",
        FullName = "Uncommon Freight Space Engine M",
        NqId = 99470466,
        NqRecipeId = 1581397301,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["IndustryGlass2"] = {
        Name = "Uncommon Glass Furnace",
        FullName = "Uncommon Glass Furnace M",
        NqId = 2200747728,
        NqRecipeId = 1081167024,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryHoneycomber2"] = {
        Name = "Uncommon Honeycomb Refinery",
        FullName = "Uncommon Honeycomb Refinery M",
        NqId = 3026799987,
        NqRecipeId = 1993163113,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["hydraulics_2"] = {
        Name = "Uncommon hydraulics",
        FullName = "Uncommon hydraulics",
        NqId = 1331181118,
        NqRecipeId = 30135027,
        GroupId = "08d8a31f-50fa-4803-8ecf-b8ad089f721b"
    },
    ["injector_2"] = {
        Name = "Uncommon Injector",
        FullName = "Uncommon Injector",
        NqId = 1971447073,
        NqRecipeId = 1293038269,
        GroupId = "08d8a31f-50fd-4c12-8954-19ee8310de60"
    },
    ["ionicchamber_2_xs"] = {
        Name = "Uncommon Ionic Chamber",
        FullName = "Uncommon Ionic Chamber XS",
        NqId = 963003738,
        NqRecipeId = 650031418,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_2_l"] = {
        Name = "Uncommon Ionic Chamber",
        FullName = "Uncommon Ionic Chamber L",
        NqId = 1390563302,
        NqRecipeId = 763789004,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_2_m"] = {
        Name = "Uncommon Ionic Chamber",
        FullName = "Uncommon Ionic Chamber M",
        NqId = 1390563321,
        NqRecipeId = 763789007,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_2_s"] = {
        Name = "Uncommon Ionic Chamber",
        FullName = "Uncommon Ionic Chamber S",
        NqId = 1390563327,
        NqRecipeId = 763789013,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["ionicchamber_2_xl"] = {
        Name = "Uncommon Ionic Chamber",
        FullName = "Uncommon Ionic Chamber XL",
        NqId = 963003731,
        NqRecipeId = 650031363,
        GroupId = "08d8a31f-5134-4c0b-8562-2fe00ade0094"
    },
    ["laserchamber_2_xs"] = {
        Name = "Uncommon Laser Chamber",
        FullName = "Uncommon Laser Chamber XS",
        NqId = 1252764136,
        NqRecipeId = 6451973,
        GroupId = "08d8a31f-5136-45d8-8be5-d7705e642c54"
    },
    ["led_2"] = {
        Name = "Uncommon LED",
        FullName = "Uncommon LED",
        NqId = 1234754161,
        NqRecipeId = 1137501008,
        GroupId = "08d8a31f-5154-4334-89e3-dd6bb40b753f"
    },
    ["light_2_xs"] = {
        Name = "Uncommon Light",
        FullName = "Uncommon Light XS",
        NqId = 1829611507,
        NqRecipeId = 1316257143,
        GroupId = "08d8a31f-5138-407e-8c4a-d899f84edf71"
    },
    ["light_2_s"] = {
        Name = "Uncommon Light",
        FullName = "Uncommon Light S",
        NqId = 3345566836,
        NqRecipeId = 242801619,
        GroupId = "08d8a31f-5138-407e-8c4a-d899f84edf71"
    },
    ["magnet_2"] = {
        Name = "Uncommon Magnet",
        FullName = "Uncommon Magnet",
        NqId = 1246524879,
        NqRecipeId = 1949200609,
        GroupId = "08d8a31f-50ff-45dd-8793-4e9e09a6afd6"
    },
    ["AtmosphericEngineSmallManeuver"] = {
        Name = "Uncommon Maneuver Atmospheric Engine",
        FullName = "Uncommon Maneuver Atmospheric Engine S",
        NqId = 317861818,
        NqRecipeId = 1985802327,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineMediumManeuver"] = {
        Name = "Uncommon Maneuver Atmospheric Engine",
        FullName = "Uncommon Maneuver Atmospheric Engine M",
        NqId = 3847351355,
        NqRecipeId = 133111065,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineLargeManeuver"] = {
        Name = "Uncommon Maneuver Atmospheric Engine",
        FullName = "Uncommon Maneuver Atmospheric Engine L",
        NqId = 3475626911,
        NqRecipeId = 139883932,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineXtraSmallManeuver"] = {
        Name = "Uncommon Maneuver Atmospheric Engine",
        FullName = "Uncommon Maneuver Atmospheric Engine XS",
        NqId = 1933133404,
        NqRecipeId = 1762777322,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["SpaceEngineMediumManeuver"] = {
        Name = "Uncommon Maneuver Space Engine",
        FullName = "Uncommon Maneuver Space Engine M",
        NqId = 3024541675,
        NqRecipeId = 1100948566,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineXtraLargeManeuver"] = {
        Name = "Uncommon Maneuver Space Engine",
        FullName = "Uncommon Maneuver Space Engine XL",
        NqId = 1237158531,
        NqRecipeId = 1478712156,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineXtraSmallManeuver"] = {
        Name = "Uncommon Maneuver Space Engine",
        FullName = "Uncommon Maneuver Space Engine XS",
        NqId = 1213509759,
        NqRecipeId = 1925804245,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineLargeManeuver"] = {
        Name = "Uncommon Maneuver Space Engine",
        FullName = "Uncommon Maneuver Space Engine L",
        NqId = 613453124,
        NqRecipeId = 2051699642,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineSmallManeuver"] = {
        Name = "Uncommon Maneuver Space Engine",
        FullName = "Uncommon Maneuver Space Engine S",
        NqId = 1171610140,
        NqRecipeId = 691115170,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["IndustryMetalwork2"] = {
        Name = "Uncommon Metalwork Industry",
        FullName = "Uncommon Metalwork Industry M",
        NqId = 2808015394,
        NqRecipeId = 127106567,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["AtmosphericEngineXtraSmallMilitary"] = {
        Name = "Uncommon Military Atmospheric Engine",
        FullName = "Uncommon Military Atmospheric Engine XS",
        NqId = 676012472,
        NqRecipeId = 2702254,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineMediumMilitary"] = {
        Name = "Uncommon Military Atmospheric Engine",
        FullName = "Uncommon Military Atmospheric Engine M",
        NqId = 3295665550,
        NqRecipeId = 552799947,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineSmallMilitary"] = {
        Name = "Uncommon Military Atmospheric Engine",
        FullName = "Uncommon Military Atmospheric Engine S",
        NqId = 2203746213,
        NqRecipeId = 803761887,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["AtmosphericEngineLargeMilitary"] = {
        Name = "Uncommon Military Atmospheric Engine",
        FullName = "Uncommon Military Atmospheric Engine L",
        NqId = 2714399324,
        NqRecipeId = 1871056262,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["SpaceEngineSmallMilitary"] = {
        Name = "Uncommon Military Space Engine",
        FullName = "Uncommon Military Space Engine S",
        NqId = 529520576,
        NqRecipeId = 476530222,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineXtraLargeMilitary"] = {
        Name = "Uncommon Military Space Engine",
        FullName = "Uncommon Military Space Engine XL",
        NqId = 701947611,
        NqRecipeId = 465555949,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineMediumMilitary"] = {
        Name = "Uncommon Military Space Engine",
        FullName = "Uncommon Military Space Engine M",
        NqId = 3897078752,
        NqRecipeId = 512551791,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["SpaceEngineLargeMilitary"] = {
        Name = "Uncommon Military Space Engine",
        FullName = "Uncommon Military Space Engine L",
        NqId = 2637003463,
        NqRecipeId = 538110466,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineXtraSmallMilitary"] = {
        Name = "Uncommon Military Space Engine",
        FullName = "Uncommon Military Space Engine XS",
        NqId = 1971700279,
        NqRecipeId = 443347003,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["UncommonMiningUnitL"] = {
        Name = "Uncommon Mining Unit",
        FullName = "Uncommon Mining Unit L",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d99c57-7d0c-4e3b-8bf8-ed32a12f6af0"
    },
    ["mobilepanel_2_l"] = {
        Name = "Uncommon Mobile Panel",
        FullName = "Uncommon Mobile Panel L",
        NqId = 494821797,
        NqRecipeId = 2096240860,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_2_m"] = {
        Name = "Uncommon Mobile Panel",
        FullName = "Uncommon Mobile Panel M",
        NqId = 494821798,
        NqRecipeId = 2096240861,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_2_s"] = {
        Name = "Uncommon Mobile Panel",
        FullName = "Uncommon Mobile Panel S",
        NqId = 494821804,
        NqRecipeId = 2096240839,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_2_xl"] = {
        Name = "Uncommon Mobile Panel",
        FullName = "Uncommon Mobile Panel XL",
        NqId = 407969632,
        NqRecipeId = 84420757,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["mobilepanel_2_xs"] = {
        Name = "Uncommon Mobile Panel",
        FullName = "Uncommon Mobile Panel XS",
        NqId = 407969641,
        NqRecipeId = 84420764,
        GroupId = "08d8a31f-513d-4188-8ceb-7c22d3da86d9"
    },
    ["optics_2"] = {
        Name = "Uncommon Optics",
        FullName = "Uncommon Optics",
        NqId = 3739200050,
        NqRecipeId = 73420195,
        GroupId = "08d8a31f-5101-4014-86b8-ac0ddcd19eb2"
    },
    ["Container_2_XXL"] = {
        Name = "Uncommon Optimised Container",
        FullName = "Uncommon Optimised Container XL",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-4ff1-4b54-8484-9d05d3885b52"
    },
    ["orescanner_2_l"] = {
        Name = "Uncommon Ore Scanner",
        FullName = "Uncommon Ore Scanner L",
        NqId = 3501535518,
        NqRecipeId = 260209402,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["orescanner_2_xl"] = {
        Name = "Uncommon Ore Scanner",
        FullName = "Uncommon Ore Scanner XL",
        NqId = 788805607,
        NqRecipeId = 221554872,
        GroupId = "08d8a31f-5143-494d-8ec6-a913f3a59562"
    },
    ["pipe_2"] = {
        Name = "Uncommon Pipe",
        FullName = "Uncommon Pipe",
        NqId = 1799107247,
        NqRecipeId = 1552883209,
        GroupId = "08d8a31f-5156-4065-8e1d-13c14baf06cd"
    },
    ["powersystem_2"] = {
        Name = "Uncommon Power System",
        FullName = "Uncommon Power System",
        NqId = 527681752,
        NqRecipeId = 1458022883,
        GroupId = "08d8a31f-5102-4a00-82ae-1521925be2a3"
    },
    ["powerconvertor_2_m"] = {
        Name = "Uncommon Power Transformer",
        FullName = "Uncommon Power Transformer M",
        NqId = 4186206037,
        NqRecipeId = 1365338026,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["powerconvertor_2_s"] = {
        Name = "Uncommon Power Transformer",
        FullName = "Uncommon Power Transformer S",
        NqId = 4186206035,
        NqRecipeId = 1365338032,
        GroupId = "08d8a31f-5145-473a-84eb-dab7f5a2ba36"
    },
    ["processor_2"] = {
        Name = "Uncommon Processor",
        FullName = "Uncommon Processor",
        NqId = 3808417021,
        NqRecipeId = 1297444767,
        GroupId = "08d8a31f-5111-4aca-84b0-6fa69942144b"
    },
    ["quantumcore_2"] = {
        Name = "Uncommon Quantum Core",
        FullName = "Uncommon Quantum Core",
        NqId = 850241765,
        NqRecipeId = 1457246785,
        GroupId = "08d8a31f-5114-4794-8c3c-f3756c8d4ca9"
    },
    ["IndustryRecycler2"] = {
        Name = "Uncommon Recycler",
        FullName = "Uncommon Recycler M",
        NqId = 3264314258,
        NqRecipeId = 1952786488,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["IndustryRefiner2"] = {
        Name = "Uncommon Refiner",
        FullName = "Uncommon Refiner M",
        NqId = 584577125,
        NqRecipeId = 1597739671,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["reinforcedframe_2_l"] = {
        Name = "Uncommon Reinforced Frame",
        FullName = "Uncommon Reinforced Frame L",
        NqId = 994058140,
        NqRecipeId = 266176780,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_2_m"] = {
        Name = "Uncommon Reinforced Frame",
        FullName = "Uncommon Reinforced Frame M",
        NqId = 994058141,
        NqRecipeId = 266176771,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_2_s"] = {
        Name = "Uncommon Reinforced Frame",
        FullName = "Uncommon Reinforced Frame S",
        NqId = 994058119,
        NqRecipeId = 266176773,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_2_xl"] = {
        Name = "Uncommon Reinforced Frame",
        FullName = "Uncommon Reinforced Frame XL",
        NqId = 1179614597,
        NqRecipeId = 374123379,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["reinforcedframe_2_xs"] = {
        Name = "Uncommon Reinforced Frame",
        FullName = "Uncommon Reinforced Frame XS",
        NqId = 1179614604,
        NqRecipeId = 374123370,
        GroupId = "08d8a31f-515d-4ff2-810e-b6bac25bb3c2"
    },
    ["roboticarm_2_m"] = {
        Name = "Uncommon Robotic Arm",
        FullName = "Uncommon Robotic Arm M",
        NqId = 997368607,
        NqRecipeId = 1977298056,
        GroupId = "08d8a31f-5147-447d-8bc1-9f03865d3066"
    },
    ["AtmosphericEngineMediumSafe"] = {
        Name = "Uncommon Safe Atmospheric Engine",
        FullName = "Uncommon Safe Atmospheric Engine M",
        NqId = 260237137,
        NqRecipeId = 2104057346,
        GroupId = "08d8a31f-5028-46c8-84ef-ac054c2ddcc2"
    },
    ["AtmosphericEngineLargeSafe"] = {
        Name = "Uncommon Safe Atmospheric Engine",
        FullName = "Uncommon Safe Atmospheric Engine L",
        NqId = 2510112556,
        NqRecipeId = 1272178395,
        GroupId = "08d8a31f-5026-4cf8-876b-5b6d22a3e6ac"
    },
    ["AtmosphericEngineXtraSmallSafe"] = {
        Name = "Uncommon Safe Atmospheric Engine",
        FullName = "Uncommon Safe Atmospheric Engine XS",
        NqId = 887167900,
        NqRecipeId = 19694509,
        GroupId = "08d8a31f-502a-4bce-8729-123f6a8b8398"
    },
    ["AtmosphericEngineSmallSafe"] = {
        Name = "Uncommon Safe Atmospheric Engine",
        FullName = "Uncommon Safe Atmospheric Engine S",
        NqId = 1679964557,
        NqRecipeId = 1532451309,
        GroupId = "08d8a31f-5029-494e-8675-ef5517925c97"
    },
    ["SpaceEngineLargeSafe"] = {
        Name = "Uncommon Safe Space Engine",
        FullName = "Uncommon Safe Space Engine L",
        NqId = 892904533,
        NqRecipeId = 1343953913,
        GroupId = "08d8a31f-502e-437d-8612-b3e034e6eb2f"
    },
    ["SpaceEngineXtraLargeSafe"] = {
        Name = "Uncommon Safe Space Engine",
        FullName = "Uncommon Safe Space Engine XL",
        NqId = 3846850308,
        NqRecipeId = 1659851779,
        GroupId = "08d8a31f-5031-4c63-86fe-f3515ffe836e"
    },
    ["SpaceEngineXtraSmallSafe"] = {
        Name = "Uncommon Safe Space Engine",
        FullName = "Uncommon Safe Space Engine XS",
        NqId = 3083225012,
        NqRecipeId = 2041466895,
        GroupId = "08d8a31f-5032-4f7a-8e64-067d8330562f"
    },
    ["SpaceEngineSmallSafe"] = {
        Name = "Uncommon Safe Space Engine",
        FullName = "Uncommon Safe Space Engine S",
        NqId = 2090364569,
        NqRecipeId = 795718628,
        GroupId = "08d8a31f-5030-497a-82fa-319413cccd6f"
    },
    ["SpaceEngineMediumSafe"] = {
        Name = "Uncommon Safe Space Engine",
        FullName = "Uncommon Safe Space Engine M",
        NqId = 2489350112,
        NqRecipeId = 1647943490,
        GroupId = "08d8a31f-502f-46c4-8cf7-164b3f791b1a"
    },
    ["screen_2_l"] = {
        Name = "Uncommon Screen",
        FullName = "Uncommon Screen L",
        NqId = 184261478,
        NqRecipeId = 1609590629,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screen_2_xl"] = {
        Name = "Uncommon Screen",
        FullName = "Uncommon Screen XL",
        NqId = 1428596467,
        NqRecipeId = 1841108784,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screen_2_xs"] = {
        Name = "Uncommon Screen",
        FullName = "Uncommon Screen XS",
        NqId = 1428596474,
        NqRecipeId = 1841108793,
        GroupId = "08d8a31f-5149-41d7-8024-b1a56ed1c079"
    },
    ["screw_2"] = {
        Name = "Uncommon Screw",
        FullName = "Uncommon Screw",
        NqId = 3936127018,
        NqRecipeId = 1417946489,
        GroupId = "08d8a31f-5157-4dcc-8d91-4ff49c7b7779"
    },
    ["singularitycontainer_2"] = {
        Name = "Uncommon Singularity Container",
        FullName = "Uncommon Singularity Container",
        NqId = 3640212313,
        NqRecipeId = 1213600947,
        GroupId = "08d8a31f-5116-4472-84d8-1cf2de11b3a3"
    },
    ["IndustrySmelter2"] = {
        Name = "Uncommon Smelter",
        FullName = "Uncommon Smelter M",
        NqId = 1132446360,
        NqRecipeId = 1137084674,
        GroupId = "08d8a31f-4ff6-4710-88a4-bec39d33f9ff"
    },
    ["warhead_2"] = {
        Name = "Uncommon Solid Warhead",
        FullName = "Uncommon Solid Warhead",
        NqId = 2599686738,
        NqRecipeId = 1467453995,
        GroupId = "08d8a31f-5118-4af9-8fa6-99c7635be381"
    },
    ["standardframe_2_xs"] = {
        Name = "Uncommon Standard Frame",
        FullName = "Uncommon Standard Frame XS",
        NqId = 873676070,
        NqRecipeId = 499386362,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_2_l"] = {
        Name = "Uncommon Standard Frame",
        FullName = "Uncommon Standard Frame L",
        NqId = 1981362539,
        NqRecipeId = 461676500,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_2_m"] = {
        Name = "Uncommon Standard Frame",
        FullName = "Uncommon Standard Frame M",
        NqId = 1981362536,
        NqRecipeId = 461676501,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["standardframe_2_s"] = {
        Name = "Uncommon Standard Frame",
        FullName = "Uncommon Standard Frame S",
        NqId = 1981362450,
        NqRecipeId = 461676511,
        GroupId = "08d8a31f-515f-4d26-8af3-519519a84f23"
    },
    ["StructuralPart2"] = {
        Name = "Uncommon Structural Parts",
        FullName = "Uncommon Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5159-4bb2-877d-6d69aec28495"
    },
    ["FunctionalPart2"] = {
        Name = "Uncommon Structural Parts",
        FullName = "Uncommon Structural Parts",
        NqId = nil,
        NqRecipeId = nil,
        GroupId = "08d8a31f-5124-4830-8c0e-147fd07bdd38"
    },
    ["Urinal_S01"] = {
        Name = "Urinal unit",
        FullName = "Urinal unit",
        NqId = 3517217013,
        NqRecipeId = 593178387,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["VanadiumOre"] = {
        Name = "Vanadinite",
        FullName = "Vanadinite",
        NqId = 2162350405,
        NqRecipeId = nil,
        GroupId = "08d8a31f-50c3-4814-875e-27353e233d6c"
    },
    ["VanadiumPure"] = {
        Name = "Vanadium pure",
        FullName = "Vanadium pure",
        NqId = 2007627267,
        NqRecipeId = 1975865669,
        GroupId = "08d8a31f-50d7-4fed-8282-3dbc9d7cd0c4"
    },
    ["VanadiumScrap"] = {
        Name = "Vanadium Scrap",
        FullName = "Vanadium Scrap",
        NqId = 3307634000,
        NqRecipeId = 804612304,
        GroupId = "08d8a31f-4f37-4592-8af0-385eb1f61fa7"
    },
    ["VanamerProduct"] = {
        Name = "Vanamer product",
        FullName = "Vanamer product",
        NqId = 255776324,
        NqRecipeId = 2005886948,
        GroupId = "08d8a31f-50cf-4f4a-8753-1a02f4b4c1fb"
    },
    ["AtmosphericVerticalBoosterMedium"] = {
        Name = "Vertical Booster",
        FullName = "Vertical Booster M",
        NqId = 913372512,
        NqRecipeId = 873525935,
        GroupId = "08d8a31f-5036-4914-8e4d-6fd4f5a1d624"
    },
    ["AtmosphericVerticalBoosterXtraSmall"] = {
        Name = "Vertical Booster",
        FullName = "Vertical Booster XS",
        NqId = 3775402879,
        NqRecipeId = 346496113,
        GroupId = "08d8a31f-5036-4914-8e4d-6fd4f5a1d624"
    },
    ["AtmosphericVerticalBoosterSmall"] = {
        Name = "Vertical Booster",
        FullName = "Vertical Booster S",
        NqId = 3556600005,
        NqRecipeId = 22193376,
        GroupId = "08d8a31f-5036-4914-8e4d-6fd4f5a1d624"
    },
    ["AtmosphericVerticalBoosterLarge"] = {
        Name = "Vertical Booster",
        FullName = "Vertical Booster L",
        NqId = 2216363013,
        NqRecipeId = 519895957,
        GroupId = "08d8a31f-5036-4914-8e4d-6fd4f5a1d624"
    },
    ["LightVerticalXsmall"] = {
        Name = "Vertical Light",
        FullName = "Vertical Light XS",
        NqId = 3923388834,
        NqRecipeId = 1383063781,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightVerticalMedium"] = {
        Name = "Vertical Light",
        FullName = "Vertical Light M",
        NqId = 1603266808,
        NqRecipeId = 164219412,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightVerticalSmall"] = {
        Name = "Vertical Light",
        FullName = "Vertical Light S",
        NqId = 3231255047,
        NqRecipeId = 555932566,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["LightVerticalLarge"] = {
        Name = "Vertical Light",
        FullName = "Vertical Light L",
        NqId = 2027152926,
        NqRecipeId = 1601756570,
        GroupId = "08d8a31f-4fc7-434b-83b1-04a5ac206c0b"
    },
    ["ScreenSignVXSmall"] = {
        Name = "Vertical Sign",
        FullName = "Vertical Sign XS",
        NqId = 3919696834,
        NqRecipeId = 1796279421,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["ScreenSignVMedium"] = {
        Name = "Vertical Sign",
        FullName = "Vertical Sign M",
        NqId = 2610895147,
        NqRecipeId = 1080478000,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["ScreenSignVLarge"] = {
        Name = "Vertical Sign",
        FullName = "Vertical Sign L",
        NqId = 1533790308,
        NqRecipeId = 446356542,
        GroupId = "08d8a31f-4fa7-4a95-8759-793bfdda81e9"
    },
    ["Adjunct_05"] = {
        Name = "Vertical wing",
        FullName = "Vertical wing",
        NqId = 1894947006,
        NqRecipeId = 314976179,
        GroupId = "08d8a31f-4f99-4d0e-8eef-88178c97ce38"
    },
    ["VirtualProjector"] = {
        Name = "Virtual scaffolding projector",
        FullName = "Virtual scaffolding projector",
        NqId = 3929462194,
        NqRecipeId = 921860876,
        GroupId = "08d8a31f-4fc6-441f-8fda-728b9f013d98"
    },
    ["Wardrobe"] = {
        Name = "Wardrobe",
        FullName = "Wardrobe",
        NqId = 2428627426,
        NqRecipeId = 260303330,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["WarpBeacon"] = {
        Name = "Warp Beacon",
        FullName = "Warp Beacon XL",
        NqId = 2468029849,
        NqRecipeId = 746489241,
        GroupId = "08d8a31f-503c-41b5-8d52-98f65ecccb0a"
    },
    ["WarpCellStandard"] = {
        Name = "Warp Cell",
        FullName = "Warp Cell",
        NqId = 1339253011,
        NqRecipeId = 139723769,
        GroupId = "08d8a31f-4f39-44dd-84f0-9416646e3af8"
    },
    ["WarpDrive"] = {
        Name = "Warp Drive",
        FullName = "Warp Drive L",
        NqId = 2643443936,
        NqRecipeId = 1074872544,
        GroupId = "08d8a31f-503d-454a-8817-6831d3fcec83"
    },
    ["BrickBrightHCBrick01D"] = {
        Name = "Waxed aged brick 1",
        FullName = "Waxed aged brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick02D"] = {
        Name = "Waxed aged brick 2",
        FullName = "Waxed aged brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick03D"] = {
        Name = "Waxed aged brick 3",
        FullName = "Waxed aged brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick04D"] = {
        Name = "Waxed aged brick 4",
        FullName = "Waxed aged brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBlack"] = {
        Name = "Waxed black brick",
        FullName = "Waxed black brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["ConcreteBrightHCBlack"] = {
        Name = "Waxed black concrete",
        FullName = "Waxed black concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["BrickBrightHCBrick01"] = {
        Name = "Waxed brick 1",
        FullName = "Waxed brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick02"] = {
        Name = "Waxed brick 2",
        FullName = "Waxed brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick03"] = {
        Name = "Waxed brick 3",
        FullName = "Waxed brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick04"] = {
        Name = "Waxed brick 4",
        FullName = "Waxed brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCGrayD"] = {
        Name = "Waxed dark gray brick",
        FullName = "Waxed dark gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["ConcreteBrightHCGrayD"] = {
        Name = "Waxed dark gray concrete",
        FullName = "Waxed dark gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["BrickBrightHCGray"] = {
        Name = "Waxed gray brick",
        FullName = "Waxed gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["ConcreteBrightHCGray"] = {
        Name = "Waxed gray concrete",
        FullName = "Waxed gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["BrickBrightHCGrayL"] = {
        Name = "Waxed light gray brick",
        FullName = "Waxed light gray brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["ConcreteBrightHCGrayL"] = {
        Name = "Waxed light gray concrete",
        FullName = "Waxed light gray concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["BrickBrightHCBrick01L"] = {
        Name = "Waxed stained brick 1",
        FullName = "Waxed stained brick 1",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick02L"] = {
        Name = "Waxed stained brick 2",
        FullName = "Waxed stained brick 2",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick03L"] = {
        Name = "Waxed stained brick 3",
        FullName = "Waxed stained brick 3",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCBrick04L"] = {
        Name = "Waxed stained brick 4",
        FullName = "Waxed stained brick 4",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["BrickBrightHCWhite"] = {
        Name = "Waxed white brick",
        FullName = "Waxed white brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["ConcreteBrightHCWhite"] = {
        Name = "Waxed white concrete",
        FullName = "Waxed white concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["hcAlLiPanelWhite"] = {
        Name = "White Al-Li Panel",
        FullName = "White Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelWhite"] = {
        Name = "White Aluminium Panel",
        FullName = "White Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["AluminiumTileHCWhite"] = {
        Name = "White aluminium pattern",
        FullName = "White aluminium pattern",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelWhite"] = {
        Name = "White Calcium Panel",
        FullName = "White Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelWhite"] = {
        Name = "White Carbon Panel",
        FullName = "White Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelWhite"] = {
        Name = "White Chromium Panel",
        FullName = "White Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelWhite"] = {
        Name = "White Cobalt Panel",
        FullName = "White Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelWhite"] = {
        Name = "White Copper Panel",
        FullName = "White Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelWhite"] = {
        Name = "White Duralumin Panel",
        FullName = "White Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelWhite"] = {
        Name = "White Fluorine Panel",
        FullName = "White Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelWhite"] = {
        Name = "White Gold Panel",
        FullName = "White Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelWhite"] = {
        Name = "White Grade 5 Titanium Alloy Panel",
        FullName = "White Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelWhite"] = {
        Name = "White Inconel Panel",
        FullName = "White Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelWhite"] = {
        Name = "White Iron Panel",
        FullName = "White Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelWhite"] = {
        Name = "White Lithium Panel",
        FullName = "White Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelWhite"] = {
        Name = "White Mangalloy Panel",
        FullName = "White Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelWhite"] = {
        Name = "White Manganese Panel",
        FullName = "White Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelWhite"] = {
        Name = "White Maraging Steel Panel",
        FullName = "White Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelWhite"] = {
        Name = "White Nickel Panel",
        FullName = "White Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelWhite"] = {
        Name = "White Niobium Panel",
        FullName = "White Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["BrickTileHCWhite"] = {
        Name = "White pattern brick",
        FullName = "White pattern brick",
        NqId = 2698580432,
        NqRecipeId = 1714299543,
        GroupId = "08d8a31f-507e-4bd1-8287-fec7944187fe"
    },
    ["CarbonfiberTileHCWhite"] = {
        Name = "White pattern carbon fiber",
        FullName = "White pattern carbon fiber",
        NqId = 2647328640,
        NqRecipeId = 1692986150,
        GroupId = "08d8a31f-5081-44f6-82af-c202afcc8ea1"
    },
    ["ChromiumTileHCWhite"] = {
        Name = "White pattern Chromium",
        FullName = "White pattern Chromium",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["ConcreteTileHCWhite"] = {
        Name = "White pattern concrete",
        FullName = "White pattern concrete",
        NqId = 38264863,
        NqRecipeId = 1721513624,
        GroupId = "08d8a31f-5083-478e-88ef-c4aa4228c187"
    },
    ["CopperTileHCWhite"] = {
        Name = "White pattern Copper",
        FullName = "White pattern Copper",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["GoldTileHCWhite"] = {
        Name = "White pattern Gold",
        FullName = "White pattern Gold",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["IronTileHCWhite"] = {
        Name = "White pattern iron",
        FullName = "White pattern iron",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["MarbleTileHCWhite"] = {
        Name = "White pattern marble",
        FullName = "White pattern marble",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCWhite"] = {
        Name = "White pattern plastic",
        FullName = "White pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCWhite"] = {
        Name = "White pattern steel",
        FullName = "White pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["TitaniumTileHCWhite"] = {
        Name = "White pattern Titanium",
        FullName = "White pattern Titanium",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["WoodTileHCWhite"] = {
        Name = "White pattern wood",
        FullName = "White pattern wood",
        NqId = 2497146600,
        NqRecipeId = 1278712500,
        GroupId = "08d8a31f-5095-419f-8069-8bc35396fd52"
    },
    ["hcScAlPanelWhite"] = {
        Name = "White Sc-Al Panel",
        FullName = "White Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelWhite"] = {
        Name = "White Scandium Panel",
        FullName = "White Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelWhite"] = {
        Name = "White Silicon Panel",
        FullName = "White Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelWhite"] = {
        Name = "White Silumin Panel",
        FullName = "White Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelWhite"] = {
        Name = "White Silver Panel",
        FullName = "White Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelWhite"] = {
        Name = "White Sodium Panel",
        FullName = "White Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelWhite"] = {
        Name = "White Stainless Steel Panel",
        FullName = "White Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelWhite"] = {
        Name = "White Steel Panel",
        FullName = "White Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelWhite"] = {
        Name = "White Sulfur Panel",
        FullName = "White Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelWhite"] = {
        Name = "White Titanium Panel",
        FullName = "White Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelWhite"] = {
        Name = "White Vanadium Panel",
        FullName = "White Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    },
    ["WindowMedium"] = {
        Name = "Window",
        FullName = "Window M",
        NqId = 3924941627,
        NqRecipeId = 937065787,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowXSmall"] = {
        Name = "Window",
        FullName = "Window XS",
        NqId = 3268459843,
        NqRecipeId = 65326915,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowSmall"] = {
        Name = "Window",
        FullName = "Window S",
        NqId = 242448402,
        NqRecipeId = 131821586,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WindowLarge"] = {
        Name = "Window",
        FullName = "Window L",
        NqId = 894516284,
        NqRecipeId = 1705948220,
        GroupId = "08d8a31f-4fa4-48cb-8e8f-7a543b512cfd"
    },
    ["WingMedium2"] = {
        Name = "Wing",
        FullName = "Wing M",
        NqId = 404188468,
        NqRecipeId = 1123820852,
        GroupId = "08d8a31f-500a-4787-8b0b-d888db56f8b4"
    },
    ["WingXtraSmall2"] = {
        Name = "Wing",
        FullName = "Wing XS",
        NqId = 1727614690,
        NqRecipeId = 422654402,
        GroupId = "08d8a31f-500a-4787-8b0b-d888db56f8b4"
    },
    ["WingSmall2"] = {
        Name = "Wing",
        FullName = "Wing S",
        NqId = 2532454166,
        NqRecipeId = 1495731990,
        GroupId = "08d8a31f-500a-4787-8b0b-d888db56f8b4"
    },
    ["WingMedium2Bis"] = {
        Name = "Wing variant",
        FullName = "Wing variant M",
        NqId = 4179758576,
        NqRecipeId = 1756752144,
        GroupId = "08d8a31f-500a-4787-8b0b-d888db56f8b4"
    },
    ["AdjunctTipLarge"] = {
        Name = "Wingtip",
        FullName = "Wingtip L",
        NqId = 3292462663,
        NqRecipeId = 1173080671,
        GroupId = "08d8a31f-4f99-4d0e-8eef-88178c97ce38"
    },
    ["AdjunctTipMedium"] = {
        Name = "Wingtip",
        FullName = "Wingtip M",
        NqId = 3695530525,
        NqRecipeId = 1539585391,
        GroupId = "08d8a31f-4f99-4d0e-8eef-88178c97ce38"
    },
    ["AdjunctTipSmall"] = {
        Name = "Wingtip",
        FullName = "Wingtip S",
        NqId = 2429336341,
        NqRecipeId = 2057474365,
        GroupId = "08d8a31f-4f99-4d0e-8eef-88178c97ce38"
    },
    ["WoodProduct"] = {
        Name = "Wood product",
        FullName = "Wood product",
        NqId = 770773323,
        NqRecipeId = 913275211,
        GroupId = "08d8a31f-50c8-433c-8fc4-bd29e5fb62fd"
    },
    ["Club_S01"] = {
        Name = "Wooden armchair",
        FullName = "Wooden armchair",
        NqId = 3736537839,
        NqRecipeId = 2005259744,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["Chair_S01"] = {
        Name = "Wooden Chair",
        FullName = "Wooden Chair",
        NqId = 2453312794,
        NqRecipeId = 286133333,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["Dresser_S01"] = {
        Name = "Wooden dresser",
        FullName = "Wooden dresser",
        NqId = 3824401006,
        NqRecipeId = 1818960816,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["EndTable_S01"] = {
        Name = "Wooden low table",
        FullName = "Wooden low table",
        NqId = 1082668972,
        NqRecipeId = 1257831903,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Sofa_S01"] = {
        Name = "Wooden Sofa",
        FullName = "Wooden Sofa",
        NqId = 2018455538,
        NqRecipeId = 736234246,
        GroupId = "08d8a31f-4fc9-4282-81f3-ce98674eaf49"
    },
    ["TableBig_S01"] = {
        Name = "Wooden table",
        FullName = "Wooden table L",
        NqId = 3893102542,
        NqRecipeId = 769062638,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Table_S01"] = {
        Name = "Wooden table",
        FullName = "Wooden table M",
        NqId = 3845900543,
        NqRecipeId = 1213066844,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Wardrobe_S01"] = {
        Name = "Wooden wardrobe",
        FullName = "Wooden wardrobe",
        NqId = 1268259677,
        NqRecipeId = 1366545538,
        GroupId = "08d8a31f-4fa0-4031-8610-5748ebedb58d"
    },
    ["Xeron"] = {
        Name = "Xeron Fuel",
        FullName = "Xeron Fuel",
        NqId = 106455050,
        NqRecipeId = 400056330,
        GroupId = "08d8a31f-504f-410a-8e74-9c4fba1be4c4"
    },
    ["XorOperator"] = {
        Name = "XOR Operator",
        FullName = "XOR Operator",
        NqId = 3437395596,
        NqRecipeId = 827922060,
        GroupId = "08d8a31f-4fb5-490d-89b2-c029f378145a"
    },
    ["AluminiumTileHCGray"] = {
        Name = "Y aluminium pattern",
        FullName = "Y aluminium pattern",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcAlLiPanelYellow"] = {
        Name = "Yellow Al-Li Panel",
        FullName = "Yellow Al-Li Panel",
        NqId = 2906228118,
        NqRecipeId = 44817614,
        GroupId = "08d8a31f-5054-4304-88dc-9c0b30d307c6"
    },
    ["hcAluminiumPanelYellow"] = {
        Name = "Yellow Aluminium Panel",
        FullName = "Yellow Aluminium Panel",
        NqId = 123493466,
        NqRecipeId = 1698114143,
        GroupId = "08d8a31f-5098-4208-8a38-a4974fee57f0"
    },
    ["hcCalciumPanelYellow"] = {
        Name = "Yellow Calcium Panel",
        FullName = "Yellow Calcium Panel",
        NqId = 3628423708,
        NqRecipeId = 929514076,
        GroupId = "08d8a31f-5099-4af5-88fc-ee7f917755db"
    },
    ["hcCarbonPanelYellow"] = {
        Name = "Yellow Carbon Panel",
        FullName = "Yellow Carbon Panel",
        NqId = 1063775897,
        NqRecipeId = 1673982342,
        GroupId = "08d8a31f-509b-4812-89d4-6e808696ab64"
    },
    ["hcChromiumPanelYellow"] = {
        Name = "Yellow Chromium Panel",
        FullName = "Yellow Chromium Panel",
        NqId = 1406093224,
        NqRecipeId = 1752906355,
        GroupId = "08d8a31f-509c-4fbf-862f-a71ad0c5771d"
    },
    ["hcCobaltPanelYellow"] = {
        Name = "Yellow Cobalt Panel",
        FullName = "Yellow Cobalt Panel",
        NqId = 3292873120,
        NqRecipeId = 1766863394,
        GroupId = "08d8a31f-509e-4607-8ef7-b0892757d11e"
    },
    ["hcCopperPanelYellow"] = {
        Name = "Yellow Copper Panel",
        FullName = "Yellow Copper Panel",
        NqId = 1374916603,
        NqRecipeId = 1720896054,
        GroupId = "08d8a31f-509f-4ce5-8a0f-d62ee899e1ba"
    },
    ["hcDuraluminPanelYellow"] = {
        Name = "Yellow Duralumin Panel",
        FullName = "Yellow Duralumin Panel",
        NqId = 1993502154,
        NqRecipeId = 62970751,
        GroupId = "08d8a31f-5084-4d14-8626-48fdf1c69fbc"
    },
    ["hcFluorinePanelYellow"] = {
        Name = "Yellow Fluorine Panel",
        FullName = "Yellow Fluorine Panel",
        NqId = 1440099000,
        NqRecipeId = 939662339,
        GroupId = "08d8a31f-50a1-4d07-8cac-49bca0545a6b"
    },
    ["hcGoldPanelYellow"] = {
        Name = "Yellow Gold Panel",
        FullName = "Yellow Gold Panel",
        NqId = 2892111312,
        NqRecipeId = 1675027604,
        GroupId = "08d8a31f-50a3-43b2-8ab9-7264119d683a"
    },
    ["hcGrade5TitaniumAlloyPanelYellow"] = {
        Name = "Yellow Grade 5 Titanium Alloy Panel",
        FullName = "Yellow Grade 5 Titanium Alloy Panel",
        NqId = 483425306,
        NqRecipeId = 218698870,
        GroupId = "08d8a31f-5087-460d-812c-ae1d0b8b1353"
    },
    ["hcInconelPanelYellow"] = {
        Name = "Yellow Inconel Panel",
        FullName = "Yellow Inconel Panel",
        NqId = 1972837708,
        NqRecipeId = 5686521,
        GroupId = "08d8a31f-5088-4afc-87d6-cbb33c0e1e92"
    },
    ["hcIronPanelYellow"] = {
        Name = "Yellow Iron Panel",
        FullName = "Yellow Iron Panel",
        NqId = 2085561075,
        NqRecipeId = 1704193062,
        GroupId = "08d8a31f-50a4-4a50-8a79-9f087399ede1"
    },
    ["hcLithiumPanelYellow"] = {
        Name = "Yellow Lithium Panel",
        FullName = "Yellow Lithium Panel",
        NqId = 1987555115,
        NqRecipeId = 1724798447,
        GroupId = "08d8a31f-50a6-4f2f-8e07-442ba73f248e"
    },
    ["hcMangalloyPanelYellow"] = {
        Name = "Yellow Mangalloy Panel",
        FullName = "Yellow Mangalloy Panel",
        NqId = 3573936284,
        NqRecipeId = 3432870,
        GroupId = "08d8a31f-5089-4fc9-85c8-097818df9297"
    },
    ["hcManganesePanelYellow"] = {
        Name = "Yellow Manganese Panel",
        FullName = "Yellow Manganese Panel",
        NqId = 3522164802,
        NqRecipeId = 1728411646,
        GroupId = "08d8a31f-50a8-4b83-8c12-747a90d02e08"
    },
    ["hcMaragingSteelPanelYellow"] = {
        Name = "Yellow Maraging Steel Panel",
        FullName = "Yellow Maraging Steel Panel",
        NqId = 734351314,
        NqRecipeId = 78226245,
        GroupId = "08d8a31f-508b-45dd-8641-9a8c0f9ffdba"
    },
    ["hcNickelPanelYellow"] = {
        Name = "Yellow Nickel Panel",
        FullName = "Yellow Nickel Panel",
        NqId = 1194276464,
        NqRecipeId = 1771946607,
        GroupId = "08d8a31f-50aa-48eb-8295-f9b51642614c"
    },
    ["hcNiobiumPanelYellow"] = {
        Name = "Yellow Niobium Panel",
        FullName = "Yellow Niobium Panel",
        NqId = 30546913,
        NqRecipeId = 1704862467,
        GroupId = "08d8a31f-50ad-431f-8fff-673d92ffb64e"
    },
    ["MarbleTileHCYellowCold"] = {
        Name = "Yellow pattern marble (cold)",
        FullName = "Yellow pattern marble (cold)",
        NqId = 2003621933,
        NqRecipeId = 1712512096,
        GroupId = "08d8a31f-508c-4b98-8989-cc189b36e09c"
    },
    ["PlasticTileHCYellow"] = {
        Name = "Yellow pattern plastic",
        FullName = "Yellow pattern plastic",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["PlasticTileHCYellowCold"] = {
        Name = "Yellow pattern plastic (cold)",
        FullName = "Yellow pattern plastic (cold)",
        NqId = 1269767483,
        NqRecipeId = 927965841,
        GroupId = "08d8a31f-508e-41db-8c89-308e391f5508"
    },
    ["SteelTileHCYellow"] = {
        Name = "Yellow pattern steel",
        FullName = "Yellow pattern steel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcScAlPanelYellow"] = {
        Name = "Yellow Sc-Al Panel",
        FullName = "Yellow Sc-Al Panel",
        NqId = 1160705623,
        NqRecipeId = 54581625,
        GroupId = "08d8a31f-508f-4792-894f-90a309ecab0a"
    },
    ["hcScandiumPanelYellow"] = {
        Name = "Yellow Scandium Panel",
        FullName = "Yellow Scandium Panel",
        NqId = 2980173742,
        NqRecipeId = 1769949684,
        GroupId = "08d8a31f-50ae-4b02-80d0-2765892ff5b6"
    },
    ["hcSiliconPanelYellow"] = {
        Name = "Yellow Silicon Panel",
        FullName = "Yellow Silicon Panel",
        NqId = 4079996329,
        NqRecipeId = 1005037286,
        GroupId = "08d8a31f-50b0-41c8-88cb-81debdcc6876"
    },
    ["hcSiluminPanelYellow"] = {
        Name = "Yellow Silumin Panel",
        FullName = "Yellow Silumin Panel",
        NqId = 3134890135,
        NqRecipeId = 91293884,
        GroupId = "08d8a31f-5090-4cd1-8071-25910d682a05"
    },
    ["hcSilverPanelYellow"] = {
        Name = "Yellow Silver Panel",
        FullName = "Yellow Silver Panel",
        NqId = 3760652609,
        NqRecipeId = 1036689771,
        GroupId = "08d8a31f-50b1-487a-8a5c-b708db72f375"
    },
    ["hcSodiumPanelYellow"] = {
        Name = "Yellow Sodium Panel",
        FullName = "Yellow Sodium Panel",
        NqId = 2013004922,
        NqRecipeId = 1012690831,
        GroupId = "08d8a31f-50b2-4f9d-8854-97d19f4fe962"
    },
    ["hcStainlessSteelPanelYellow"] = {
        Name = "Yellow Stainless Steel Panel",
        FullName = "Yellow Stainless Steel Panel",
        NqId = 3200326100,
        NqRecipeId = 29342962,
        GroupId = "08d8a31f-5092-4371-88ac-bb750bf10077"
    },
    ["hcSteelPanelYellow"] = {
        Name = "Yellow Steel Panel",
        FullName = "Yellow Steel Panel",
        NqId = 2814304696,
        NqRecipeId = 1696982192,
        GroupId = "08d8a31f-5093-4a63-8094-82f837fb04f3"
    },
    ["hcSulfurPanelYellow"] = {
        Name = "Yellow Sulfur Panel",
        FullName = "Yellow Sulfur Panel",
        NqId = 1519873395,
        NqRecipeId = 1770132739,
        GroupId = "08d8a31f-50b4-4f15-82ae-7ffee02ce10f"
    },
    ["hcTitaniumPanelYellow"] = {
        Name = "Yellow Titanium Panel",
        FullName = "Yellow Titanium Panel",
        NqId = 402511494,
        NqRecipeId = 1764735950,
        GroupId = "08d8a31f-50b6-489c-841d-40519fb50833"
    },
    ["hcVanadiumPanelYellow"] = {
        Name = "Yellow Vanadium Panel",
        FullName = "Yellow Vanadium Panel",
        NqId = 1605580774,
        NqRecipeId = 1680449001,
        GroupId = "08d8a31f-50b7-4f72-8dbc-cf836c4c930c"
    }
}

return allItems