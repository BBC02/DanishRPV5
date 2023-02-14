local robbableHouses = {
    [1] = { x = 1061.04, y = -378.610, z = 68.24, shell = 2 },
    [2] = { x = 1028.87, y = -408.29, z = 66.33, shell = 2 },
    [3] = { x = 1010.49, y = -423.54, z = 65.34, shell = 2 },
    [4] = { x = 987.49, y = -432.99, z = 64.02, shell = 2 },
    [5] = { x = 967.04, y = -451.65, z = 62.79, shell = 2 },
    [6] = { x = 944.51, y = -463.29, z = 61.55, shell = 2 },
    [7] = { x = 921.88, y = -477.82, z = 61.08, shell = 2 },
    [8] = { x = 906.28, y = -489.4, z = 59.43, shell = 2 },
    [9] = { x = 878.39, y = -497.93, z = 58.09, shell = 2 },
    [10] = { x = 861.57, y = -509.03, z = 57.7, shell = 2 },
    [11] = { x = 850.28, y = -532.79, z = 57.92, shell = 2 },
    [12] = { x = 893.23, y = -540.62, z = 58.5, shell = 2 },
    [13] = { x = 924.4, y = -526.04, z = 59.8, shell = 2 },
    [14] = { x = 945.73, y = -519.02, z = 60.82, shell = 2 },
    [15] = { x = 970.45, y = -502.33, z = 62.14, shell = 2 },
    [16] = { x = 1014.83, y = -469.18, z = 64.5, shell = 2 },
    [17] = { x = 1044.34, y = -449.19, z = 66.25, shell = 2 },
    [18] = { x = 500.570, y = -1697.09, z = 29.78, shell = 1 },
    [19] = { x = 489.72, y = -1713.82, z = 29.7, shell = 1 },
    [20] = { x = 480.08, y = -1735.93, z = 29.15, shell = 1 },
    [21] = { x = 474.49, y = -1757.89, z = 29.08, shell = 1 },
    [22] = { x = 472.09, y = -1775.46, z = 29.07, shell = 1 },
    [23] = { x = 495.49, y = -1823.44, z = 28.86, shell = 1 },
    [24] = { x = 500.53, y = -1813.29, z = 28.89, shell = 1 },
    [25] = { x = 512.51, y = -1790.64, z = 28.92, shell = 1 },
    [26] = { x = 514.27, y = -1780.88, z = 28.91, shell = 1 },
    [27] = { x = 443.44, y = -1707.14, z = 29.69, shell = 1 },
    [28] = { x = 431.47, y = -1725.74, z = 29.6, shell = 1 },
    [29] = { x = 418.95, y = -1735.44, z = 29.6, shell = 1 },
    [30] = { x = 405.89, y = -1751.17, z = 29.71, shell = 1 },
    [31] = { x = 54.4400, y = -1873.14, z = 22.80, shell = 1 },
    [32] = { x = -50.46, y = -1783.26, z = 28.3, shell = 1 },
    [33] = { x = -42.17, y = -1792.14, z = 27.81, shell = 1 },
    [34] = { x = 21.61, y = -1844.45, z = 24.6, shell = 1 },
    [35] = { x = 30.05, y = -1854.68, z = 24.06, shell = 1 },
    [36] = { x = 46.08, y = -1864.33, z = 23.27, shell = 1 },
    [37] = { x = 100.96, y = -1912.12, z = 21.39, shell = 1 },
    [38] = { x = 118.2, y = -1921.27, z = 21.32, shell = 1 },
    [39] = { x = 126.83, y = -1930.06, z = 21.37, shell = 1 },
    [40] = { x = 114.47, y = -1961.1, z = 21.32, shell = 1 },
    [41] = { x = 85.72, y = -1959.37, z = 21.12, shell = 1 },
    [42] = { x = 71.89, y = -1938.78, z = 21.36, shell = 1 },
    [43] = { x = 56.81, y = -1922.91, z = 21.91, shell = 1 },
    [44] = { x = 39.06, y = -1911.52, z = 21.95, shell = 1 },
    [45] = { x = 23.08, y = -1896.32, z = 22.96, shell = 1 },
    [46] = { x = 5.03, y = -1884.3, z = 23.69, shell = 1 },
    [47] = { x = -4.91, y = -1872.29, z = 24.15, shell = 1 },
    [48] = { x = -20.4, y = -1858.92, z = 25.4, shell = 1 },
    [49] = { x = -34.25, y = -1847.17, z = 26.19, shell = 1 },
    [50] = { x = 1843.550, y = 3777.95, z = 33.59, shell = 1 },
    [51] = { x = 1880.560, y = 3810.63, z = 32.77, shell = 1 },
    [52] = { x = 1880.010, y = 3920.55, z = 33.19, shell = 1 },
    [53] = { x = 1728.780, y = 3851.49, z = 34.78, shell = 1 },
    [54] = { x = -374.62, y = 6190.94, z = 31.72, shell = 2 },
    [55] = { x = -357.02, y = 6207.44, z = 31.84, shell = 2 },
    [56] = { x = -347.72, y = 6225.16, z = 31.88, shell = 2 },
    [57] = { x = -360.2, y = 6260.57, z = 31.9, shell = 2 },
    [58] = { x = -380.04, y = 6252.71, z = 31.85, shell = 2 },
    [59] = { x = -450.88, y = 6269.89, z = 30.04, shell = 2 },
    [60] = { x = -467.86, y = 6206.11, z = 29.55, shell = 2 },
    [61] = { x = -368.07, y = 6341.73, z = 29.84, shell = 2 },
    [62] = { x = -332.55, y = 6302.17, z = 33.08, shell = 2 },
    [63] = { x = -302.29, y = 6326.93, z = 32.88, shell = 2 },
    [64] = { x = -280.38, y = 6350.7, z = 32.6, shell = 2 },
    [65] = { x = -247.82, y = 6369.89, z = 31.84, shell = 2 },
    [66] = { x = -227.18, y = 6377.55, z = 31.75, shell = 2 },
    [67] = { x = -213.63, y = 6396.09, z = 33.08, shell = 2 },
    [68] = { x = -188.75, y = 6409.65, z = 32.29, shell = 2 },
    [69] = { x = -229.64, y = 6445.48, z = 31.19, shell = 2 },
    [70] = { x = -245.98, y = 6414.44, z = 31.46, shell = 2 },
    [71] = { x = -272.54, y = 6400.96, z = 31.5, shell = 2 },
    [72] = { x = -130.79, y = 6551.84, z = 29.87, shell = 2 },
    [73] = { x = -105.76, y = 6528.55, z = 30.16, shell = 2 },
    [74] = { x = -44.42, y = 6582.02, z = 32.17, shell = 2 },
    [75] = { x = -26.4, y = 6597.19, z = 31.84, shell = 2 },
    [76] = { x = -41.59, y = 6637.37, z = 31.08, shell = 2 },
    [77] = { x = -9.57, y = 6654.23, z = 31.72, shell = 2 },
    [78] = { x = 1.87, y = 6612.6, z = 32.08, shell = 2 },
    [79] = { x = 31.05, y = 6596.7, z = 32.82, shell = 2 },
    [80] = { x = 11.53, y = 6578.27, z = 33.07, shell = 2 },
    [81] = { x = -15.38, y = 6557.49, z = 33.24, shell = 2 },
    [82] = { x = -1130.34, y = -1496.83, z = 4.42, shell = 2 },
    [83] = { x = 440.43, y = -1829.54, z = 28.36, shell = 1 },
    [84] = { x = 427.06, y = -1842.03, z = 28.42, shell = 1 },
    [85] = { x = 412.42, y = -1856.34, z = 27.32, shell = 1 },
    [86] = { x = 385.14, y = -1881.42, z = 25.99, shell = 1 },
    [87] = { x = 399.23, y = -1865.05, z = 26.71, shell = 1 },
    [88] = { x = -1112.35, y = -1019.75, z = 2.39, shell = 3 },
    [89] = { x = 320.28, y = -1854.07, z = 27.51, shell = 1 },
    [90] = { x = 329.31, y = -1845.91, z = 27.74, shell = 1 },
    [91] = { x = 368.68, y = -1895.75, z = 25.17, shell = 1 },
    [92] = { x = 338.72, y = -1829.71, z = 28.33, shell = 1 },
    [93] = { x = 348.72, y = -1821.01, z = 28.89, shell = 1 },
    [94] = { x = 288.67, y = -1792.62, z = 28.09, shell = 1 },
    [95] = { x = 304.41, y = -1775.47, z = 29.01, shell = 1 },
    [96] = { x = 320.68, y = -1759.86, z = 29.63, shell = 1 },
    [97] = { x = 299.95, y = -1784.25, z = 28.43, shell = 1 },
    [98] = { x = 281.98, y = -1694.97, z = 29.64, shell = 1 },
    [99] = { x = 240.63, y = -1687.71, z = 29.68, shell = 1 },
    [100] = { x = 252.82, y = -1670.77, z = 29.66, shell = 1 },
    [101] = { x = 222.43, y = -1702.54, z = 29.69, shell = 1 },
    [102] = { x = 269.65, y = -1712.78, z = 29.66, shell = 1 },
    [103] = { x = 216.41, y = -1717.39, z = 29.67, shell = 1 },
    [104] = { x = 197.61, y = -1725.87, z = 29.66, shell = 1 },
    [105] = { x = 257.49, y = -1722.79, z = 29.65, shell = 1 },
    [106] = { x = 250.00, y = -1730.75, z = 29.67, shell = 1 },
    [107] = { x = 1691.76, y = 3865.77, z = 34.90, shell = 2 },
    [108] = { x = 1733.63, y = 3895.28, z = 35.55, shell = 2 },
    [109] = { x = 1733.53, y = 3808.73, z = 35.11, shell = 2 },
    [110] = { x = 1809.02, y = 3908.01, z = 33.74, shell = 2 },
    [111] = { x = 1838.32, y = 3906.80, z = 33.26, shell = 2 },
    [112] = { x = 1859.27, y = 3865.21, z = 33.05, shell = 2 },
    [113] = { x = 1682.86, y = 4689.56, z = 43.06, shell = 2 },
    [114] = { x = 1673.62, y = 4658.43, z = 43.42, shell = 2 },
    [115] = { x = 1719.04, y = 4677.22, z = 43.65, shell = 2 },
    [116] = { x = 1663.91, y = 4739.78, z = 42.01, shell = 2 },
    [117] = { x = 1662.28, y = 4776.06, z = 42.0, shell = 2 },
    [118] = { x = 1725.38, y = 4642.55, z = 43.87, shell = 2 },
    [119] = { x = -921.47, y = -1095.34, z = 2.15, shell = 3 },
    [120] = { x = -946.86, y = -1051.21, z = 2.33, shell = 3 },
    [121] = { x = -952.49, y = -1077.58, z = 2.67, shell = 3 },
    [122] = { x = -982.53, y = -1067.01, z = 2.54, shell = 3 },
    [123] = { x = -982.87, y = -1083.54, z = 2.54, shell = 3 },
    [124] = { x = -991.71, y = -1103.47, z = 2.15, shell = 3 },
    [125] = { x = -985.91, y = -1121.67, z = 4.54, shell = 3 },
    [126] = { x = -970.5, y = -1121.07, z = 2.17, shell = 3 },
    [127] = { x = -959.93, y = -1109.87, z = 2.15, shell = 3 },
    [128] = { x = -948.41, y = -1107.57, z = 2.17, shell = 3 },
    [129] = { x = -1031.84, y = -1109.36, z = 2.15, shell = 3 },
    [130] = { x = -1024.6, y = -1139.83, z = 2.74, shell = 3 },
    [131] = { x = -1040.45, y = -1135.99, z = 2.15, shell = 3 },
    [132] = { x = -1034.33, y = -1146.92, z = 2.15, shell = 3 },
    [133] = { x = -1045.9, y = -1159.77, z = 2.15, shell = 3 },
    [134] = { x = -1064.02, y = -1133.4, z = 2.15, shell = 3 },
    [135] = { x = -1063.67, y = -1160.41, z = 2.74, shell = 3 },
    [136] = { x = -1082.63, y = -1139.2, z = 2.15, shell = 3 },
    [137] = { x = -1068.0, y = -1163.6, z = 2.74, shell = 3 },
    [138] = { x = -1065.74, y = -1055.55, z = 6.41, shell = 3 },
    [139] = { x = -1076.22, y = -1026.98, z = 4.54, shell = 3 },
    [140] = { x = -1103.4, y = -1014.63, z = 2.54, shell = 3 },
    [141] = { x = -1104.12, y = -1060.04, z = 2.73, shell = 3 },
    [142] = { x = -1130.42, y = -1031.68, z = 2.15, shell = 3 },
    [143] = { x = -1114.48, y = -1069.48, z = 2.15, shell = 3 },
    [144] = { x = -1133.94, y = -1050.47, z = 2.15, shell = 3 },
    [145] = { x = -1122.71, y = -1089.25, z = 2.54, shell = 3 },
    [146] = { x = -1054.07, y = -1000.13, z = 6.41, shell = 3 },
    [147] = { x = -1041.6, y = -1025.78, z = 2.74, shell = 3 },
    [148] = { x = -1022.19, y = -1022.97, z = 2.15, shell = 3 },
    [149] = { x = -1023.13, y = -997.91, z = 2.15, shell = 3 },
    [150] = { x = -1008.44, y = -1015.3, z = 2.15, shell = 3 },
    [151] = { x = -1012.45, y = -982.67, z = 2.15, shell = 3 },
    [152] = { x = -1003.49, y = -977.35, z = 2.15, shell = 3 },
    [153] = { x = -995.45, y = -967.32, z = 2.54, shell = 3 },
    [154] = { x = -967.99, y = -1008.8, z = 2.34, shell = 3 },
    [155] = { x = -3089.37, y = 221.16, z = 14.11, shell = 2 },
    [156] = { x = -3105.45, y = 246.66, z = 12.49, shell = 2 },
    [157] = { x = -3115.94, y = 294.03, z = 8.97, shell = 1 },
    [158] = { x = -3106.17, y = 311.83, z = 8.38, shell = 1 },
    [159] = { x = -3110.93, y = 335.18, z = 7.49, shell = 2 },
    [160] = { x = -3093.83, y = 349.22, z = 7.54, shell = 3 },
    [161] = { x = -3091.47, y = 379.39, z = 7.11, shell = 2 },
    [162] = { x = -3088.89, y = 392.26, z = 11.45, shell = 2 },
    [163] = { x = -3071.01, y = 442.68, z = 6.43, shell = 1 },
    [164] = { x = -3049.91, y = 475.03, z = 6.77, shell = 1 },
    [165] = { x = -3039.54, y = 492.79, z = 6.77, shell = 3 },
    [166] = { x = -3037.25, y = 559.13, z = 7.5, shell = 1 },
    [167] = { x = -3029.98, y = 568.67, z = 7.82, shell = 1 },
    [168] = { x = -1754.64, y = -709.71, z = 10.4, shell = 2 },
    [169] = { x = -1764.04, y = -707.85, z = 10.61, shell = 2 },
    [170] = { x = -1777.01, y = -701.55, z = 10.52, shell = 2 },
    [171] = { x = -1791.2, y = -683.03, z = 10.64, shell = 2 },
    [172] = { x = -1800.0, y = -667.13, z = 10.6, shell = 2 },
    [173] = { x = -1813.83, y = -663.95, z = 10.97, shell = 2 },
    [174] = { x = -1813.84, y = -656.77, z = 10.88, shell = 2 },
    [175] = { x = -1820.01, y = -649.7, z = 10.96, shell = 2 },
    [176] = { x = -1836.66, y = -631.64, z = 10.75, shell = 2 },
    [177] = { x = -1838.7, y = -629.48, z = 11.0, shell = 2 },
    [178] = { x = -1877.25, y = -599.9, z = 11.86, shell = 2 },
    [179] = { x = -1884.85, y = -599.83, z = 11.89, shell = 2 },
    [180] = { x = -1883.27, y = -578.99, z = 11.81, shell = 2 },
    [181] = { x = -1901.29, y = -586.2, z = 11.87, shell = 2 },
    [182] = { x = -1913.57, y = -574.02, z = 11.43, shell = 2 },
    [183] = { x = -1919.99, y = -569.71, z = 11.91, shell = 2 },
    [184] = { x = -1927.87, y = -551.47, z = 11.84, shell = 2 },
    [185] = { x = -1947.02, y = -543.96, z = 11.86, shell = 2 },
    [186] = { x = -1958.1, y = -538.3, z = 11.89, shell = 2 },
    [187] = { x = -1967.76, y = -531.83, z = 12.17, shell = 2 },
    [188] = { x = -1976.95, y = -525.85, z = 12.18, shell = 2 },
    [189] = { x = -1979.96, y = -520.25, z = 11.89, shell = 2 },
    [190] = { x = 1365.96, y = -1721.7, z = 65.63, shell = 1 },
    [191] = { x = 1314.33, y = -1733.06, z = 54.7, shell = 1 },
    [192] = { x = 1295.01, y = -1739.86, z = 54.27, shell = 1 },
    [193] = { x = 1259.22, y = -1761.94, z = 49.66, shell = 1 },
    [194] = { x = 1250.64, y = -1734.31, z = 52.03, shell = 1 },
    [195] = { x = 1289.13, y = -1710.6, z = 55.47, shell = 1 },
    [196] = { x = 1311.94, y = -1697.39, z = 58.23, shell = 1 },
    [197] = { x = 1354.89, y = -1690.64, z = 60.49, shell = 1 },
    [198] = { x = 1286.75, y = -1604.47, z = 54.82, shell = 1 },
    [199] = { x = 1261.56, y = -1616.86, z = 54.74, shell = 1 },
    [200] = { x = 1245.38, y = -1626.95, z = 53.28, shell = 1 },
    [201] = { x = 1214.57, y = -1644.36, z = 48.64, shell = 1 },
    [202] = { x = 1193.49, y = -1656.62, z = 43.02, shell = 1 },
    [203] = { x = 1193.50, y = -1622.41, z = 45.22, shell = 1 },
    [204] = { x = 1205.65, y = -1607.21, z = 50.74, shell = 1 },
    [205] = { x = 1230.73, y = -1590.78, z = 53.76, shell = 1 },
    [206] = { x = 1315.67, y = -1526.53, z = 51.8, shell = 1 },
    [207] = { x = 1338.31, y = -1524.24, z = 54.58, shell = 1 },
    [208] = { x = 1379.08, y = -1514.96, z = 58.43, shell = 1 },
    [209] = { x = 1437.46, y = -1491.86, z = 63.62, shell = 1 },
    [210] = { x = 1381.87, y = -1544.78, z = 57.1, shell = 1 },
    [211] = { x = 1360.49, y = -1556.39, z = 56.34, shell = 1 },
    [212] = { x = 1327.51, y = -1553.26, z = 54.305, shell = 1 },
    [213] = { x = 324.37, y = -1937.33, z = 25.01, shell = 1 },
    [214] = { x = 311.90, y = -1956.19, z = 24.61, shell = 1 },
    [215] = { x = 295.73, y = -1971.88, z = 22.89, shell = 1 },
    [216] = { x = 291.63, y = -1980.19, z = 21.6, shell = 1 },
    [217] = { x = 279.50, y = -1993.88, z = 20.8, shell = 1 },
    [218] = { x = 256.38, y = -2023.46, z = 19.26, shell = 1 },
    [219] = { x = 251.08, y = -2030.30, z = 18.7, shell = 1 },
    [220] = { x = 235.99, y = -2046.38, z = 18.37, shell = 1 },
    [221] = { x = -1788.48, y = -403.39, z = 46.47, shell = 3 },
    [222] = { x = -1778.78, y = -390.31, z = 46.47, shell = 3 },
    [223] = { x = -1772.07, y = -378.56, z = 46.47, shell = 3 },
    [224] = { x = -1759.91, y = -380.61, z = 46.48, shell = 3 },
    [225] = { x = -1748.15, y = -394.71, z = 43.68, shell = 3 },
    [226] = { x = -1759.10, y = -399.90, z = 45.29, shell = 3 },
    [227] = { x = -1769.66, y = -411.11, z = 45.29, shell = 3 },
    [228] = { x = -1778.38, y = -427.16, z = 41.44, shell = 3 },
    [229] = { x = -1799.66, y = -421.64, z = 41.85, shell = 3 },
    [230] = { x = -1821.37, y = -404.78, z = 46.64, shell = 3 },
    [231] = { x = -1790.61, y = -369.25, z = 45.1, shell = 3 },
    [232] = { x = -1838.22, y = -360.58, z = 57.15, shell = 3 },
    [233] = { x = -1842.58, y = -338.57, z = 57.13, shell = 3 },
    [234] = { x = -1862.50, y = -329.23, z = 57.13, shell = 3 },
    [235] = { x = -1884.77, y = -325.10, z = 57.12, shell = 3 },
    [236] = { x = -1343.20, y = 307.02, z = 65.5, shell = 3 },
    [237] = { x = -1337.53, y = 308.89, z = 65.5, shell = 3 },
    [238] = { x = -1340.52, y = 318.84, z = 65.5, shell = 3 },
    [239] = { x = -1346.22, y = 317.05, z = 65.5, shell = 3 },
    [240] = { x = 1006.53, y = -511.03, z = 60.99, shell = 2 },
    [241] = { x = 987.89, y = -525.73, z = 60.69, shell = 2 },
    [242] = { x = 965.25, y = -541.93, z = 59.72, shell = 2 },
    [243] = { x = 919.64, y = -569.64, z = 58.36, shell = 2 },
    [244] = { x = 964.32, y = -596.08, z = 59.9, shell = 2 },
    [245] = { x = 976.60, y = -580.69, z = 59.84, shell = 2 },
    [246] = { x = 1009.58, y = -572.46, z = 60.59, shell = 2 },
    [247] = { x = 999.55, y = -593.81, z = 59.63, shell = 2 },
    [248] = { x = 980.20, y = -627.72, z = 59.23, shell = 2 },
    [249] = { x = 1051.02, y = -470.64, z = 64.29, shell = 2 },
    [250] = { x = 1090.41, y = -484.42, z = 65.65, shell = 2 },
    [251] = { x = 1098.77, y = -464.59, z = 67.31, shell = 2 },
    [252] = { x = 1099.40, y = -438.66, z = 67.79, shell = 2 },
    [253] = { x = 1101.04, y = -411.49, z = 67.55, shell = 2 },
    [254] = { x = 1114.33, y = -391.49, z = 68.94, shell = 2 },
    [255] = { x = 1262.36, y = -429.91, z = 70.01, shell = 2 },
    [256] = { x = 1265.71, y = -458.30, z = 70.51, shell = 2 },
    [257] = { x = 1259.59, y = -480.19, z = 70.18, shell = 2 },
    [258] = { x = 1251.55, y = -494.05, z = 69.9, shell = 2 },
    [259] = { x = 1250.86, y = -515.64, z = 69.34, shell = 2 },
    [260] = { x = 1303.34, y = -527.5, z = 71.46, shell = 2 },
    [261] = { x = 1328.51, y = -536.14, z = 72.44, shell = 2 },
    [262] = { x = 1348.58, y = -546.83, z = 73.89, shell = 2 },
    [263] = { x = 1373.20, y = -555.83, z = 74.68, shell = 2 },
    [264] = { x = 1389.03, y = -569.58, z = 74.49, shell = 2 },
    [265] = { x = 1386.33, y = -593.35, z = 74.48, shell = 2 },
    [266] = { x = 1367.15, y = -606.6, z = 74.71, shell = 2 },
    [267] = { x = 1341.32, y = -597.39, z = 74.7, shell = 2 },
    [268] = { x = 1323.54, y = -583.23, z = 73.24, shell = 2 },
    [269] = { x = 1300.91, y = -574.20, z = 71.73, shell = 2 },
    [270] = { x = 1241.29, y = -566.20, z = 69.65, shell = 2 },
    [271] = { x = 1240.50, y = -601.38, z = 69.78, shell = 2 },
    [272] = { x = 1250.79, y = -620.99, z = 69.57, shell = 2 },
    [273] = { x = 1265.42, y = -648.67, z = 67.92, shell = 2 },
    [274] = { x = 1271.04, y = -683.53, z = 66.03, shell = 2 },
    [275] = { x = 1264.63, y = -703.01, z = 64.9, shell = 2 },
    [276] = { x = 1229.58, y = -725.29, z = 60.94, shell = 2 },
    [277] = { x = 1223.13, y = -697.15, z = 60.8, shell = 2 },
    [278] = { x = 1221.45, y = -669.31, z = 63.68, shell = 2 },
    [279] = { x = 1207.46, y = -620.19, z = 66.43, shell = 2 },
    [280] = { x = 1203.52, y = -598.42, z = 68.06, shell = 2 },
    [281] = { x = 1200.79, y = -575.37, z = 69.13, shell = 2 },
    [282] = { x = 1204.89, y = -557.55, z = 69.61, shell = 2 },
    [283] = { x = 844.11, y = -562.58, z = 57.99, shell = 2 },
    [284] = { x = 862.03, y = -583.56, z = 58.15, shell = 2 },
    [285] = { x = 886.78, y = -608.2, z = 58.44, shell = 2 },
    [286] = { x = 902.85, y = -615.59, z = 58.45, shell = 2 },
    [287] = { x = 928.77, y = -639.79, z = 58.24, shell = 2 },
    [289] = { x = 943.13, y = -653.4, z = 58.62, shell = 2 },
    [290] = { x = 959.96, y = -669.87, z = 58.44, shell = 2 },
    [291] = { x = 970.65, y = -701.4, z = 58.48, shell = 2 },
    [292] = { x = 979.22, y = -716.3, z = 58.21, shell = 2 },
    [293] = { x = 996.82, y = -729.51, z = 57.81, shell = 2 },
    [294] = { x = 1336.71, y = -1578.87, z = 54.44, shell = 2 },
    [295] = { x = 1351.03, y = -1747.29, z = 64.26, shell = 2 },
    [296] = { x = 282.87, y = -1899.02, z = 27.26, shell = 1 },
    [297] = { x = 270.52, y = -1917.09, z = 26.18, shell = 1 },
    [298] = { x = 258.27, y = -1927.18, z = 25.44, shell = 1 },
    [299] = { x = 250.96, y = -1934.86, z = 24.69, shell = 1 },
    [300] = { x = 208.65, y = -1895.27, z = 24.81, shell = 1 },
    [301] = { x = 192.67, y = -1883.43, z = 25.05, shell = 1 },
    [302] = { x = 171.69, y = -1871.42, z = 24.4, shell = 1 },
    [303] = { x = 149.78, y = -1864.58, z = 24.59, shell = 1 },
    [304] = { x = 130.55, y = -1853.27, z = 25.23, shell = 1 },
    [305] = { x = 152.86, y = -1823.55, z = 27.86, shell = 1 },
    [306] = { x = 104.1, y = -1885.49, z = 24.31, shell = 1 },
    [307] = { x = 115.35, y = -1887.91, z = 23.92, shell = 1 },
    [308] = { x = 128.24, y = -1896.88, z = 23.67, shell = 1 },
    [309] = { x = 148.9, y = -1904.56, z = 23.53, shell = 1 },
    [310] = { x = 179.32, y = -1924.05, z = 21.37, shell = 1 },
    [311] = { x = 164.94, y = -1945.07, z = 20.23, shell = 1 },
    [312] = { x = 148.97, y = -1960.39, z = 19.45, shell = 1 },
    [313] = { x = 144.13, y = -1968.87, z = 18.85, shell = 1 },
    [314] = { x = 76.17, y = -1948.22, z = 21.17, shell = 1 },
    [315] = { x = 332.94, y = -1740.89, z = 29.73, shell = 1 },
    [316] = { x = -1117.89, y = -1488.46, z = 4.73, shell = 1 },
    [317] = { x = -1108.97, y = -1482.34, z = 4.93, shell = 1 },
    [318] = { x = -1091.12, y = -1485.34, z = 5.3, shell = 1 },
    [319] = { x = -1085.88, y = -1504.01, z = 5.7, shell = 1 },
    [320] = { x = -1091.09, y = -1517.09, z = 4.82, shell = 1 },
    [321] = { x = -1087.32, y = -1529.12, z = 4.69, shell = 1 },
    [322] = { x = -1101.69, y = -1536.91, z = 4.57, shell = 1 },
    [323] = { x = -1150.75, y = -1519.41, z = 4.35, shell = 1 },
    [324] = { x = -1144.27, y = -1528.82, z = 4.34, shell = 1 },
    [325] = { x = -1122.96, y = -1557.55, z = 5.37, shell = 1 },
    [326] = { x = -1134.75, y = -1568.72, z = 4.4, shell = 1 },
    [327] = { x = -1155.48, y = -1574.58, z = 8.34, shell = 1 },
    [328] = { x = -1183.05, y = -1556.7, z = 5.04, shell = 1 },
    [329] = { x = -1161.57, y = -1532.65, z = 4.53, shell = 1 },
    [330] = { x = -1114.67, y = -1577.66, z = 4.54, shell = 1 },
    [331] = { x = -1120.05, y = -1583.12, z = 8.67, shell = 1 },
    [332] = { x = -1105.43, y = -1596.84, z = 4.61, shell = 1 },
    [333] = { x = -1093.55, y = -1608.27, z = 8.45, shell = 1 },
    [334] = { x = -1078.65, y = -1616.55, z = 4.43, shell = 1 },
    [335] = { x = -1077.07, y = -1621.15, z = 4.47, shell = 1 },
    [336] = { x = -1071.76, y = -1636.64, z = 8.19, shell = 1 },
    [337] = { x = -1063.19, y = -1641.33, z = 4.48, shell = 1 },
    [338] = { x = -1058.41, y = -1643.25, z = 4.48, shell = 1 },
    [339] = { x = -1059.74, y = -1658.52, z = 4.67, shell = 1 },
    [340] = { x = -1098.20, y = -1678.63, z = 4.35, shell = 1 },
    [341] = { x = -1097.41, y = -1673.04, z = 8.38, shell = 1 },
    [342] = { x = -1256.17, y = -1330.79, z = 4.07, shell = 1 },
    [343] = { x = -1246.83, y = -1358.23, z = 7.82, shell = 1 },
    [344] = { x = -1269.98, y = -1296.36, z = 4.0, shell = 1 },
    [345] = { x = -1300.55, y = -1233.39, z = 4.48, shell = 1 },
    [346] = { x = -1306.35, y = -1226.64, z = 8.98, shell = 1 },
    [347] = { x = -1317.77, y = -1241.04, z = 7.16, shell = 1 },
    [348] = { x = -1322.84, y = -1226.83, z = 7.14, shell = 1 },
    [349] = { x = -1331.48, y = -1176.80, z = 4.5, shell = 1 },
    [350] = { x = -1337.68, y = -1161.64, z = 4.5, shell = 1 },
    [351] = { x = -1336.06, y = -1146.94, z = 6.73, shell = 1 },
    [352] = { x = -1328.89, y = -1134.84, z = 9.63, shell = 1 },
    [353] = { x = -1564.72, y = -300.08, z = 48.24, shell = 1 },
    [354] = { x = -1574.80, y = -290.19, z = 48.27, shell = 1 },
    [355] = { x = -1582.48, y = -278.06, z = 48.27, shell = 1 },
    [356] = { x = -1583.66, y = -265.57, z = 48.27, shell = 1 },
    [357] = { x = -1569.46, y = -233.06, z = 49.56, shell = 1 },
    [358] = { x = -1560.76, y = -274.85, z = 48.27, shell = 1 },
    [359] = { x = -1550.15, y = -284.37, z = 48.27, shell = 1 },
    [360] = { x = -1542.84, y = -278.71, z = 48.28, shell = 1 },
    [361] = { x = -1536.53, y = -270.48, z = 48.27, shell = 1 },
    [362] = { x = -1533.22, y = -260.39, z = 48.27, shell = 1 },
    [363] = { x = -1538.36, y = -254.65, z = 48.27, shell = 1 },
    [364] = { x = -1555.13, y = -289.93, z = 48.27, shell = 1 },
    [365] = { x = -1651.74, y = -369.74, z = 49.85, shell = 1 },
    [366] = { x = -1658.87, y = -375.53, z = 49.36, shell = 1 },
    [367] = { x = -1668.45, y = -385.04, z = 48.9, shell = 1 },
    [368] = { x = -1678.28, y = -408.62, z = 43.92, shell = 1 },
    [369] = { x = -1705.41, y = -433.42, z = 42.17, shell = 1 },
    [370] = { x = -1715.49, y = -438.68, z = 42.65, shell = 1 },
    [371] = { x = -1715.51, y = -447.22, z = 42.64, shell = 1 },
    [372] = { x = -1707.01, y = -453.26, z = 42.64, shell = 1 },
    [373] = { x = -1698.13, y = -460.51, z = 41.64, shell = 1 },
    [374] = { x = -1693.06, y = -464.64, z = 41.64, shell = 1 },
    [375] = { x = -1699.85, y = -474.67, z = 41.64, shell = 1 },
    [376] = { x = -1704.66, y = -480.57, z = 41.64, shell = 1 },
    [377] = { x = -1709.71, y = -481.02, z = 41.64, shell = 1 },
    [378] = { x = -1713.44, y = -470.60, z = 41.64, shell = 1 },
    [379] = { x = -1714.15, y = -463.69, z = 41.64, shell = 1 },
}

local vaultPaintings = {
    "ch_prop_vault_painting_01a",
    "ch_prop_vault_painting_01b",
    "ch_prop_vault_painting_01c",
    "ch_prop_vault_painting_01d",
    "ch_prop_vault_painting_01e",
    "ch_prop_vault_painting_01f",
    "ch_prop_vault_painting_01g",
    "ch_prop_vault_painting_01h",
    "ch_prop_vault_painting_01i",
    "ch_prop_vault_painting_01j",
}

local Shells = {
    [1] = {
        shellType = "furnitured_lowapart",
        offset = vector4(4.94, -1.31, 2.55, 10.0),
        aioffset = vector4(2.32, -4.52, 2.10, 90.0),
        dogoffset = vector4(6.21, 0.41, 2.10, 180.0),
        paintaings = {},
        items = {
            { name = "skabe", offset = vector3(3.75, 4.88, 2.60), isSearched = false },
            { name = "hylde", offset = vector3(2.18, 3.96, 2.60), isSearched = false },
            { name = "kommode", offset = vector3(1.13, -2.64, 2.10), isSearched = false },
            { name = "sengen", offset = vector3(2.79, -3.12, 2.20), isSearched = false },
            { name = "sofaen", offset = vector3(0.27, 3.57, 2.10), isSearched = false },
        }
    }, -- 1061.04 -378.61 -29.11
    [2] = {
        shellType = "furnitured_midapart",
        offset = vector4(1.46, -10.17, 0.53, 0.0),
        aioffset = vector4(4.50, 6.70, 0.14, 270.0),
        dogoffset = vector4(-1.06, 3.88, 0.12, 270.0),
        paintings = {
            {
                scenePos = vector3(2.802, -1.75, 0.18174),
                sceneRot = vector3(0.0, 0.0, -90.0),
                object = "ch_prop_vault_painting_01e",
                offset = vector4(3.28, -1.75, 1.38174, 270.0),
            }, {
                scenePos = vector3(2.65, 0.358, 0.18174),
                sceneRot = vector3(0.0, 0.0, 180.0),
                object = "ch_prop_vault_painting_01i",
                offset = vector4(2.65, -0.12, 1.38174, 180.0),
            }, {
                scenePos = vector3(4.68, 3.188, 0.18174),
                sceneRot = vector3(0.0, 0.0, 180.0),
                object = "ch_prop_vault_painting_01h",
                offset = vector4(4.68, 2.71, 1.38174, 180.0),
            }, {
                scenePos = vector3(-7.262, 2.85, 0.18174),
                sceneRot = vector3(0.0, 0.0, 90.0),
                object = "ch_prop_vault_painting_01j",
                offset = vector4(-7.84, 2.85, 1.38174, 90.0),
            },
        },
        items = {
            { name = "skabe", offset = vector3(-3.01, -0.60, 0.50), isSearched = false },
            { name = "hylde", offset = vector3(-7.01, 4.47, 0.50), isSearched = false },
            { name = "sengen", offset = vector3(4.76, 5.37, 0.0), isSearched = false },
            { name = "kl??deskab", offset = vector3(5.97, 9.44, 0.50), isSearched = false },
            { name = "skuffe", offset = vector3(0.94, 1.21, 0.12), isSearched = false },
        }
    }, -- 1058.92 -408.96 -31.21
    [3] = {
        shellType = "modernhotel_shell",
        offset = vector4(4.95, 4.36, 0.53, 180.0),
        aioffset = vector4(-4.36, 0.14, 1.04, 270.0),
        dogoffset = vector4(-5.71, 3.35, 1.75, 250.0),
        paintings = {
            {
                scenePos = vector3(-5.942, -2.82, 0.18174),
                sceneRot = vector3(0.0, 0.0, 90.0),
                object = "ch_prop_vault_painting_01e",
                offset = vector4(-6.42, -2.82, 1.38174, 90.0),
            }, {
                scenePos = vector3(-5.942, 3.07, 0.18174),
                sceneRot = vector3(0.0, 0.0, 90.0),
                object = "ch_prop_vault_painting_01i",
                offset = vector4(-6.42, 3.07, 1.38174, 90.0),
            }, {
                scenePos = vector3(5.942, -2.82, 0.18174),
                sceneRot = vector3(0.0, 0.0, -90.0),
                object = "ch_prop_vault_painting_01h",
                offset = vector4(6.45, -2.82, 1.38174, 270.0),
            }, {
                scenePos = vector3(5.942, 3.07, 0.18174),
                sceneRot = vector3(0.0, 0.0, -90.0),
                object = "ch_prop_vault_painting_01j",
                offset = vector4(6.45, 3.07, 1.38174, 270.0),
            }
        },
        items = {
            { name = "skabe", offset = vector3(5.65, 0.06, 0.20), isSearched = false },
            { name = "skabe", offset = vector3(-4.53, -3.62, 0.83), isSearched = false },
            { name = "skabe", offset = vector3(-1.42, -3.62, 0.83), isSearched = false },
            { name = "skabe", offset = vector3(1.43, -3.62, 0.83), isSearched = false },
            { name = "skabe", offset = vector3(4.49, -3.62, 0.83), isSearched = false },
        }
    }, -- -431.81 83.57 -29.50
}

local jobName = "houseRobbery"

local robbedHouseID = 0
local shellUsed

local myRobbableItems = {}
local isRobbing = false
local PoliceAlerted = false

local paintingObjects = {}
local paintingZones = {}

local robberyped = nil
local robberydog = nil
local isPedSpawned = false
local isDogSpawned = false
local isAgro = false
local isDogAgro = false

local disturbanceTime = 0
local disturbance = 0

local boxZonesHouses = {}
local hasHouseRobLoop = false

StartHouseRobberyLoop = function()
    if Config.Jobs[jobName] ~= true then
        return
    end

    for houseID, _ in pairs(boxZonesHouses) do
        local zoneName = houseID .. "_house_robbery"
        exports.qtarget:

RemoveZone(zoneName)
        boxZonesHouses[houseID] = nil
    end

    if hasHouseRobLoop then
        return
    end

    hasHouseRobLoop = true
    collectgarbage()

    Citizen.CreateThread(function()
        while hasHouseRobLoop do
            Wait(5000)
            RefreshNear()
        end
    end)
end

InsideHouseRobberyLoop = function()
    Citizen.CreateThread(function()
        while isRobbing do
            Citizen.Wait(2)

            local letSleep = true
            local house = robbableHouses[robbedHouseID]
            if house ~= nil and not hasTask then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)

                local offset = Shells[house.shell]["offset"]
                local exitCoords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)
                local exitDistance = #(playerCoords - exitCoords)

                if exitDistance <= 1.5 then
                    letSleep = false

                    ESX.ShowHelpNotification('Tryk ~INPUT_VEH_HEADLIGHT~ for at g?? ud af huset~')
                    if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                        Time = GetGameTimer()
                        EndHouseRobbery()
                    end
                end

                for i = 1, #myRobbableItems do
                    local item = myRobbableItems[i]
                    local itemCoords = vector3(house.x + item["offset"].x, house.y + item["offset"].y, house.z + item["offset"].z + Config.SpawnOffset.z)
                    local itemdistance = #(playerCoords - itemCoords)

                    if itemdistance <= 1.5 and not item['isSearched'] then
                        letSleep = false

                        DrawText3D(itemCoords.x, itemCoords.y, itemCoords.z + 1.0, 'Tryk ~r~[H]~w~ gennems??ge ' .. item["name"])
                        if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                            Time = GetGameTimer()
                            item['isSearched'] = true

                            if isPedSpawned or isDogSpawned then
                                DisturbanceManager('looting')
                            end

                            local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

                            RequestAnimDict(animDict)
                            while not HasAnimDictLoaded(animDict) do
                                RequestAnimDict(animDict)
                                Citizen.Wait(10)
                            end

                            TaskPlayAnim(playerPed, animDict, "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 1, 0, 0, 0)
                            FreezeEntityPosition(playerPed, true)

                            exports['progressBars']:startUI(20000, 'Leder i ' .. item["name"])
                            Citizen.Wait(20000)

                            FreezeEntityPosition(playerPed, false)
                            ClearPedTasksImmediately(playerPed)
                            RemoveAnimDict(animDict)

                            GiveReward(false)
                        end
                    end
                end

                if (isPedSpawned or isDogSpawned) then
                    if IsPedShooting(playerPed) then
                        DisturbanceManager('shooting')
                    end

                    if GetPlayerCurrentStealthNoise(PlayerId()) >= 4.7 then
                        DisturbanceManager('running')
                    end
                end

                if letSleep then
                    Citizen.Wait(500)
                end
            end
        end
    end)
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)
RefreshNear = function()
    if not isRobbing then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for houseID, house in pairs(robbableHouses) do
            local houseCoords = vector3(house.x, house.y, house.z)
            local distance = #(houseCoords - playerCoords)
            local zoneName = houseID .. "_house_robbery"

            if distance <= 30.0 and boxZonesHouses[houseID] == nil then
                local robLabel = "R??v Hus"
                if ValidateJob('police') then
                    robLabel = "G?? ind i Hus"
                end

                boxZonesHouses[houseID] = true
                exports.qtarget:


AddBoxZone(zoneName, houseCoords, 2.8, 2.8, {
                    name = zoneName,
                    minZ = houseCoords.z - 0.6,
                    maxZ = houseCoords.z + 0.6,
                }, {
                    options = {
                        {
                            icon = "fad fa-house",
                            label = robLabel,
                            action = function()
                                local playerPed = PlayerPedId()
                                local _, wep = GetCurrentPedWeapon(playerPed)
                                local playerCoords = GetEntityCoords(playerPed)
                                local coords = GetEntityCoords(playerPed)
                                local streetName,_ = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                                streetName = GetStreetNameFromHashKey(streetName)
                                if wep ~= GetHashKey("WEAPON_UNARMED") then
                                    exports['mythic_notify']:SendAlert("error", 'Du kan ikke have et v??ben i din h??nd.')
                                    return
                                end


                                if ValidateJob('police') then
                                    CreateHouse(houseID, true)
                                end

                                if not ValidateJob('police') then
                                    ESX.TriggerServerCallback("srp_illegaljobs:checkItem", function(hasItem)
                                        print(hasItem)
                                        if not hasItem then
                                            return
                                        end
                                
                                        if hasItem then
                                            hasTask = true
                                
                                            TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'mechanic4')
                                            FreezeEntityPosition(playerPed, true)
                                
                                            TriggerEvent("srp_illegaljobs:StartLockpickMinigame", 3, 8, function(didWin)
                                                if not didWin then
                                                    exports['mythic_notify']:SendAlert('error', 'Du ??delagde din lockpick!', 5000)
                                                    TriggerServerEvent('srp_illegaljobs:removelockp')

                                                    TriggerServerEvent('id_alerts:sendAlert', 'HouseRobbery', coords, streetName, streetName)
                                                   -- TriggerServerEvent("opkaldsliste:addCall", "Hus-alarm", "Mist??nkelig adf??rd i boligomr??de!", "police", playerCoords)
                                                end
                                
                                                if didWin then
                                                    CreateHouse(houseID, HouseRobbed)
                                                   
                                                end
                                
                                                TriggerEvent('srp_animation:EmoteCancel')
                                                FreezeEntityPosition(playerPed, false)
                                
                                                hasTask = false
                                            end)
                                        end
                                    end, "lockpick_advanced")
                                
                                end

                            end,
                            canInteract = function()
                                return not hasTask
                            end,
                        },
                    },
                    distance = 2
                })
            end

            if distance > 30.0 and boxZonesHouses[houseID] ~= nil then
                boxZonesHouses[houseID] = nil
                exports.qtarget:

RemoveZone(zoneName)
            end
        end

        if not HasValidJob() then
            for houseID, house in pairs(robbableHouses) do
                if boxZonesHouses[houseID] ~= nil then
                    boxZonesHouses[houseID] = nil
                    exports.qtarget:

RemoveZone(zoneName)
                end
            end

            hasHouseRobLoop = false
        end
    end
end



CreateHouse = function(id, isRobbed)
    robbedHouseID = id

    local house = robbableHouses[robbedHouseID]
    myRobbableItems = Shells[house.shell]["items"]

    for i = 1, #myRobbableItems do
        myRobbableItems[i]['isSearched'] = false
    end

    AlertPoliceHouse()
    Citizen.Wait(500)

    DoScreenFadeOut(100)
    Citizen.Wait(100)

    local isNight = isNight()
    BuildHouse(house, isNight, isRobbed)

    DoScreenFadeIn(100)
    Citizen.Wait(100)

    SetWeatherAndTime(false)
    isRobbing = true

    Citizen.Wait(2000)
    DisturbanceManager('entering')

    InsideHouseRobberyLoop()
end

GiveReward = function(isSafe)
    TriggerServerEvent('srp_illegaljobs:Search')

end

EndHouseRobbery = function()
    DoScreenFadeOut(100)
    Citizen.Wait(100)

    DeleteShell()
    Citizen.Wait(1000)

    local house = robbableHouses[robbedHouseID]
    local playerPed = PlayerPedId()

    SetEntityCoords(playerPed, house.x, house.y, house.z)
    SetPedDiesInWater(playerPed, true)
    SetWeatherAndTime(true)

    if not ValidateJob('police') then
        TriggerServerEvent('srp_illegaljobs:DoneHouse', robbedHouseID)
        TriggerServerEvent('srp_illegaljobs:removeRobber', jobName)
    end

    if DoesEntityExist(robberyped) then
        DeleteEntity(robberyped)
    end

    if DoesEntityExist(robberydog) then
        DeleteEntity(robberydog)
    end

    hasTask = false
    isPedSpawned = false
    isAgro = false
    PoliceAlerted = false
    isRobbing = false
    robbedHouseID = 0
    disturbance = 0
    myRobbableItems = {}
    shellUsed = nil

    DoScreenFadeIn(100)
    Citizen.Wait(100)

    collectgarbage()
    isDogSpawned = false
end

DisturbanceManager = function(type)
    if isPedSpawned and (GetGameTimer() - disturbanceTime) > 1000 then
        if type == 'looting' then
            disturbance = disturbance + 10.0
        end

        if type == 'shooting' then
            disturbanceTime = GetGameTimer()
            disturbance = disturbance + 100.0
        end

        if type == 'running' then
            disturbanceTime = GetGameTimer()

            local noise = GetPlayerCurrentStealthNoise(PlayerId()) / 2
            disturbance = disturbance + noise
        end

        if disturbance >= 80 and not isAgro then
            agroNPC()
        end
    end

    if isDogSpawned and not isDogAgro then
        Citizen.CreateThread(function()
            Citizen.Wait(3000)

            TaskCombatPed(robberydog, PlayerPedId(), 0, 16)
            SetPedKeepTask(robberydog, true)

            isDogAgro = true
        end)
    end
end

AlertPoliceHouse = function()
    if not PoliceAlerted then
        PoliceAlerted = true
        local text = "Mist??nkelig adf??rd!"
        AlertAuthorities('suspicious', text, 20.0, 40)
    end
end

SpawnAI = function(house)
    local offset = Shells[house.shell]["aioffset"]
    local coords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)

    local hash = GetHashKey("a_m_m_beach_02")
    local pedType = GetPedType(hash)

    SpawnPed(hash, coords, offset.w, pedType, function(ped)
        while GetPedRelationshipGroupHash(ped) ~= GetHashKey("KOS") do
            Wait(0)
            SetPedRelationshipGroupHash(ped, GetHashKey("KOS"))
        end

        SetPedFleeAttributes(ped, 0, false)
        SetPedCombatAttributes(ped, 46, 1)
        SetPedCombatAbility(ped, 100)
        SetPedCombatMovement(ped, 3)
        SetPedCombatRange(ped, 2)
        SetPedKeepTask(ped, true)
        SetPedAccuracy(ped, 60)
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true)
        SetEntityAsMissionEntity(ped)

        loadAnimDict("dead")
        TaskPlayAnim(ped, "dead", 'dead_a', 100.0, 1.0, -1, 1, 0, 0, 0, 0)
        TriggerEvent('blockdrugs', ped)

        robberyped = ped
        isPedSpawned = true
    end)
end

SpawnDog = function(house)
    local offset = Shells[house.shell]["dogoffset"]
    local coords = vector3(house.x + offset.x, house.y + offset.y, house.z + offset.z + Config.SpawnOffset.z)

    local hash = GetHashKey("a_c_rottweiler")
    local pedType = GetPedType(hash)

    if GetPedRelationshipGroupHash(robberyped) ~= GetHashKey("KOS") then
        SetPedRelationshipGroupHash(robberyped, GetHashKey("KOS"))
    end

    SpawnPed(hash, coords, offset.w, pedType, function(ped)
        robberydog = ped
        isDogSpawned = true
    end)
end

agroNPC = function()
    GiveWeaponToPed(robberyped, GetHashKey('WEAPON_BAT'), 150, 0, 1)
    TaskCombatPed(robberyped, PlayerPedId(), 0, 16)

    isAgro = true
end

closestNPC = function()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom = 999.0
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if distance < 25.0 and ped ~= PlayerPedId() and not IsPedAPlayer(ped) then
            if (distance < distanceFrom) then
                distanceFrom = distance
                rped = ped
            end
        end
        success, ped = FindNextPed(handle)
    until not success

    EndFindPed(handle)
    return distanceFrom, rped
end

BuildHouse = function(house, isNight, isRobbed)
    local plyPed = PlayerPedId()
    FreezeEntityPosition(plyPed, true)

    local generator = { x = house.x, y = house.y, z = house.z }
    local shellType = Shells[house.shell]["shellType"]
    local offset = Shells[house.shell]["offset"]

    local model = shellType
    local hash  = GetHashKey(model)

    local start = GetGameTimer()
    RequestModel(hash)
    while not HasModelLoaded(hash) and GetGameTimer() - start < 30000 do
        Wait(0);
    end

    if not HasModelLoaded(hash) then
        return
    end

    local shell = CreateObject(hash, generator.x + Config.SpawnOffset.x, generator.y + Config.SpawnOffset.y, generator.z + Config.SpawnOffset.z, false, false, false)
    FreezeEntityPosition(shell, true)
    table.insert(objects, shell)

    start = GetGameTimer()
    while not DoesEntityExist(shell) and GetGameTimer() - start < 30000 do
        Wait(0);
    end

    if not DoesEntityExist(shell) then
        return
    end

    shellUsed = shell
    SetEntityAsMissionEntity(shell, true, true)
    SetModelAsNoLongerNeeded(hash)

    local chance = 80
    if not isNight then
        chance = 40
    end

    if not isRobbed then


        local paintings = Shells[house.shell]["paintings"]
        if paintings then
            for k, v in pairs(paintings) do
                local paintingObject = vaultPaintings[math.random(1, #vaultPaintings)]
                loadModel(paintingObject)

                local paitaingCoords = vector3(generator.x + v.offset.x, generator.y + v.offset.y, generator.z + v.offset.z + Config.SpawnOffset.z)
                local painting = CreateObjectNoOffset(GetHashKey(paintingObject), paitaingCoords, 1, 1, 0)

                SetEntityRotation(painting, 0, 0, v.offset.w, 2, true)
                SetModelAsNoLongerNeeded(GetHashKey(paintingObject))

                local EntityZoneName = k .. "_painting"
                paintingZones[EntityZoneName] = true

                local paintingCoords = GetEntityCoords(painting)
                exports.qtarget:


AddBoxZone(EntityZoneName, paintingCoords, 1.0, 1.0, {
                    name = EntityZoneName,
                    minZ = paintingCoords.z - 0.2,
                    maxZ = paintingCoords.z + 1.2,
                    debugPoly = false,
                }, {
                    options = {
                        {
                            icon = "fas fa-pencil-paintbrush",
                            label = "R??v Maleri",
                            action = function()
                                HeistAnimation(house, k, v)
                            end,
                            canInteract = function()
                                return not hasTask
                            end,
                        },
                    },
                    distance = 1.0
                })

                table.insert(objects, painting)
                table.insert(paintingObjects, painting)
            end
        end
    end

    SetEntityCoordsNoOffset(plyPed, generator.x + offset.x, generator.y + offset.y, generator.z + offset.z + Config.SpawnOffset.z)
    SetEntityHeading(plyPed, offset.w)

    local start_time = GetGameTimer()
    while (not HasCollisionLoadedAroundEntity(plyPed) and GetGameTimer() - start_time < 5000) do
        Wait(0);
    end

    FreezeEntityPosition(plyPed, false)
    SetPedDiesInWater(plyPed, false)
end

DeleteShell = function()
    if DoesEntityExist(robberyped) then
        DeletePed(robberyped)
    end

    if DoesEntityExist(robberydog) then
        DeletePed(robberydog)
    end

    DeleteObject(shellUsed)

    for i = 1, #paintingObjects, 1 do
        if DoesEntityExist(paintingObjects[i]) then
            DeleteEntity(paintingObjects[i])
        end
    end

    for key, _ in pairs(paintingZones) do
        exports.qtarget:

RemoveZone(key)
    end

    paintingObjects = {}
    paintingZones = {}
end

SetWeatherAndTime = function(syncTime)
    if not syncTime then
        TriggerEvent('vSync:toggle', false, 01)
    end

    if syncTime then
        TriggerEvent('vSync:toggle', true)
        TriggerServerEvent('vSync:requestSync')
    end
end

local ArtHeist = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'w_me_switchblade'
    },
    ['animations'] = {
        { "top_left_enter", "top_left_enter_ch_prop_ch_sec_cabinet_02a", "top_left_enter_ch_prop_vault_painting_01a", "top_left_enter_hei_p_m_bag_var22_arm_s", "top_left_enter_w_me_switchblade" },
        { "cutting_top_left_idle", "cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_idle_ch_prop_vault_painting_01a", "cutting_top_left_idle_hei_p_m_bag_var22_arm_s", "cutting_top_left_idle_w_me_switchblade" },
        { "cutting_top_left_to_right", "cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_to_right_ch_prop_vault_painting_01a", "cutting_top_left_to_right_hei_p_m_bag_var22_arm_s", "cutting_top_left_to_right_w_me_switchblade" },
        { "cutting_top_right_idle", "_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_right_idle_ch_prop_vault_painting_01a", "cutting_top_right_idle_hei_p_m_bag_var22_arm_s", "cutting_top_right_idle_w_me_switchblade" },
        { "cutting_right_top_to_bottom", "cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_right_top_to_bottom_ch_prop_vault_painting_01a", "cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_right_top_to_bottom_w_me_switchblade" },
        { "cutting_bottom_right_idle", "cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_idle_ch_prop_vault_painting_01a", "cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_idle_w_me_switchblade" },
        { "cutting_bottom_right_to_left", "cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_to_left_ch_prop_vault_painting_01a", "cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_to_left_w_me_switchblade" },
        { "cutting_bottom_left_idle", "cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_left_idle_ch_prop_vault_painting_01a", "cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_left_idle_w_me_switchblade" },
        { "cutting_left_top_to_bottom", "cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_left_top_to_bottom_ch_prop_vault_painting_01a", "cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_left_top_to_bottom_w_me_switchblade" },
        { "with_painting_exit", "with_painting_exit_ch_prop_ch_sec_cabinet_02a", "with_painting_exit_ch_prop_vault_painting_01a", "with_painting_exit_hei_p_m_bag_var22_arm_s", "with_painting_exit_w_me_switchblade" },
    },
}

local paintingScenes = {}
local sceneObjects = {}

HeistAnimation = function(house, key, scene)
    hasTask = true

    local ped = PlayerPedId()
    local _, wep = GetCurrentPedWeapon(ped)
    if wep ~= GetHashKey("WEAPON_SWITCHBLADE") then
        exports['mythic_notify']:SendAlert("error", 'Du skal have en foldekniv i din h??nd.')
        hasTask = false
        return
    end

    local EntityZoneName = key .. "_painting"
    exports.qtarget:

RemoveZone(EntityZoneName)

    local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
    local scenes = { false, false, false, false }

    local animDict = "anim_heist@hs3f@ig11_steal_painting@male@"
    while (not HasAnimDictLoaded(animDict)) do
        RequestAnimDict(animDict)
        Citizen.Wait(5)
    end

    for i = 1, #ArtHeist['objects'] do
        local model = ArtHeist['objects'][i]
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10);
        end

        sceneObjects[i] = CreateObject(GetHashKey(model), pedCo, 1, 1, 0)
        SetEntityCollision(sceneObjects[i], false, true)
        table.insert(objects, sceneObjects[i])
    end

    sceneObjects[3] = paintingObjects[key]

    local sceneOffset = scene['scenePos']
    local sceneCoords = vector3(house.x + sceneOffset.x, house.y + sceneOffset.y, house.z + sceneOffset.z + Config.SpawnOffset.z)

    for i = 1, 10 do
        paintingScenes[i] = NetworkCreateSynchronisedScene(sceneCoords.x, sceneCoords.y, sceneCoords.z, scene['sceneRot'], 2, true, false, 1065353216, 0, 1065353216)
        NetworkAddPedToSynchronisedScene(ped, paintingScenes[i], animDict, 'ver_01_' .. ArtHeist['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(sceneObjects[3], paintingScenes[i], animDict, 'ver_01_' .. ArtHeist['animations'][i][3], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObjects[1], paintingScenes[i], animDict, 'ver_01_' .. ArtHeist['animations'][i][4], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObjects[2], paintingScenes[i], animDict, 'ver_01_' .. ArtHeist['animations'][i][5], 1.0, -1.0, 1148846080)
    end

    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)

    FreezeEntityPosition(ped, true)
    NetworkStartSynchronisedScene(paintingScenes[1])
    PlayCamAnim(cam, 'ver_01_top_left_enter_cam_ble', animDict, sceneCoords, scene['sceneRot'], 0, 2)
    Wait(3000)

    NetworkStartSynchronisedScene(paintingScenes[2])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_idle_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)

    repeat
        ShowHelpNotification("Tryk ~INPUT_CONTEXT~ for at sk??re til h??jre")
        if IsControlJustPressed(0, 38) then
            scenes[1] = true
        end
        Wait(1)
    until scenes[1] == true

    NetworkStartSynchronisedScene(paintingScenes[3])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_to_right_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(paintingScenes[4])
    PlayCamAnim(cam, 'ver_01_cutting_top_right_idle_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)

    repeat
        ShowHelpNotification("Tryk ~INPUT_CONTEXT~ for at sk??re ned")
        if IsControlJustPressed(0, 38) then
            scenes[2] = true
        end
        Wait(1)
    until scenes[2] == true

    NetworkStartSynchronisedScene(paintingScenes[5])
    PlayCamAnim(cam, 'ver_01_cutting_right_top_to_bottom_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(paintingScenes[6])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_idle_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)

    repeat
        ShowHelpNotification("Tryk ~INPUT_CONTEXT~ for at sk??re til venstre")
        if IsControlJustPressed(0, 38) then
            scenes[3] = true
        end
        Wait(1)
    until scenes[3] == true

    NetworkStartSynchronisedScene(paintingScenes[7])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_to_left_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)
    Wait(3000)

    repeat
        ShowHelpNotification("Tryk ~INPUT_CONTEXT~ for at sk??re ned")
        if IsControlJustPressed(0, 38) then
            scenes[4] = true
        end
        Wait(1)
    until scenes[4] == true

    NetworkStartSynchronisedScene(paintingScenes[9])
    PlayCamAnim(cam, 'ver_01_cutting_left_top_to_bottom_cam', animDict, sceneCoords, scene['sceneRot'], 0, 2)
    Wait(1500)

    NetworkStartSynchronisedScene(paintingScenes[10])

    DestroyCam(cam, false)
    RenderScriptCams(false, 900, 900, true, false)
    Wait(7500)

    TriggerServerEvent('srp_illegaljobs:RewardPainting')

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    RemoveAnimDict(animDict)

    for k, v in pairs(ArtHeist['objects']) do
        SetModelAsNoLongerNeeded(v)
    end

    for k, v in pairs(sceneObjects) do
        DeleteObject(v)
    end

    paintingScenes = {}
    sceneObjects = {}

    hasTask = false
end
