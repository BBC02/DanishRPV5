-- NOTE: You can potentially pre-furnish house models using this.
-- If you don't know/cant figure it out, don't ask how.
ShellExtras = {
  HotelV1 = {
    [GetHashKey("v_49_motelmp_winframe")]       = {offset = vector3(1.44,-3.9, 2.419)},
    [GetHashKey("v_49_motelmp_glass")]          = {offset = vector3(1.44,-3.9, 2.419)},
    [GetHashKey("v_49_motelmp_curtains")]       = {offset = vector3(1.44,-3.8, 2.200)},
    [GetHashKey("hei_prop_heist_safedeposit")]  = {offset = vector3(1.0,-4.2, 2.00), rotation = vector3(0.0,0.0,180.0)},
  }
}

ShellPrices = {
  HotelV1       = 10000,
  ApartmentV1   = 20000,

  --NOTE: KAMBI PAYED SHELLS

  NewApt1       = 15000,
  NewApt2       = 15000,
  NewApt3       = 15000,
  
  Warehouse1 = 15000, 
  Warehouse2 = 15000,
  Warehouse3 = 15000, 
  HotelV2       = 15000, 
  ApartmentV2   = 25000, 

}

ShellModels = {  
  StashHouse1 = "stashhouse_shell",
  StashHouse2 = "stashhouse2_shell",
  Container1 = "container_shell",
  StashHouseFurni1 = "stashhouse1_shell",
  StashHouseFurni2 = "stashhouse3_shell",
  ContainerFurni1 = "container2_shell",
  Office1 = 'shell_office1',
  Office2 = 'shell_office2',
  OfficeBig = 'shell_officebig',
  GarageShell1 = 'shell_garages',
  GarageShell2 = 'shell_garagem',
  GarageShell3 = 'shell_garagel',
  Hotelroom1 = "modernhotel_shell",
  Hotelroom2 = "modernhotel2_shell",
  Hotelroom3 = "modernhotel3_shell",
  Store1 = 'shell_store1',
  Store2 = 'shell_store2',
  Store3 = 'shell_store3',
  Gunstore = 'shell_gunstore',
  Barbers = 'shell_barber',
        
  HotelV2 = "shell_v16low",
  Trailer = "shell_trailer",
  Trevor = "shell_trevor",
  Lester = "shell_lester",
  Ranch = "shell_ranch",
  HighEndV1 = "shell_highend",
  HighEndV2 = "shell_highendv2",
  Michaels = "shell_michael",
        
  Banham = "shell_banham",
  Westons = "shell_westons",
  Westons2 = "shell_westons2",
        
  FurniHighEnd = "furnished_shell",
  ApartmentV1   = "playerhouse_tier1",

  -- NOTE: KAMBI PAYED SHELLS

  NewApt1       = 'shell_apartment1',
  NewApt2       = 'shell_apartment2',
  NewApt3       = 'shell_apartment3',

  Warehouse1 = "shell_warehouse1",
  Warehouse2 = "shell_warehouse2",
  Warehouse3 = "shell_warehouse3",  

  ApartmentV2   = "shell_v16mid",
}

ShellOffsets = {  
  ApartmentV1   = {exit = vector4(-3.6,15.4,27.7,0.0)},
  ApartmentV2   = {exit = vector4(-1.4,13.9,28.85,0.8)},

  Warehouse1    = {exit = vector4(8.625145, -0.1049805, 28.96388, 270.1945)},
  Warehouse2    = {exit = vector4(12.29147, -5.414795, 28.96133, 270.8702)},
  Warehouse3    = {exit = vector4(-2.386871, 1.656372, 28.99656, 89.92931)},

  NewApt1       = {exit = vector4(2.223267, -8.481567, 21.30548, 186.0575)},
  NewApt2       = {exit = vector4(2.223267, -8.481567, 21.30548, 186.0575)},
  NewApt3       = {exit = vector4(-11.3893, -4.29541, 21.86993, 127.1683)},
  FrankAunt = {exit = vector4(0.511617, 5.607183, 28.15093, 355.93)},
  Medium2 = {exit = vector4(-5.688777, -0.358311, 28.73308, 91.23632)},
  Medium3 = {exit = vector4(-5.65039, 1.839844, 23.29724, 86.2782)},
        
  StashHouse1 = {exit = vector4(21.106445, -0.376343, -2.070623, 91.79662)},
  StashHouse2 = {exit = vector4(-0.030273, 5.581665, -1.011574, 273.1571)},
  Container1 = {exit = vector4(0.009155, -5.501465, -0.213573, 355.6243)},
        
  StashHouseFurni1 = {exit = vector4(21.164246, -0.631470, -2.070634, 95.98003)},
  StashHouseFurni2 = {exit = vector4(0.027466, 5.172729, -1.011574, 177.2461)},
  ContainerFurni1 = {exit = vector4(0.116028, -5.078369, -0.213602, 349.144)},
        
  Banham = {exit = vector4(-3.548767, -1.651733, 1.236855, 90.22601)},
  Westons = {exit = vector4(4.320435, 10.261230, 1.349453, 174.9015)},
  Westons2 = {exit = vector4(-1.724731, 10.221680, 1.349453, 180.2411)},
        
  FurniHighEnd = {exit = vector4(-2.551012802124, 6.501171875, 3.15, 180.9064)},
  CokeShell1 = {exit = vector4(6.284302, -8.289307, 28.99088, 178.625)},
  CokeShell2 = {exit = vector4(6.284302, -8.289307, 28.99088, 178.625)},
  MethShell = {exit = vector4(6.284302, -8.289307, 28.99088, 178.625)},
  WeedShell1 = {exit = vector4(-17.51855, -11.66284, 28.98102, 98.85722)},
  WeedShell2 = {exit = vector4(-17.51855, -11.66284, 28.98102, 98.85722)},
        
  GarageShell1 = {exit = vector4(5.898254, 3.271362, -0.499924, 181.9444)},
  GarageShell2 = {exit = vector4(13.224609, 1.617798, -0.749882, 93.81283)},
  GarageShell3 = {exit = vector4(12.076111, -14.452026, -0.999952, 91.64314)},
        
  Hotelroom1 = {exit = vector4(4.938202, 4.065918, -0.817829, 172.0785)},
  Hotelroom2 = {exit = vector4(5.020142, 4.182251, -0.821272, 172.0785)},
  Hotelroom3 = {exit = vector4(4.925049, 4.080200, -0.821270, 172.0785)},
  Lester = {exit = vector4(-1.638702, -5.859497, -0.369537, 3.1)},
  Ranch = {exit = vector4(-0.633453, -5.488892, -1.426661, 270.0)},
  HighEndV1 = {exit = vector4(-22.051758, -0.238281, 7.207344, 271.0)},
  HighEndV2 = {exit = vector4(-10.072937, 0.891479, 1.934944, 270.0)},
  Michaels = {exit = vector4(-9.411835, 5.589600, -4.063391, 259.0)},
        
  Office1 = {exit = vector4(1.216980, 4.816040, -0.725340, 184.172)},
  Office2 = {exit = vector4(3.334625, -1.995972, -0.874655, 91.23632)},
  OfficeBig = {exit = vector4(-8.961090, 1.549561, -0.398336, 180.4282)},
        
   
  Store1 = {exit = vector4(-2.688995, -4.367188, -0.619522, 2.809942)},
  Store2 = {exit = vector4(-0.646393, -4.709106, -1.153255, 0.9400941)},
  Store3 = {exit = vector4(0.105743, -7.456543, -0.300968, 359.8295)},
  Gunstore = {exit = vector4(-1.115570, -5.135864, -0.736475, 0.454677)},
  Barbers = {exit = vector4(1.674072, 4.905884, -0.557100, 181.2334)},
  HotelV2 = {exit = vector4(4.658325, -6.216797, -1.654194, 0.4)},
  Trailer = {exit = vector4(-1.415192, -1.738403, -0.479610, 0.4)},
  Trevor = {exit = vector4(0.230499, -3.404541, -0.408056, 0.0)},
}
 
Houses = {
}

if IsDuplicityVersion() then
  Citizen.CreateThread(function()
    Wait(1500)

    local _prefix = "    [Allhousing]"
    local _error = function(...) print(_prefix,"[Error]",...); end
    local _print = function(...) print(_prefix,"[Log]",...);   end

    local check_coords = {}  
    for _,house in ipairs(Houses) do
      if check_coords[house.Entry] then
        _error("Duplicate entry location in houses.lua","Entry: "..tostring(house.Entry))
        return
      else
        check_coords[house.Entry] = true
      end
    end
    if not error_out then
      _print("Completed house table check successfully.")
    end
  end)
end

