local colors = {
    {name = "Sort", colorindex = 0}, {name = "Carbon Sort", colorindex = 147},
    {name = "Grafit", colorindex = 1}, {name = "Anhracite Sort", colorindex = 11},
    {name = "Black Steel", colorindex = 2}, {name = "Mørk Stål", colorindex = 3},
    {name = "Sølv", colorindex = 4}, {name = "Bluish Silver", colorindex = 5},
    {name = "Rullet Stål", colorindex = 6}, {name = "Skygge Sølv", colorindex = 7},
    {name = "Sten Sølv", colorindex = 8}, {name = "Midnats Sølv", colorindex = 9},
    {name = "Støbejerns Sølv", colorindex = 10}, {name = "Rød", colorindex = 27},
    {name = "Torino Rød", colorindex = 28}, {name = "Formula Rød", colorindex = 29},
    {name = "Lava Rød", colorindex = 150}, {name = "Stråle Rød", colorindex = 30},
    {name = "Pryde Red", colorindex = 31}, {name = "Granatred", colorindex = 32},
    {name = "Solnedgangs Rød", colorindex = 33}, {name = "Cabernet Rød", colorindex = 34},
    {name = "Vin Rød", colorindex = 143}, {name = "Slik Rød", colorindex = 35},
    {name = "Hot Pink", colorindex = 135}, {name = "Pfsiter Pink", colorindex = 137},
    {name = "Lakse Pink", colorindex = 136}, {name = "Solopgangs Orange", colorindex = 36},
    {name = "Orange", colorindex = 38}, {name = "Lys Orange", colorindex = 138},
    {name = "Guld", colorindex = 37}, {name = "Bronze", colorindex = 90},
    {name = "Gul", colorindex = 88}, {name = "Race Gul", colorindex = 89},
    {name = "Dug Gul", colorindex = 91}, {name = "Mørk Grøn", colorindex = 49},
    {name = "Racing Grød", colorindex = 50}, {name = "Hav Grøn", colorindex = 51},
    {name = "Oliven Grøn", colorindex = 52}, {name = "Lys Grøn", colorindex = 53},
    {name = "Brændstofs Grøn", colorindex = 54}, {name = "Lime Grøn", colorindex = 92},
    {name = "Midnats Blå", colorindex = 141},
    {name = "Galaxe Blå", colorindex = 61}, {name = "Mørk Blå", colorindex = 62},
    {name = "Saxon Blå", colorindex = 63}, {name = "Blå", colorindex = 64},
    {name = "Marine Blå", colorindex = 65}, {name = "Havne Blå", colorindex = 66},
    {name = "Diamand Blå", colorindex = 67}, {name = "Surf Blå", colorindex = 68},
    {name = "Nautisk Blå", colorindex = 69}, {name = "Racing Blå", colorindex = 73},
    {name = "Ultra Blå", colorindex = 70}, {name = "Lys Blå", colorindex = 74},
    {name = "Chocolade Brun", colorindex = 96}, {name = "Bison Brun", colorindex = 101},
    {name = "Creeen Brun", colorindex = 95}, {name = "Feltzer Brun", colorindex = 94},
    {name = "Ahorn Brun", colorindex = 97}, {name = "Bøgetræ Brun", colorindex = 103},
    {name = "Sienna Brun", colorindex = 104}, {name = "Sadel Brun", colorindex = 98},
    {name = "Mos Brun", colorindex = 100}, {name = "Woodbeech Brun", colorindex = 102},
    {name = "Strå Brun", colorindex = 99}, {name = "Sand Brun", colorindex = 105},
    {name = "Afblejet Brun", colorindex = 106}, {name = "Schafter Lilla", colorindex = 71},
    {name = "Spiler Lilla", colorindex = 72}, {name = "Midnats Lilla", colorindex = 142},
    {name = "Lys Lilla", colorindex = 145}, {name = "Fløde", colorindex = 107},
    {name = "Frost Hvid", colorindex = 112}, {name = "Is Hvid", colorindex = 111},
    {name = "Alternativ Blå", colorindex = 140}, {name = "Alternativ Epsilon Blå", colorindex = 157},
    {name = "Alternativ Grøn", colorindex = 139}, {name = "Alternativ Jæger Grøn", colorindex = 144},
    {name = "Alternativ Metallic V Mørke Blå", colorindex = 146}, {name = "Alternativ Metallic Champagne", colorindex = 93},
    {name = "Alternativ Metallic Securicor Grøn", colorindex = 125}, {name = "Alternativ Politibil Blå", colorindex = 127},
    {name = "Alternativ Ren Hvid", colorindex = 134}, {name = "Util Sort", colorindex = 15},
    {name = "Util Sort Poly", colorindex = 16}, {name = "Util Blå", colorindex = 77},
    {name = "Util Lyse Blå", colorindex = 81}, {name = "Util Lys Rød", colorindex = 44},
    {name = "Util Brun", colorindex = 108}, {name = "Util Mørke Blå", colorindex = 75},
    {name = "Util Mørke Grøn", colorindex = 56}, {name = "Util Mørk Sølv", colorindex = 17},
    {name = "Util Granat Rød", colorindex = 45}, {name = "Util Grøn", colorindex = 57},
    {name = "Util Våben Metal", colorindex = 19}, {name = "Util Lyse Brun", colorindex = 110},
    {name = "Util Lyn Blå", colorindex = 79}, {name = "Util Maui Blå Poly", colorindex = 80},
    {name = "Util Medium Brun", colorindex = 109}, {name = "Util Midnats Blå", colorindex = 76},
    {name = "Util Off White", colorindex = 122}, {name = "Util Rød", colorindex = 43},
    {name = "Util Havskums Blå", colorindex = 78}, {name = "Util Skygge Sølv", colorindex = 20},
    {name = "Util Sølv", colorindex = 18},
}

local chameleoncolors = {
    {name = "Monochrome", colorindex = 223},
    {name = "Night & Day", colorindex = 224},
    {name = "The Verlierer", colorindex = 225},
    {name = "Sprunk Extreme", colorindex = 226},
    {name = "Vice City", colorindex = 227},
    {name = "Synthwave Nights", colorindex = 228},
    {name = "Four Seasons", colorindex = 229},
    {name = "Maisonette 9 Throwback", colorindex = 230},
    {name = "Bubblegum", colorindex = 231},
    {name = "Full Rainbow", colorindex = 232},
    {name = "Sunset", colorindex = 233},
    {name = "The Seven", colorindex = 234},
    {name = "Kamen Rider", colorindex = 235},
    {name = "Chromatic Aberration", colorindex = 236},
    {name = "It's Christmas!", colorindex = 237},
    {name = "Temperature", colorindex = 238},
    {name = "Danish Vibes", colorindex = 239},
    {name = "Ice & Water", colorindex = 240},
    {name = "Purple Dream", colorindex = 241},
}

local metalcolors = {
    {name = "Børstet Stål", colorindex = 117},
    {name = "Børstet Sort Stål", colorindex = 118},
    {name = "Børstet Aluminium", colorindex = 119},
    {name = "Ren Guld", colorindex = 158},
    {name = "Børstet Guld", colorindex = 159}
}

local mattecolors = {
    {name = "Sort", colorindex = 12},
    {name = "Slidt Sort", colorindex = 21},
    {name = "Slidt Grafit", colorindex = 22},
    {name = "Grå", colorindex = 13},
    {name = "Lys Grå", colorindex = 14},
    {name = "Slidt Sølv Grå", colorindex = 23},
    {name = "Slidt Sølv", colorindex = 24},
    {name = "Slidt Skygge Sølv", colorindex = 26},
    {name = "Is Hvid", colorindex = 131},
    {name = "Slidt Hvid", colorindex = 132},
    {name = "Slidt Off White", colorindex = 121},
    {name = "Slidt Lyse Blå", colorindex = 87},
    {name = "Blå", colorindex = 83},
    {name = "Slidt Blå", colorindex = 86},
    {name = "Mørk Blå", colorindex = 82},
    {name = "Slidt Mørk Blå", colorindex = 85},
    {name = "Slidt Blå Sølv", colorindex = 25},
    {name = "Midnats Blå", colorindex = 84},
    {name = "Midnats Lilla", colorindex = 149},
    {name = "Schafter Lilla", colorindex = 148},
    {name = "Rød", colorindex = 39},
    {name = "Slidt Rød", colorindex = 46},
    {name = "Mørk Rød", colorindex = 40},
    {name = "Slidt Mørk Rød", colorindex = 48},
    {name = "Slidt Gylden Rød", colorindex = 47},
    {name = "Slidt Lys Orange", colorindex = 124},
    {name = "Orange", colorindex = 41},
    {name = "Slidt Orange #1", colorindex = 130},
    {name = "Slidt Orange #2", colorindex = 123},
    {name = "Gul", colorindex = 42},
    {name = "Gul", colorindex = 126},
    {name = "Lime Grøn", colorindex = 55},
    {name = "Grøn", colorindex = 128},
    {name = "Slidt Grøn", colorindex = 59},
    {name = "Slidt Havvask (Grøn)", colorindex = 60},
    {name = "Slidt Oliven Army Grøn", colorindex = 133},
    {name = "Frost Grøn", colorindex = 151},
    {name = "Løv Grøn", colorindex = 155},
    {name = "Slidt Mørk Grøn", colorindex = 58},
    {name = "Oliven Darb", colorindex = 152},
    {name = "Mørk Jord", colorindex = 153},
    {name = "Slidt Brun", colorindex = 114},
    {name = "Slidt Mørk Brun", colorindex = 115},
    {name = "Ørken", colorindex = 154},
    {name = "Slidt Honing Beige", colorindex = 113},
    {name = "Slidt Strå Beige", colorindex = 116},
}

LSC_Custom_Config = {
    price = {
        primary = 15000,
        secondary = 15000,
        neon = 5000,
        xenon = 5000,
        tire = 3000
    }
}

LSC_Config = {}
LSC_Config.prices = {}
LSC_Config.ModelBlacklist = {}
LSC_Config.lock = true

LSC_Config.prices = {
        windowtint = {
            {name = "Helt Sort", tint = 1, price = 1000},
            {name = "Mørk Røg", tint = 2, price = 1000},
            {name = "Lys Røg", tint = 3, price = 1000},
            {name = "Limo", tint = 4, price = 1000},
            {name = "Grøn", tint = 5, price = 1000},
        },
        
        chrome = {
            colors = {
                {name = "Chrome", colorindex = 120}
            },
            price = 25000
        },
        
        classic = {
            colors = colors,
            price = 12000
        },
        
        matte = {
            colors = mattecolors,
            price = 15000
        },
        
        metallic = {
            colors = colors,
            price = 15000
        },
        
        metal = {
            colors = metalcolors,
            price = 15000
        },

        chameleon = {
            colors = chameleoncolors,
            price = 35000
        },
        
        chrome2 = {
            colors = {
                {name = "Chrome", colorindex = 120}
            },
            price = 25000
        },
        
        classic2 = {
            colors = colors,
            price = 12000
        },
        
        matte2 = {
            colors = mattecolors,
            price = 15000
        },
        
        metallic2 = {
            colors = colors,
            price = 15000
        },
        
        metal2 = {
            colors = metalcolors,
            price = 15000
        },

        chameleon2 = {
            colors = chameleoncolors,
            price = 35000
        },
        
        neonlayout = {
            {name = "Front, Bagende og Sider", price = 5000},
        },
        
        neoncolor = {
            {name = "Hvid", neon = {255, 255, 255}, price = 5000},
            {name = "Blå", neon = {0, 0, 255}, price = 5000},
            {name = "Elektrisk Blå", neon = {0, 150, 255}, price = 5000},
            {name = "Mint Grøn", neon = {50, 255, 155}, price = 5000},
            {name = "Lime Grøn", neon = {0, 255, 0}, price = 5000},
            {name = "Gul", neon = {255, 255, 0}, price = 5000},
            {name = "Gylden Regn", neon = {204, 204, 0}, price = 5000},
            {name = "Orange", neon = {255, 128, 0}, price = 5000},
            {name = "Rød", neon = {255, 0, 0}, price = 5000},
            {name = "Pony Pink", neon = {255, 102, 255}, price = 5000},
            {name = "Hot Pink", neon = {255, 0, 255}, price = 5000},
            {name = "Lilla", neon = {153, 0, 153}, price = 5000},
            {name = "Brun", neon = {139, 69, 19}, price = 5000},
        },

        headlightcolor = {
            {name = "Standart", colorindex = -1, price = 0},
            {name = "Hvid", colorindex = 0, price = 5000},
            {name = "Blå", colorindex = 1, price = 5000},
            {name = "Elektrisk Blå", colorindex = 2, price = 5000},
            {name = "Mint Grøn", colorindex = 3, price = 5000},
            {name = "Lime Grøn", colorindex = 4, price = 5000},
            {name = "Gul", colorindex = 5, price = 5000},
            {name = "Golden Shower", colorindex = 6, price = 5000},
            {name = "Orange", colorindex = 7, price = 5000},
            {name = "Rød", colorindex = 8, price = 5000},
            {name = "Ponny Pink", colorindex = 9, price = 5000},
            {name = "Hot Pink", colorindex = 10, price = 5000},
            {name = "Lilla", colorindex = 11, price = 5000},
            {name = "UV", colorindex = 12, price = 5000},
        },
        
        plates = {
            {name = "Blå på Hvid 1", plateindex = 0, price = 2000},
            {name = "Blå på Hvid 2", plateindex = 3, price = 2000},
            {name = "Blå på Hvid 3", plateindex = 4, price = 2000},
            {name = "Gul og Blå", plateindex = 2, price = 3000},
            {name = "Gul på Sort", plateindex = 1, price = 3000},
        },
        
        wheelaccessories = {
            {name = "Standart Dæk", price = 4000},
            {name = "Tilpassede Dæk", price = 5250},
            {name = "Skudsikre Dæk", price = 8000},
            {name = "Hvid Dæk Røg", smokecolor = {254, 254, 254}, price = 3000},
            {name = "Sort Dæk Røg", smokecolor = {1, 1, 1}, price = 3000},
            {name = "Blå Dæk Røg", smokecolor = {0, 150, 255}, price = 3000},
            {name = "Gul Dæk Røg", smokecolor = {255, 255, 50}, price = 3000},
            {name = "Orange Dæk Røg", smokecolor = {255, 153, 51}, price = 3000},
            {name = "Rød Dæk Røg", smokecolor = {255, 10, 10}, price = 3000},
            {name = "Grøn Dæk Røg", smokecolor = {10, 255, 10}, price = 3000},
            {name = "Lilla Dæk Røg", smokecolor = {153, 10, 153}, price = 3000},
            {name = "Pink Dæk Røg", smokecolor = {255, 102, 178}, price = 3000},
            {name = "Grå Dæk Røg", smokecolor = {128, 128, 128}, price = 3000},
        },
        
        wheelcolor = {
            colors = colors,
            price = 1000,
        },
        
        trim = {
            colors = colors,
            price = 1000
        },
        
        mods = {
            ----------Liveries--------
            [48] = {
                startprice = 15000,
                increaseby = 2500
            },
            
            ----------Windows--------
            [46] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Tank--------
            [45] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Trim--------
            [44] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Aerials--------
            [43] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Arch cover--------
            [42] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Struts--------
            [41] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Air filter--------
            [40] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Engine block--------
            [39] = {
                startprice = 30000,
                increaseby = 12500
            },
            
            ----------Hydraulics--------
            [38] = {
                startprice = 15000,
                increaseby = 5500
            },
            
            ----------Trunk--------
            [37] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Speakers--------
            [36] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Plaques--------
            [35] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Shift leavers--------
            [34] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Steeringwheel--------
            [33] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Seats--------
            [32] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Door speaker--------
            [31] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Dial--------
            [30] = {
                startprice = 5000,
                increaseby = 1250
            },
            ----------Dashboard--------
            [29] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Ornaments--------
            [28] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Trim--------
            [27] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Vanity plates--------
            [26] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ----------Plate holder--------
            [25] = {
                startprice = 5000,
                increaseby = 1250
            },
            
            ---------Headlights---------
            [22] = {
                {name = "Standart Lys", mod = 0, price = 0},
                {name = "Xenon Lys", mod = 1, price = 8300},
            },
            
            ----------Turbo---------
            [18] = {
                {name = "Ingen", mod = 0, price = 0},
                {name = "Turbo Lyd", mod = 1, price = 15000},
            },
            
            -----------Armor-------------
            [16] = {
                {name = "Forstærkning 20%", modtype = 16, mod = 0, price = 25000},
                {name = "Forstærkning 40%", modtype = 16, mod = 1, price = 35000},
                {name = "Forstærkning 60%", modtype = 16, mod = 2, price = 45000},
                {name = "Forstærkning 80%", modtype = 16, mod = 3, price = 55000},
                {name = "Forstærkning 100%", modtype = 16, mod = 4, price = 65000},
            },
            
            ---------Suspension-----------
            [15] = {
                {name = "Sænket Affjedring", mod = 0, price = 4000},
                {name = "Gade Affjedring", mod = 1, price = 6000},
                {name = "Sports Affjedring", mod = 2, price = 7000},
                {name = "Konkurrence Affjedring", mod = 3, price = 8000},
            },
            
            -----------Horn----------
            [14] = {
                {name = "Lastbils Horn", mod = 0, price = 1625},
                {name = "Politi Horn", mod = 1, price = 4062},
                {name = "Klovne Horn", mod = 2, price = 6500},
                {name = "Musical Horn 1", mod = 3, price = 22000},
                {name = "Musical Horn 2", mod = 4, price = 22000},
                {name = "Musical Horn 3", mod = 5, price = 22000},
                {name = "Musical Horn 4", mod = 6, price = 22000},
                {name = "Musical Horn 5", mod = 7, price = 22000},
                {name = "Sadtrombone Horn", mod = 8, price = 22000},
                {name = "Klassisk Horn 1", mod = 9, price = 22000},
                {name = "Klassisk Horn 2", mod = 10, price = 22000},
                {name = "Klassisk Horn 3", mod = 11, price = 22000},
                {name = "Klassisk Horn 4", mod = 12, price = 22000},
                {name = "Klassisk Horn 5", mod = 13, price = 22000},
                {name = "Klassisk Horn 6", mod = 14, price = 22000},
                {name = "Klassisk Horn 7", mod = 15, price = 22000},
                {name = "Scaledo Horn", mod = 16, price = 22000},
                {name = "Scalere Horn", mod = 17, price = 22000},
                {name = "Scalemi Horn", mod = 18, price = 22000},
                {name = "Scalefa Horn", mod = 19, price = 22000},
                {name = "Scalesol Horn", mod = 20, price = 22000},
                {name = "Scalela Horn", mod = 21, price = 22000},
                {name = "Scaleti Horn", mod = 22, price = 22000},
                {name = "Scaledo Horn High", mod = 23, price = 22000},
                {name = "Jazz Horn 1", mod = 25, price = 22000},
                {name = "Jazz Horn 2", mod = 26, price = 22000},
                {name = "Jazz Horn 3", mod = 27, price = 22000},
                {name = "Jazzloop Horn", mod = 28, price = 22000},
                {name = "Starspangban Horn 1", mod = 29, price = 22000},
                {name = "Starspangban Horn 2", mod = 30, price = 22000},
                {name = "Starspangban Horn 3", mod = 31, price = 22000},
                {name = "Starspangban Horn 4", mod = 32, price = 22000},
                {name = "Klassisk Loop Horn 1", mod = 33, price = 22000},
                {name = "Klassisk Loop Horn 2", mod = 34, price = 22000},
                {name = "Klassisk Loop Horn 3", mod = 35, price = 22000},
            },
            
            ----------Transmission---------
            [13] = {
                {name = "Gade Gearkasse", mod = 0, price = 30000},
                {name = "Sports Gearkasse", mod = 1, price = 45000},
                {name = "Race Gearkasse", mod = 2, price = 55000},
            },
            
            -----------Brakes-------------
            [12] = {
                {name = "Gade Bremser", mod = 0, price = 6500},
                {name = "Sport Bremser", mod = 1, price = 9000},
                {name = "Race Bremser", mod = 2, price = 15000},
            },
            
            ------------Engine----------
            [11] = {
                {name = "Chip Tuning, Level 2", mod = 0, price = 10000},
                {name = "Chip Tuning, Level 3", mod = 1, price = 35000},
                {name = "Chip Tuning, Level 4", mod = 2, price = 55000},
            },
            
            -------------Roof----------
            [10] = {
                startprice = 8250,
                increaseby = 1000
            },
            
            ------------Fenders---------
            [8] = {
                startprice = 8500,
                increaseby = 1000
            },
            
            ------------Hood----------
            [7] = {
                startprice = 8500,
                increaseby = 1000
            },
            
            ----------Grille----------
            [6] = {
                startprice = 8250,
                increaseby = 1000
            },
            
            ----------Roll cage----------
            [5] = {
                startprice = 8250,
                increaseby = 1000
            },
            
            ----------Exhaust----------
            [4] = {
                startprice = 8250,
                increaseby = 1000
            },
            
            ----------Skirts----------
            [3] = {
                startprice = 8250,
                increaseby = 1000
            },
            
            -----------Rear bumpers----------
            [2] = {
                startprice = 8500,
                increaseby = 1000
            },
            
            ----------Front bumpers----------
            [1] = {
                startprice = 8500,
                increaseby = 1000
            },
            
            ----------Spoiler----------
            [0] = {
                startprice = 8500,
                increaseby = 1000
            },
        }

}

LSC_Config.garages = { 
	[1] = { 
        locked = false,
        blip = true,
        inside = {x = -337.3863,y = -136.9247,z = 38.5737, heading = 96.5}
    },
	[2] = { 
        locked = false,
        blip = true,
        inside = {x = 733.69,y = -1088.74, z = 21.733, heading = 90.0}
    },
	[3] = { 
        locked = false,
        blip = true,
        inside = {x = -1155.077,y = -2006.61, z = 12.465, heading = 340.0}
    },
	[4] = { 
        locked = false,
        blip = true,
        inside = {x = 1174.64,y = 2639.87, z = 37.045, heading = 354.0}
    },
	[5] = { 
        locked = false,
        blip = true,
        inside = {x = 110.78,y = 6626.71, z = 31.072, heading = 216.5}
    },
	[6] = { 
        locked = false,
        blip = true,
        inside = {x = -212.368,y = -1325.486, z = 30.176, heading = 320.5}
    },
	[7] = { 
        locked = false,
        blip = false,
        inside = {x = -38.3, y = -1065.36, z = 28.02, heading = 340.1}
    },
	[8] = { 
        locked = false,
        blip = false,
        inside = {x = 835.23,y = -3240.55, z = -99.67, heading = 267.5}
    },
	[9] = { 
        locked = false,
        blip = false,
        inside = {x = 450.81,y = -975.83, z = 24.26, heading = 95.5}
    },
    [10] = { 
        locked = false,
        blip = true,
        inside = {x = -794.41, y = -1506.1, z = 0.86, heading = 104.0}
    },
    [11] = { 
        locked = false,
        blip = false,
        inside = {x = -771.50, y = -1040.48, z = 13.70, heading = 28.5}
    },
    [12] = { 
        locked = false,
        blip = false,
        inside = {x = -31.84, y = -1090.19, z = 25.94, heading = 321.5}
    },
    [13] = { 
        locked = false,
        blip = false,
        inside = {x = -15.76, y = -1079.31, z = 26.19, heading = 80.5}
    },
    [14] = { 
        locked = false,
        blip = false,
        inside = {x = -7.85, y = -1081.69, z = 26.19, heading = 93.5}
    },
    [15] = { 
        locked = false,
        blip = false,
        inside = {x = -47.04, y = -1101.69, z = 25.94, heading = 289.5}
    },
    [16] = { 
        locked = false,
        blip = false,
        inside = {x = -42.06, y = -1094.21, z = 25.94, heading = 206.5}
    },
}

--Menu settings
LSC_Config.menu = {
    controls = {
        menu_up = 27,
        menu_down = 173,
        menu_left = 174,
        menu_right = 175,
        menu_select = 201,
        menu_back = 177
    },
    position = "left",
    theme = "light",
    maxbuttons = 10,
    width = 0.24,
    height = 0.36
}
