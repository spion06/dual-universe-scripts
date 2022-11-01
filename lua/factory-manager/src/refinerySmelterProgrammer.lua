local factoryUtils = require 'factoryUtils'
--

-- intended to program refineries and smelters currently

local script = {}
script.refinerMappings = {
    [198782496] = {
        createTime = 225,
        id = 198782496,
        industry = "Refiner M",
        inputs = {
          [4234772167] = 585
        },
        itemLong = "Pure Iron",
        itemShort = "IronPure",
        producedQty = 405,
        type = "Pure"
      },
      [1466453887] = {
        createTime = 125,
        id = 1466453887,
        industry = "Refiner M",
        inputs = {
          [2289641763] = 65
        },
        itemLong = "Pure Copper",
        itemShort = "CopperPure",
        producedQty = 45,
        type = "Pure"
      },
      [3603734543] = {
        createTime = 125,
        id = 3603734543,
        industry = "Refiner M",
        inputs = {
          [343766315] = 65
        },
        itemLong = "Pure Sodium",
        itemShort = "SodiumPure",
        producedQty = 45,
        type = "Pure"
      },
      [2589986891] = {
        createTime = 225,
        id = 2589986891,
        industry = "Refiner M",
        inputs = {
          [3724036288] = 585
        },
        itemLong = "Pure Silicon",
        itemShort = "SiliconPure",
        producedQty = 405,
        type = "Pure"
      },
      [159858782] = {
        createTime = 225,
        id = 159858782,
        industry = "Refiner M",
        inputs = {
          [299255727] = 585
        },
        itemLong = "Pure carbon",
        itemShort = "CarbonPure",
        producedQty = 405,
        type = "Pure"
      },
      [3810111622] = {
        createTime = 625,
        id = 3810111622,
        industry = "Refiner M",
        inputs = {
          [3837858336] = 65
        },
        itemLong = "Pure lithium",
        itemShort = "LithiumPure",
        producedQty = 45,
        type = "Pure"
      },
      [2031444137] = {
        createTime = 3125,
        id = 2031444137,
        industry = "Refiner M",
        inputs = {
          [3546085401] = 65
        },
        itemLong = "Pure Cobalt",
        itemShort = "CobaltPure",
        producedQty = 45,
        type = "Pure"
      },
      [2421303625] = {
        createTime = 15600,
        id = 2421303625,
        industry = "Refiner M",
        inputs = {
          [3934774987] = 65
        },
        itemLong = "Pure manganese",
        itemShort = "ManganesePure",
        producedQty = 45,
        type = "Pure"
      },
      [752542080] = {
        createTime = 15600,
        id = 752542080,
        industry = "Refiner M",
        inputs = {
          [629636034] = 65
        },
        itemLong = "Pure Titanium",
        itemShort = "TitaniumPure",
        producedQty = 45,
        type = "Pure"
      },
      [3822811562] = {
        createTime = 625,
        id = 3822811562,
        industry = "Refiner M",
        inputs = {
          [4041459743] = 65
        },
        itemLong = "Pure Sulfur",
        itemShort = "SulfurPure",
        producedQty = 45,
        type = "Pure"
      },
      [3323724376] = {
        createTime = 3125,
        id = 3323724376,
        industry = "Refiner M",
        inputs = {
          [1467310917] = 65
        },
        itemLong = "Pure Fluorine",
        itemShort = "FluorinePure",
        producedQty = 45,
        type = "Pure"
      },
      [1807690770] = {
        createTime = 625,
        id = 1807690770,
        industry = "Refiner M",
        inputs = {
          [1050500112] = 65
        },
        itemLong = "Silver Pure",
        itemShort = "SilverPure",
        producedQty = 45,
        type = "Pure"
      },
      [3837955371] = {
        createTime = 3125,
        id = 3837955371,
        industry = "Refiner M",
        inputs = {
          [1866812055] = 65
        },
        itemLong = "Pure Gold",
        itemShort = "GoldPure",
        producedQty = 45,
        type = "Pure"
      },
      [2007627267] = {
        createTime = 15600,
        id = 2007627267,
        industry = "Refiner M",
        inputs = {
          [2162350405] = 65
        },
        itemLong = "Vanadium pure",
        itemShort = "VanadiumPure",
        producedQty = 45,
        type = "Pure"
      },
      [3211418846] = {
        createTime = 3125,
        id = 3211418846,
        industry = "Refiner M",
        inputs = {
          [271971371] = 65
        },
        itemLong = "Pure Scandium",
        itemShort = "ScandiumPure",
        producedQty = 45,
        type = "Pure"
      },
      [3012303017] = {
        createTime = 625,
        id = 3012303017,
        industry = "Refiner M",
        inputs = {
          [1065079614] = 65
        },
        itemLong = "Nickel pure",
        itemShort = "NickelPure",
        producedQty = 45,
        type = "Pure"
      },
      [2240749601] = {
        createTime = 225,
        id = 2240749601,
        industry = "Refiner M",
        inputs = {
          [262147665] = 585
        },
        itemLong = "Pure aluminium",
        itemShort = "AluminiumPure",
        producedQty = 405,
        type = "Pure"
      },
      [2112763718] = {
        createTime = 125,
        id = 2112763718,
        industry = "Refiner M",
        inputs = {
          [3086347393] = 65
        },
        itemLong = "Pure Calcium",
        itemShort = "CalciumPure",
        producedQty = 45,
        type = "Pure"
      },
      [2147954574] = {
        createTime = 125,
        id = 2147954574,
        industry = "Refiner M",
        inputs = {
          [2029139010] = 65
        },
        itemLong = "Pure Chromium",
        itemShort = "ChromiumPure",
        producedQty = 45,
        type = "Pure"
      },
      [1126600143] = {
        createTime = 15600,
        id = 1126600143,
        industry = "Refiner M",
        inputs = {
          [789110817] = 65
        },
        itemLong = "Niobium pure",
        itemShort = "NiobiumPure",
        producedQty = 45,
        type = "Pure"
      }
}

