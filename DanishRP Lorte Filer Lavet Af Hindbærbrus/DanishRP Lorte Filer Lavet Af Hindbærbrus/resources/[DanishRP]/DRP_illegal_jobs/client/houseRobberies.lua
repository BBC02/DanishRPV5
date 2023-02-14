-- local jobName = "houseRobbery"

-- local houseID = 0
-- local hasTask = false
-- local shellUsed
-- local safe

-- local myRobbableItems = {}
-- local isRobbing = false
-- local safespawned = false
-- local safeRobbed = false
-- local PoliceAlerted = false

-- local robberyped = nil
-- local robberydog = nil
-- local isPedSpawned = false
-- local isDogSpawned = false
-- local isAgro = false
-- local disturbance = 0
-- local Time = 0

-- local robbableHouses = {
--     [1] = {x = 1061.04, y = -378.610, z = 68.24, shell = 2},
--     [2] = {x = 1028.87, y = -408.29, z = 66.33, shell = 2},
--     [3] = {x = 1010.49, y = -423.54, z = 65.34, shell = 2},
--     [4] = {x = 987.49, y = -432.99, z = 64.02, shell = 2},
--     [5] = {x = 967.04, y = -451.65, z = 62.79, shell = 2},
--     [6] = {x = 944.51, y = -463.29, z = 61.55, shell = 2},
--     [7] = {x = 921.88, y = -477.82, z = 61.08, shell = 2},
--     [8] = {x = 906.28, y = -489.4, z = 59.43, shell = 2},
--     [9] = {x = 878.39, y = -497.93, z = 58.09, shell = 2},
--     [10] = {x = 861.57, y = -509.03, z = 57.7, shell = 2},
--     [11] = {x = 850.28, y = -532.79, z = 57.92, shell = 2},
--     [12] = {x = 893.23, y = -540.62, z = 58.5, shell = 2},
--     [13] = {x = 924.4, y = -526.04, z = 59.8, shell = 2},
--     [14] = {x = 945.73, y = -519.02, z = 60.82, shell = 2},
--     [15] = {x = 970.45, y = -502.33, z = 62.14, shell = 2},
--     [16] = {x = 1014.83, y = -469.18, z = 64.5, shell = 2},
--     [17] = {x = 1044.34, y = -449.19, z = 66.25, shell = 2},
--     [18] = {x = 500.570, y = -1697.09, z = 29.78, shell = 1},
--     [19] = {x = 489.72, y = -1713.82, z = 29.7, shell = 1},
--     [20] = {x = 480.08, y = -1735.93, z = 29.15, shell = 1},
--     [21] = {x = 474.49, y = -1757.89, z = 29.08, shell = 1},
--     [22] = {x = 472.09, y = -1775.46, z = 29.07, shell = 1},
--     [23] = {x = 495.49, y = -1823.44, z = 28.86, shell = 1},
--     [24] = {x = 500.53, y = -1813.29, z = 28.89, shell = 1},
--     [25] = {x = 512.51, y = -1790.64, z = 28.92, shell = 1},
--     [26] = {x = 514.27, y = -1780.88, z = 28.91, shell = 1},
--     [27] = {x = 443.44, y = -1707.14, z = 29.69, shell = 1},
--     [28] = {x = 431.47, y = -1725.74, z = 29.6, shell = 1},
--     [29] = {x = 418.95, y = -1735.44, z = 29.6, shell = 1},
--     [30] = {x = 405.89, y = -1751.17, z = 29.71, shell = 1},
--     [31] = {x = 54.4400, y = -1873.14, z = 22.80, shell = 1},
--     [32] = {x = -50.46, y = -1783.26, z = 28.3, shell = 1},
--     [33] = {x = -42.17, y = -1792.14, z = 27.81, shell = 1},
--     [34] = {x = 21.61, y = -1844.45, z = 24.6, shell = 1},
--     [35] = {x = 30.05, y = -1854.68, z = 24.06, shell = 1},
--     [36] = {x = 46.08, y = -1864.33, z = 23.27, shell = 1},
--     [37] = {x = 100.96, y = -1912.12, z = 21.39, shell = 1},
--     [38] = {x = 118.2, y = -1921.27, z = 21.32, shell = 1},
--     [39] = {x = 126.83, y = -1930.06, z = 21.37, shell = 1},
--     [40] = {x = 114.47, y = -1961.1, z = 21.32, shell = 1},
--     [41] = {x = 85.72, y = -1959.37, z = 21.12, shell = 1},
--     [42] = {x = 71.89, y = -1938.78, z = 21.36, shell = 1},
--     [43] = {x = 56.81, y = -1922.91, z = 21.91, shell = 1},
--     [44] = {x = 39.06, y = -1911.52, z = 21.95, shell = 1},
--     [45] = {x = 23.08, y = -1896.32, z = 22.96, shell = 1},
--     [46] = {x = 5.03, y = -1884.3, z = 23.69, shell = 1},
--     [47] = {x = -4.91, y = -1872.29, z = 24.15, shell = 1},
--     [48] = {x = -20.4, y = -1858.92, z = 25.4, shell = 1},
--     [49] = {x = -34.25, y = -1847.17, z = 26.19, shell = 1},
--     [50] = {x = 1843.550, y = 3777.95, z = 33.59, shell = 1},
--     [51] = {x = 1880.560, y = 3810.63, z = 32.77, shell = 1},
--     [52] = {x = 1880.010, y = 3920.55, z = 33.19, shell = 1},
--     [53] = {x = 1728.780, y = 3851.49, z = 34.78, shell = 1},
--     [54] = {x = -374.62, y = 6190.94, z = 31.72, shell = 2},
--     [55] = {x = -357.02, y = 6207.44, z = 31.84, shell = 2},
--     [56] = {x = -347.72, y = 6225.16, z = 31.88, shell = 2},
--     [57] = {x = -360.2, y = 6260.57, z = 31.9, shell = 2},
--     [58] = {x = -380.04, y = 6252.71, z = 31.85, shell = 2},
--     [59] = {x = -450.88, y = 6269.89, z = 30.04, shell = 2},
--     [60] = {x = -467.86, y = 6206.11, z = 29.55, shell = 2},
--     [61] = {x = -368.07, y = 6341.73, z = 29.84, shell = 2},
--     [62] = {x = -332.55, y = 6302.17, z = 33.08, shell = 2},
--     [63] = {x = -302.29, y = 6326.93, z = 32.88, shell = 2},
--     [64] = {x = -280.38, y = 6350.7, z = 32.6, shell = 2},
--     [65] = {x = -247.82, y = 6369.89, z = 31.84, shell = 2},
--     [66] = {x = -227.18, y = 6377.55, z = 31.75, shell = 2},
--     [67] = {x = -213.63, y = 6396.09, z = 33.08, shell = 2},
--     [68] = {x = -188.75, y = 6409.65, z = 32.29, shell = 2},
--     [69] = {x = -229.64, y = 6445.48, z = 31.19, shell = 2},
--     [70] = {x = -245.98, y = 6414.44, z = 31.46, shell = 2},
--     [71] = {x = -272.54, y = 6400.96, z = 31.5, shell = 2},
--     [72] = {x = -130.79, y = 6551.84, z = 29.87, shell = 2},
--     [73] = {x = -105.76, y = 6528.55, z = 30.16, shell = 2},
--     [74] = {x = -44.42, y = 6582.02, z = 32.17, shell = 2},
--     [75] = {x = -26.4, y = 6597.19, z = 31.84, shell = 2},
--     [76] = {x = -41.59, y = 6637.37, z = 31.08, shell = 2},
--     [77] = {x = -9.57, y = 6654.23, z = 31.72, shell = 2},
--     [78] = {x = 1.87, y = 6612.6, z = 32.08, shell = 2},
--     [79] = {x = 31.05, y = 6596.7, z = 32.82, shell = 2},
--     [80] = {x = 11.53, y = 6578.27, z = 33.07, shell = 2},
--     [81] = {x = -15.38, y = 6557.49, z = 33.24, shell = 2},
--     [82] = {x = -1130.34, y = -1496.83, z = 4.42, shell = 2},
--     [83] = {x = 440.43, y = -1829.54, z = 28.36, shell = 2},
--     [84] = {x = 427.06, y = -1842.03, z = 28.42, shell = 2},
--     [85] = {x = 412.42, y = -1856.34, z = 27.32, shell = 2},
--     [86] = {x = 385.14, y = -1881.42, z = 25.99, shell = 2},
--     [87] = {x = 399.23, y = -1865.05, z = 26.71, shell = 2},
--     [88] = {x = -1112.35, y = -1019.75, z = 2.39, shell = 3},
--     [89] = {x = 320.28, y = -1854.07, z = 27.51, shell = 2},
--     [90] = {x = 329.31, y = -1845.91, z = 27.74, shell = 2},
--     [91] = {x = 368.68, y = -1895.75, z = 25.17, shell = 2},
--     [92] = {x = 338.72, y = -1829.71, z = 28.33, shell = 2},
--     [93] = {x = 348.72, y = -1821.01, z = 28.89, shell = 2},
--     [94] = {x = 288.67, y = -1792.62, z = 28.09, shell = 2},
--     [95] = {x = 304.41, y = -1775.47, z = 29.01, shell = 2},
--     [96] = {x = 320.68, y = -1759.86, z = 29.63, shell = 2},
--     [97] = {x = 299.95, y = -1784.25, z = 28.43, shell = 2},
--     [98] = {x = 281.98, y = -1694.97, z = 29.64, shell = 2},
--     [99] = {x = 240.63, y = -1687.71, z = 29.68, shell = 2},
--     [100] = {x = 252.82, y = -1670.77, z = 29.66, shell = 2},
--     [101] = {x = 222.43, y = -1702.54, z = 29.69, shell = 2},
--     [102] = {x = 269.65, y = -1712.78, z = 29.66, shell = 2},
--     [103] = {x = 216.41, y = -1717.39, z = 29.67, shell = 2},
--     [104] = {x = 197.61, y = -1725.87, z = 29.66, shell = 2},
--     [105] = {x = 257.49, y = -1722.79, z = 29.65, shell = 2},
--     [106] = {x = 250.00, y = -1730.75, z = 29.67, shell = 2},
--     [107] = {x = 1691.76, y = 3865.77, z = 34.90, shell = 2},
--     [108] = {x = 1733.63, y = 3895.28, z = 35.55, shell = 2},
--     [109] = {x = 1733.53, y = 3808.73, z = 35.11, shell = 2},
--     [110] = {x = 1809.02, y = 3908.01, z = 33.74, shell = 2},
--     [111] = {x = 1838.32, y = 3906.80, z = 33.26, shell = 2},
--     [112] = {x = 1859.27, y = 3865.21, z = 33.05, shell = 2},
--     [113] = {x = 1682.86, y = 4689.56, z = 43.06, shell = 2},
--     [114] = {x = 1673.62, y = 4658.43, z = 43.42, shell = 2},
--     [115] = {x = 1719.04, y = 4677.22, z = 43.65, shell = 2},
--     [116] = {x = 1663.91, y = 4739.78, z = 42.01, shell = 2},
--     [117] = {x = 1662.28, y = 4776.06, z = 42.0, shell = 2},
--     [118] = {x = 1725.38, y = 4642.55, z = 43.87, shell = 2},
--     [119] = {x = -921.47, y = -1095.34, z = 2.15, shell = 3},
--     [120] = {x = -946.86, y = -1051.21, z = 2.33, shell = 3},
--     [121] = {x = -952.49, y = -1077.58, z = 2.67, shell = 3},
--     [122] = {x = -982.53, y = -1067.01, z = 2.54, shell = 3},
--     [123] = {x = -982.87, y = -1083.54, z = 2.54, shell = 3},
--     [124] = {x = -991.71, y = -1103.47, z = 2.15, shell = 3},
--     [125] = {x = -985.91, y = -1121.67, z = 4.54, shell = 3},
--     [126] = {x = -970.5, y = -1121.07, z = 2.17, shell = 3},
--     [127] = {x = -959.93, y = -1109.87, z = 2.15, shell = 3},
--     [128] = {x = -948.41, y = -1107.57, z = 2.17, shell = 3},
--     [129] = {x = -1031.84, y = -1109.36, z = 2.15, shell = 3},
--     [130] = {x = -1024.6, y = -1139.83, z = 2.74, shell = 3},
--     [131] = {x = -1040.45, y = -1135.99, z = 2.15, shell = 3},
--     [132] = {x = -1034.33, y = -1146.92, z = 2.15, shell = 3},
--     [133] = {x = -1045.9, y = -1159.77, z = 2.15, shell = 3},
--     [134] = {x = -1064.02, y = -1133.4, z = 2.15, shell = 3},
--     [135] = {x = -1063.67, y = -1160.41, z = 2.74, shell = 3},
--     [136] = {x = -1082.63, y = -1139.2, z = 2.15, shell = 3},
--     [137] = {x = -1068.0, y = -1163.6, z = 2.74, shell = 3},
--     [138] = {x = -1065.74, y = -1055.55, z = 6.41, shell = 3},
--     [139] = {x = -1076.22, y = -1026.98, z = 4.54, shell = 3},
--     [140] = {x = -1103.4, y = -1014.63, z = 2.54, shell = 3},
--     [141] = {x = -1104.12, y = -1060.04, z = 2.73, shell = 3},
--     [142] = {x = -1130.42, y = -1031.68, z = 2.15, shell = 3},
--     [143] = {x = -1114.48, y = -1069.48, z = 2.15, shell = 3},
--     [144] = {x = -1133.94, y = -1050.47, z = 2.15, shell = 3},
--     [145] = {x = -1122.71, y = -1089.25, z = 2.54, shell = 3},
--     [146] = {x = -1054.07, y = -1000.13, z = 6.41, shell = 3},
--     [147] = {x = -1041.6, y = -1025.78, z = 2.74, shell = 3},
--     [148] = {x = -1022.19, y = -1022.97, z = 2.15, shell = 3},
--     [149] = {x = -1023.13, y = -997.91, z = 2.15, shell = 3},
--     [150] = {x = -1008.44, y = -1015.3, z = 2.15, shell = 3},
--     [151] = {x = -1012.45, y = -982.67, z = 2.15, shell = 3},
--     [152] = {x = -1003.49, y = -977.35, z = 2.15, shell = 3},
--     [153] = {x = -995.45, y = -967.32, z = 2.54, shell = 3},
--     [154] = {x = -967.99, y = -1008.8, z = 2.34, shell = 3},
--     [155] = {x = -3089.37, y = 221.16, z = 14.11, shell = 2}, 
--     [156] = {x = -3105.45, y = 246.66, z = 12.49, shell = 2}, 
--     [157] = {x = -3115.94, y = 294.03, z = 8.97, shell = 1}, 
--     [158] = {x = -3106.17, y = 311.83, z = 8.38, shell = 1}, 
--     [159] = {x = -3110.93, y = 335.18, z = 7.49, shell = 2}, 
--     [160] = {x = -3093.83, y = 349.22, z = 7.54, shell = 3}, 
--     [161] = {x = -3091.47, y = 379.39, z = 7.11, shell = 2}, 
--     [162] = {x = -3088.89, y = 392.26, z = 11.45, shell = 2}, 
--     [163] = {x = -3071.01, y = 442.68, z = 6.43, shell = 1},  
--     [164] = {x = -3049.91, y = 475.03, z = 6.77, shell = 1}, 
--     [165] = {x = -3039.54, y = 492.79, z = 6.77, shell = 3}, 
--     [166] = {x = -3037.25, y = 559.13, z = 7.5, shell = 1}, 
--     [167] = {x = -3029.98, y = 568.67, z = 7.82, shell = 1}, 
--     [168] = {x = -1754.64, y = -709.71, z = 10.4, shell = 2}, 
--     [169] = {x = -1764.04, y = -707.85, z = 10.61, shell = 2}, 
--     [170] = {x = -1777.01, y = -701.55, z = 10.52, shell = 2}, 
--     [171] = {x = -1791.2, y = -683.03, z = 10.64, shell = 2}, 
--     [172] = {x = -1800.0, y = -667.13, z = 10.6, shell = 2}, 
--     [173] = {x = -1813.83, y = -663.95, z = 10.97, shell = 2}, 
--     [174] = {x = -1813.84, y = -656.77, z = 10.88, shell = 2}, 
--     [175] = {x = -1820.01, y = -649.7, z = 10.96, shell = 2}, 
--     [176] = {x = -1836.66, y = -631.64, z = 10.75, shell = 2}, 
--     [177] = {x = -1838.7, y = -629.48, z = 11.0, shell = 2}, 
--     [178] = {x = -1877.25, y = -599.9, z = 11.86, shell = 2}, 
--     [179] = {x = -1884.85, y = -599.83, z = 11.89, shell = 2}, 
--     [180] = {x = -1883.27, y = -578.99, z = 11.81, shell = 2}, 
--     [181] = {x = -1901.29, y = -586.2, z = 11.87, shell = 2}, 
--     [182] = {x = -1913.57, y = -574.02, z = 11.43, shell = 2}, 
--     [183] = {x = -1919.99, y = -569.71, z = 11.91, shell = 2}, 
--     [184] = {x = -1927.87, y = -551.47, z = 11.84, shell = 2}, 
--     [185] = {x = -1947.02, y = -543.96, z = 11.86, shell = 2}, 
--     [186] = {x = -1958.1, y = -538.3, z = 11.89, shell = 2}, 
--     [187] = {x = -1967.76, y = -531.83, z = 12.17, shell = 2}, 
--     [188] = {x = -1976.95, y = -525.85, z = 12.18, shell = 2}, 
--     [189] = {x = -1979.96, y = -520.25, z = 11.89, shell = 2}, 
--     [190] = {x = 1365.96, y = -1721.7, z = 65.63, shell = 1}, 
--     [191] = {x = 1314.33, y = -1733.06, z = 54.7, shell = 1}, 
--     [192] = {x = 1295.01, y = -1739.86, z = 54.27, shell = 1}, 
--     [193] = {x = 1259.22, y = -1761.94, z = 49.66, shell = 1}, 
--     [194] = {x = 1250.64, y = -1734.31, z = 52.03, shell = 1}, 
--     [195] = {x = 1289.13, y = -1710.6, z = 55.47, shell = 1}, 
--     [196] = {x = 1311.94, y = -1697.39, z = 58.23, shell = 1}, 
--     [197] = {x = 1354.89, y = -1690.64, z = 60.49, shell = 1}, 
--     [198] = {x = 1286.75, y = -1604.47, z = 54.82, shell = 1}, 
--     [199] = {x = 1261.56, y = -1616.86, z = 54.74, shell = 1}, 
--     [200] = {x = 1245.38, y = -1626.95, z = 53.28, shell = 1}, 
--     [201] = {x = 1214.57, y = -1644.36, z = 48.64, shell = 1}, 
--     [202] = {x = 1193.49, y = -1656.62, z = 43.02, shell = 1}, 
--     [203] = {x = 1193.5, y = -1622.41, z = 45.22, shell = 1}, 
--     [204] = {x = 1205.65, y = -1607.21, z = 50.74, shell = 1}, 
--     [205] = {x = 1230.73, y = -1590.78, z = 53.76, shell = 1}, 
--     [206] = {x = 1315.67, y = -1526.53, z = 51.8, shell = 1}, 
--     [207] = {x = 1338.31, y = -1524.24, z = 54.58, shell = 1}, 
--     [208] = {x = 1379.08, y = -1514.96, z = 58.43, shell = 1}, 
--     [209] = {x = 1437.46, y = -1491.86, z = 63.62, shell = 1}, 
--     [210] = {x = 1381.87, y = -1544.78, z = 57.1, shell = 1}, 
--     [211] = {x = 1360.49, y = -1556.39, z = 56.34, shell = 1}, 
--     [212] = {x = 1327.51, y = -1553.26, z = 54.305, shell = 1}, 
--     [213] = {x = 324.37, y = -1937.33, z = 25.01, shell = 1}, 
--     [214] = {x = 311.9, y = -1956.19, z = 24.61, shell = 1}, 
--     [215] = {x = 295.73, y = -1971.88, z = 22.89, shell = 1}, 
--     [216] = {x = 291.63, y = -1980.19, z = 21.6, shell = 1}, 
--     [217] = {x = 279.5, y = -1993.88, z = 20.8, shell = 1}, 
--     [218] = {x = 256.38, y = -2023.46, z = 19.26, shell = 1}, 
--     [219] = {x = 251.08, y = -2030.3, z = 18.7, shell = 1}, 
--     [220] = {x = 235.99, y = -2046.38, z = 18.37, shell = 1}, 
-- }

-- local Shells = {
--     [1] = {
--         shellType = "furnitured_lowapart",
--         offset = vector4(4.94, -1.31, 2.55, 10.0),
--         aioffset = vector4(2.32, -4.52, 2.10, 90.0),
--         safeoffset = vector4(-0.81, -4.14, 2.0, 90.0),
--         dogoffset = vector4(6.21, 0.41, 2.10, 180.0),
--         items = {
--             [1] = {name = "køleskab", offset = vector3(5.57, 2.14, 2.60), isSearched = false},
--             [2] = {name = "skabe", offset = vector3(3.75, 4.88, 2.60), isSearched = false},
--             [3] = {name = "hylde", offset = vector3(2.18, 3.96, 2.60), isSearched = false},
--             [4] = {name = "hylde", offset = vector3(-3.20, 3.94, 2.60), isSearched = false},
--             [5] = {name = "håndvask", offset = vector3(-4.83, -0.73, 2.60), isSearched = false},
--             [6] = {name = "kommode", offset = vector3(1.13, -2.64, 2.10), isSearched = false},
--             [7] = {name = "sengen", offset = vector3(2.79, -3.12, 2.20), isSearched = false},
--             [8] = {name = "sofaen", offset = vector3(-3.19, 1.38, 2.10), isSearched = false},
--             [9] = {name = "sofaen", offset = vector3(0.27, 3.57, 2.10), isSearched = false},
--         }
--     }, -- 1061.04 -378.61 -29.11
--     [2] = {
--         shellType = "furnitured_midapart",
--         offset = vector4(1.46, -10.17, 0.53, 0.0),
--         aioffset = vector4(4.50, 6.70, 0.14, 270.0),
--         safeoffset = vector4(3.92, 9.97, 0.12, 0.0),
--         dogoffset = vector4(-1.06, 3.88, 0.12, 270.0),
--         items = {
--             [1] = {name = "køleskab", offset = vector3(-1.06, 1.62, 0.50), isSearched = false},
--             [2] = {name = "skabe", offset = vector3(-3.01, -0.60, 0.50), isSearched = false},
--             [3] = {name = "hylde", offset = vector3(-7.01, 4.47, 0.50), isSearched = false},
--             [4] = {name = "hylde", offset = vector3(-7.01, 7.86, 0.50), isSearched = false},
--             [5] = {name = "skuffer", offset = vector3(6.14, 3.29, 0.0), isSearched = false},
--             [6] = {name = "sengen", offset = vector3(4.76, 5.37, 0.0), isSearched = false},
--             [7] = {name = "klædeskab", offset = vector3(5.97, 9.44, 0.50), isSearched = false},
--             [8] = {name = "håndvask", offset = vector3(2.12, 8.78, 0.12), isSearched = false},
--             [9] = {name = "skuffe", offset = vector3(0.94, 1.21, 0.12), isSearched = false},
--         }
--     }, -- 1058.92 -408.96 -31.21
--     [3] = {
--         shellType = "modernhotel_shell",
--         offset = vector4(4.95, 4.36, 0.53, 180.0),
--         aioffset = vector4(-4.36, 0.14, 1.04, 270.0),
--         safeoffset = vector4(-6.16, -3.22, 1.75, 2700.0),
--         dogoffset = vector4(-5.71, 3.35, 1.75, 250.0),
--         items = {
--             [1] = {name = "skabe", offset = vector3(5.65, 0.06, 0.20), isSearched = false},
--             [2] = {name = "skabe", offset = vector3(-4.53, -3.62, 0.83), isSearched = false},
--             [3] = {name = "skabe", offset = vector3(-1.42, -3.62, 0.83), isSearched = false},
--             [4] = {name = "skabe", offset = vector3(1.43, -3.62, 0.83), isSearched = false},
--             [5] = {name = "skabe", offset = vector3(4.49, -3.62, 0.83), isSearched = false},
--             [6] = {name = "sengen", offset = vector3(-4.47, 1.15, 0.05), isSearched = false},
--             [7] = {name = "skabe", offset = vector3(-4.31, 3.58, 0.60), isSearched = false},
--             [8] = {name = "stol", offset = vector3(1.16, 3.06, 0.40), isSearched = false},
--             [9] = {name = "stol", offset = vector3(-1.50, 2.89, 0.40), isSearched = false},
--         }
--     }, -- -431.81 83.57 -29.50
-- }


-- StartHouseRobberyLoop = function()
--     if Config.Jobs[jobName] == true then
--         Citizen.CreateThread(function()
--             while true do
--                 Citizen.Wait(2)
--                 local letSleep = true
--                 local playerPed = PlayerPedId()
--                 local playerCoords = GetEntityCoords(playerPed)

--                 if ValidateJob('police') then
--                     for i = 1, #robbableHouses, 1 do
--                         local house = robbableHouses[i]

--                         local distance = #(playerCoords - vector3(house.x, house.y, house.z))
--                         if distance <= 2.0 and not hasTask then
--                             letSleep = false

--                             DrawText3D(house.x, house.y, house.z, 'Tryk ~r~[H]~w~ for at tjek ~g~huset~s~')
--                             if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
--                                 Time = GetGameTimer()
--                                 hasTask = true

--                                 FreezeEntityPosition(playerPed, true)
--                                 exports['progressBars']:startUI(10000, 'Tjekker Huset')
--                                 Citizen.Wait(10000)

--                                 ESX.TriggerServerCallback("drp_illegaljobs:checkHouse", function(HouseRobbed, HouseRobbing, isBeingRobbed)
--                                     if isBeingRobbed then
--                                         exports['mythic_notify']:DoHudText('error', 'Der er larm indenfor!', 5000)
--                                     elseif HouseRobbed then
--                                         exports['mythic_notify']:DoHudText('error', 'Der ser ud til at have været et udbrud.', 5000)
--                                     else
--                                         exports['mythic_notify']:DoHudText('success', 'Alt ser normalt ud.', 5000)
--                                     end
--                                     hasTask = false
--                                 end, i)
--                                 FreezeEntityPosition(playerPed, false)
--                             end
--                         end
--                     end
--                 else
--                     if not isRobbing then
--                         for i = 1, #robbableHouses, 1 do
--                             local house = robbableHouses[i]

--                             local distance = #(playerCoords - vector3(house.x, house.y, house.z))
--                             if distance <= 2.0 and not hasTask then
--                                 letSleep = false

--                                 DrawText3D(house.x, house.y, house.z, 'Tryk ~r~[H]~w~ for at lockpick ~g~døren~s~')
--                                 if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
--                                     Time = GetGameTimer()

--                                     ESX.TriggerServerCallback('savanha_houserobbery:copCount', function(cops) -- lavet
--                                         if cops >= Config.RequiredCopsHouseRobbery then
--                                             ESX.TriggerServerCallback('savanha_bankrobbery:hackerDevice', function(gotDevice) -- lavet
--                                                 if gotDevice then
--                                                     hasTask = true
--                                                     local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

--                                                     RequestAnimDict(animDict)
--                                                     while not HasAnimDictLoaded(animDict) do
--                                                         RequestAnimDict(animDict)
--                                                         Citizen.Wait(10)
--                                                     end

--                                                     TaskPlayAnim(playerPed, animDict, "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 1, 0, 0, 0)
--                                                     FreezeEntityPosition(playerPed, true)

--                                                     TriggerEvent("lockpicking:StartMinigame", 5, function(didWin)
--                                                         if didWin then
--                                                             TriggerServerEvent('drp_illegaljobs:syncHousesS', i)
--                                                             TriggerServerEvent('drp_illegaljobs:removeitem', 'lockpick') -- lavet

--                                                             createHouse(i)
--                                                         else
--                                                             exports['mythic_notify']:DoHudText('error', 'Du ødelagde din lockpick!.', 5000)
--                                                         end
--                                                         FreezeEntityPosition(playerPed, false)
--                                                         ClearPedTasksImmediately(playerPed)

--                                                         hasTask = false
--                                                     end)
--                                                 else
--                                                     exports['mythic_notify']:DoHudText("error", "Du har ikke en lockpick på dig.")
--                                                 end
--                                             end, "lockpick")
--                                         else
--                                             exports['mythic_notify']:DoHudText('error', 'Der er ikke nok Politi på arbejde.', 5000)
--                                         end
--                                     end, jobName)
--                                 end
--                             end
--                         end
--                     else
--                         local house = robbableHouses[houseID]
--                         local offset = Shells[house.shell]["offset"]
--                         local exitCoords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)
--                         local exitDistance = #(playerCoords - exitCoords)

--                         if exitDistance <= 1.5 then
--                             letSleep = false
                            
--                             ESX.ShowHelpNotification('Tryk ~INPUT_VEH_HEADLIGHT~ for at gå ud af huset~')
--                             if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
--                                 Time = GetGameTimer()
--                                 EndHouseRobbery()
--                             end
--                         end

--                         if safespawned then
--                             local safeoffset = Shells[house.shell]["safeoffset"]
--                             local safeCoords = vector3(house.x + safeoffset.x, house.y + safeoffset.y, house.z + safeoffset.z + Config.SpawnOffset.z)
--                             local safeDistance = #(playerCoords - safeCoords)

--                             if safeDistance <= 1.5 and not safeRobbed then
--                                 letSleep = false

--                                 DrawText3D(safeCoords.x, safeCoords.y, safeCoords.z + 1.0, 'Tryk ~r~[H]~w~ gennemsøge pengeskabet')
--                                 if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
--                                     Time = GetGameTimer()
--                                     safeRobbed = true
--                                     Savanha.MiniGame.SafeCracking.Toggle(true, 1, 'drp_illegaljobs:finishsafeHouse')
--                                 end
--                             end
--                         end

--                         for i = 1, #myRobbableItems do
--                             local item = myRobbableItems[i]
--                             local itemCoords = vector3(house.x + item["offset"].x, house.y + item["offset"].y, house.z + item["offset"].z + Config.SpawnOffset.z)
--                             local itemdistance = #(playerCoords - itemCoords)
                            
--                             if itemdistance <= 1.5 and not item['isSearched'] then
--                                 letSleep = false

--                                 DrawText3D(itemCoords.x, itemCoords.y, itemCoords.z + 1.0, 'Tryk ~r~[H]~w~ gennemsøge ' .. item["name"])
--                                 if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
--                                     Time = GetGameTimer()
--                                     item['isSearched'] = true

--                                     if isPedSpawned or isDogSpawned then
--                                         DisturbanceManager('looting')
--                                     end

--                                     local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

--                                     RequestAnimDict(animDict)
--                                     while not HasAnimDictLoaded(animDict) do
--                                         RequestAnimDict(animDict)
--                                         Citizen.Wait(10)
--                                     end

--                                     TaskPlayAnim(playerPed, animDict, "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 1, 0, 0, 0)
--                                     FreezeEntityPosition(playerPed, true)

--                                     exports['progressBars']:startUI(20000, 'Leder i ' .. item["name"])
--                                     Citizen.Wait(20000)

--                                     FreezeEntityPosition(playerPed, false)
--                                     ClearPedTasksImmediately(playerPed)

--                                     GiveReward(false)
--                                 end
--                             end
--                         end

--                         if (isPedSpawned or isDogSpawned) and letSleep then
--                             if IsPedShooting(PlayerPedId()) then
--                                 DisturbanceManager('shooting')
--                             end

--                             if GetPlayerCurrentStealthNoise(PlayerId()) >= 4.7 then
--                                 DisturbanceManager('running')
--                             end
--                         end
--                     end
--                 end

--                 if letSleep then
--                     Citizen.Wait(500)
--                 end
--             end
--         end)
--     else
--         print(jobName .. " er pt. slået fra.")
--     end
-- end

-- RegisterNetEvent('drp_illegaljobs:finishsafeHouse')
-- AddEventHandler('drp_illegaljobs:finishsafeHouse', function()
--     if safespawned then
--         DisturbanceManager('looting')
--         GiveReward(true)
--     end
-- end)

-- createHouse = function(id)
--     houseID = id

--     local house = robbableHouses[houseID]
--     myRobbableItems = Shells[house.shell]["items"]

--     for i = 1, #myRobbableItems do
--         myRobbableItems[i]['isSearched'] = false
--     end

--     AlertPoliceHouse()
--     Citizen.Wait(500)

--     DoScreenFadeOut(100)
--     Citizen.Wait(100)

--     buildHouse(house)

--     DoScreenFadeIn(100)
--     Citizen.Wait(100)

--     if Chance(80) then
--         SpawnDog(house)
--     end

--     isRobbing = true

--     Citizen.Wait(2000)
--     DisturbanceManager('entering')
-- end

-- GiveReward = function(isSafe)
--     ESX.TriggerServerCallback("drp_illegaljobs:checkHouse", function(HouseRobbed, HouseRobbing, isBeingRobbed)
--         if not HouseRobbed and HouseRobbing then
--             TriggerServerEvent('drp_illegaljobs:AddReward', isSafe) -- lavet
--         else
--             exports['mythic_notify']:DoHudText('error', 'Der er ingenting tilbage!', 5000)
--         end
--     end, houseID)
-- end

-- EndHouseRobbery = function()
--     DoScreenFadeOut(100)
--     Citizen.Wait(100)

--     DeleteShell()
--     Citizen.Wait(1000)
    
--     local house = robbableHouses[houseID]

--     local playerPed = PlayerPedId()
--     SetEntityCoords(playerPed, house.x, house.y, house.z)
--     SetPedDiesInWater(playerPed, true)

--     DeletePed(robberyped)
--     TriggerServerEvent('drp_illegaljobs:DoneHouse', houseID)

--     hasTask = false
--     isPedSpawned = false
--     isAgro = false
--     safespawned = false
--     safeRobbed = false
--     PoliceAlerted = false
--     isRobbing = false
--     houseID = 0
--     disturbance = 0
--     myRobbableItems = {}
--     shellUsed = nil
--     safe = nil

--     DoScreenFadeIn(100)
--     Citizen.Wait(100)

--     if isDogSpawned then
--         if not IsPedDeadOrDying(robberydog) then
--             Citizen.Wait(5000)
--             SetEntityCoords(robberydog, house.x, house.y, house.z)
--         else
--             DeletePed(robberydog)
--         end
--     end
--     isDogSpawned = false
-- end

-- DisturbanceManager = function(type)
--     if isPedSpawned then
--         if type == 'looting' then
--             local distance, ped = closestNPC()
--             if ped == robberyped then
--                 if distance <= 10.0 then
--                     local multiplier = 10.0 - distance
--                     disturbance = disturbance + multiplier
--                 end
--             end
--         elseif type == 'shooting' then
--             disturbance = 100
--         elseif type == 'running' then
--             local distance, ped = closestNPC()
--             if ped == robberyped then
--                 if distance <= 10.0 then
--                     local noise = GetPlayerCurrentStealthNoise(PlayerId()) / 2
--                     local multiplier = (10.0 - distance) + noise
--                     disturbance = disturbance + multiplier
--                 end
--             end
--         end

--         if disturbance >= 80 and not isAgro then
--             agroNPC()
--         end
--     end

--     if isDogSpawned then
--         TaskCombatPed(robberydog, GetPlayerPed(-1), 0, 16)
--         SetPedKeepTask(robberydog, true)
--     end
-- end

-- AlertPoliceHouse = function()
--     local NumberToCallPolice = math.random(1,15)
--     print(NumberToCallPolice)
--     if NumberToCallPolice == 3 then
--         PoliceAlerted = true
--         local playerCoords = GetEntityCoords(PlayerPedId())
--         streetName = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
--         streetName = GetStreetNameFromHashKey(streetName)
--         TriggerServerEvent('esx_outlawalert:houserobberyalert', {
--             x = ESX.Math.Round(playerCoords.x, 1),
--             y = ESX.Math.Round(playerCoords.y, 1),
--             z = ESX.Math.Round(playerCoords.z, 1)
--         }, streetName, playerGender)
--     end
-- end

-- SpawnAI = function(house)
--     ESX.TriggerServerCallback("drp_illegaljobs:checkHouse", function(HouseRobbed, HouseRobbing, isBeingRobbed)
--         if HouseRobbing then
--             local offset = Shells[house.shell]["aioffset"]
--             local coords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)

--             local hash = GetHashKey("a_m_m_beach_02")
--             local pedType = GetPedType(hash)

--             SpawnPed(hash, coords, offset.w, pedType, function(ped)
--                 SetPedFleeAttributes(ped, 0, 0)

--                 loadAnimDict("dead")
--                 TaskPlayAnim(ped, "dead", 'dead_a', 100.0, 1.0, -1, 1, 0, 0, 0, 0)

--                 robberyped = ped
--                 isDogSpawned = true
--             end)
--         end
--     end, houseID)
-- end

-- SpawnDog = function(house)
--     ESX.TriggerServerCallback("drp_illegaljobs:checkHouse", function(HouseRobbed, HouseRobbing, isBeingRobbed)
--         if HouseRobbing then
--             local offset = Shells[house.shell]["dogoffset"]
--             local coords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)

--             local hash = GetHashKey("a_c_rottweiler")
--             local pedType = GetPedType(hash)

--             SpawnPed(hash, coords, offset.w, pedType, function(ped)
--                 SetEntityMaxHealth(ped, 250)
--                 SetEntityHealth(ped, 250)

--                 robberydog = ped
--                 isDogSpawned = true
--             end)
--         end
--     end, houseID)
-- end

-- agroNPC = function()
--     ClearPedTasksImmediately(robberyped)

--     SetPedCombatAttributes(robberyped, 46, 1)
--     SetPedCombatMovement(robberyped, 2)

--     GiveWeaponToPed(robberyped, GetHashKey('WEAPON_BAT'), 150, 0, 1)
--     TaskCombatPed(robberyped, GetPlayerPed(-1), 0, 16)
--     SetPedKeepTask(robberyped, true)
--     isAgro = true
-- end

-- closestNPC = function()
--     local playerCoords = GetEntityCoords(GetPlayerPed(-1))
--     local handle, ped = FindFirstPed()
--     local success
--     local rped = nil
--     local distanceFrom = 999.0
--     repeat
--         local pos = GetEntityCoords(ped)
--         local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
--         if distance < 25.0 and ped ~= GetPlayerPed(-1) and not IsPedAPlayer(ped) then
--             if (distance < distanceFrom) then
--                 distanceFrom = distance
--                 rped = ped
--             end
--         end
--     success, ped = FindNextPed(handle)
--     until not success

--     EndFindPed(handle)
--     return distanceFrom, rped
-- end

-- buildHouse = function(house)
--     local plyPed = GetPlayerPed(-1)
--     FreezeEntityPosition(plyPed, true)

--     local generator = {x = house.x, y = house.y, z = house.z}
--     local shellType = Shells[house.shell]["shellType"]
--     local offset = Shells[house.shell]["offset"]

--     local model = shellType
--     local hash  = GetHashKey(model)

--     print(hash)
--     print(model)
--     print(shellType)

--     local start = GetGameTimer()
--     RequestModel(hash)
--     while not HasModelLoaded(hash) and GetGameTimer() - start < 30000 do 
--         Wait(0); 
--     end

--     if not HasModelLoaded(hash) then
--         print('No Model')
--         return
--     end
    
--     local shell = CreateObject(hash, generator.x + Config.SpawnOffset.x, generator.y + Config.SpawnOffset.y, generator.z + Config.SpawnOffset.z, false, false, false)
--     FreezeEntityPosition(shell, true)

--     start = GetGameTimer()
--     while not DoesEntityExist(shell) and GetGameTimer() - start < 30000 do 
--         Wait(0); 
--     end

--     if not DoesEntityExist(shell) then
--         print('No Entity')
--         return
--     end

--     shellUsed = shell
--     SetEntityAsMissionEntity(shell, true, true)
--     SetModelAsNoLongerNeeded(hash)

--     local chance = 80
--     if not isNight() then
--         chance = 40
--     end

--     if Chance(chance) then
--         SpawnAI(house)
--     end

--     if Chance(10) then
--         CreateSafe(house)
--     end

--     SetEntityCoordsNoOffset(plyPed, generator.x + offset.x, generator.y + offset.y, generator.z + offset.z + Config.SpawnOffset.z)
--     SetEntityHeading(plyPed, offset.w)

--     local start_time = GetGameTimer()
--     while (not HasCollisionLoadedAroundEntity(plyPed) and GetGameTimer() - start_time < 5000) do
--         Wait(0); 
--     end
--     FreezeEntityPosition(plyPed, false)
--     SetPedDiesInWater(plyPed, false)
-- end

-- CreateSafe = function(house)
--     safespawned = true
--     local hash = GetHashKey("prop_ld_int_safe_01")

--     RequestModel(hash)
--     while not HasModelLoaded(hash) do
--         Citizen.Wait(100)
--     end
    
--     local generator = {x = house.x, y = house.y, z = house.z}
--     local offset = Shells[house.shell]["safeoffset"]

--     safe = CreateObject(hash, generator.x + offset.x, generator.y + offset.y, generator.z + offset.z + Config.SpawnOffset.z, true, false, false)
--     FreezeEntityPosition(safe, true)
--     SetEntityHeading(safe, offset.w)
-- end

-- DeleteShell = function()
--     if DoesEntityExist(robberyped) then
--         DeletePed(robberyped)
--     end

--     if DoesEntityExist(robberydog) then
--         DeletePed(robberydog)
--     end

--     DeleteObject(shellUsed)

--     if DoesEntityExist(safe) then
--         DeleteObject(safe)
--     end
-- end
return{}
