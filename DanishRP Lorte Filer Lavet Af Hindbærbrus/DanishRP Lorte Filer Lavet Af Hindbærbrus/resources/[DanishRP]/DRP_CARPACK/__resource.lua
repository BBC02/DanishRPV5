-- DanishRP Add-On Carpack 
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

----------------------------------------------------------------------------------------------------
-- All køretøjer stilles op som nedenunder, holdes clean.

-- Køretøj navn og model
-- data_file 'HANDLING_FILE' 'meta/SPAWNNAME/handling.meta'
-- data_file 'VEHICLE_METADATA_FILE' 'meta/SPAWNNAME/vehicles.meta'
-- data_file 'CARCOLS_FILE' 'meta/SPAWNNAME/carcols.meta'
-- data_file 'VEHICLE_VARIATION_FILE' 'meta/SPAWNNAME/carvariations.meta'
-- data_file 'VEHICLE_LAYOUTS_FILE' 'meta/SPAWNNAME/vehiclelayouts.meta'

-- files {
--   'meta/SPAWNNAME/handling.meta',
--   'meta/SPAWNNAME/vehicles.meta',
--   'meta/SPAWNNAME/vehiclelayouts.meta',
--   'meta/SPAWNNAME/carcols.meta',
--   'meta/SPAWNNAME/carvariations.meta',
-- }

----------------------------------------------------------------------------------------------------

file 'popgroups.ymt'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups'

client_script 'names.lua'

-- AUDIO FILES

files {
  'sfx/dlc_argento/argento.awc',
  'sfx/dlc_argento/argento_npc.awc',
  'audioconfig/argento_game.dat151.rel',
  'audioconfig/argento_sounds.dat54.rel',
  'sfx/dlc_asteropers/asteropers.awc',
  'sfx/dlc_asteropers/asteropers_npc.awc',
  'audioconfig/asteropers_game.dat151.rel',
  'audioconfig/asteropers_sounds.dat54.rel',
  'sfx/dlc_severo/severo.awc',
  'sfx/dlc_severo/severo_npc.awc',
  'audioconfig/severo_game.dat151.rel',
  'audioconfig/severo_sounds.dat54.rel',
  'sfx/dlc_rh7elegy/rh7elegy.awc',
  'sfx/dlc_rh7elegy/rh7elegy_npc.awc',
  'audioconfig/elegyrh7_game.dat151.rel',
  'audioconfig/elegyrh7_sounds.dat54.rel',
  'sfx/dlc_cypherct/cypherct.awc',
  'sfx/dlc_cypherct/cypherct_npc.awc',
  'audioconfig/cypherct_game.dat151.rel',
  'audioconfig/cypherct_sounds.dat54.rel',
  'sfx/dlc_elegyx/elegyx.awc',
  'sfx/dlc_elegyx/elegyx_npc.awc',
  'audioconfig/elegyx_game.dat151.rel',
  'audioconfig/elegyx_sounds.dat54.rel',
  'audioconfig/elegyx_game.dat151',
  'audioconfig/elegyx_sounds.dat54',
  'audioconfig/elegyx_game.dat151.nametable',
  'audioconfig/elegyx_sounds.dat54.nametable',
  'sfx/dlc_gresleyh/gresleyh.awc',
  'sfx/dlc_gresleyh/gresleyh_npc.awc',
  'audioconfig/buffaloh_game.dat151.rel',
  'audioconfig/buffaloh_sounds.dat54.rel',
  'audioconfig/buffaloh_game.dat151.nametable',
  'audioconfig/buffaloh_sounds.dat54.nametable',
  'audioconfig/buffaloh_game.dat151',
  'audioconfig/buffaloh_sounds.dat54',
  'sfx/dlc_oracxsle/oracxsle.awc',
  'sfx/dlc_oracxsle/oracxsle_npc.awc',
  'audioconfig/oracxsle_game.dat151.rel',
  'audioconfig/oracxsle_sounds.dat54.rel',
  'audioconfig/gresleyh_game.dat151.rel',
  'audioconfig/gresleyh_sounds.dat54.rel',
  'audioconfig/gresleyh_amp.dat10.rel',
  'audioconfig/gresleyh_game.dat151.nametable',
  'audioconfig/gresleyh_sounds.dat54.nametable',
  'audioconfig/gresleyh_amp.dat10.nametable',
  'audioconfig/gresleyh_game.dat151',
  'audioconfig/gresleyh_sounds.dat54',
  'audioconfig/gresleyh_amp.dat10',
  'audioconfig/sultan2c_game.dat151.rel',
  'audioconfig/sultan2c_sounds.dat54.rel',
  'audioconfig/sultan2c_game.dat151.nametable',
  'audioconfig/sultan2c_sounds.dat54.nametable',
  'audioconfig/sultan2c_game.dat151',
  'audioconfig/sultan2c_sounds.dat54',
  'sfx/dlc_sultan2c/sultan2c.awc',
  'sfx/dlc_sultan2c/sultan2c_npc.awc',
  'sfx/dlc_sunrise/sunrise.awc',
  'sfx/dlc_sunrise/sunrise_npc.awc',
  'audioconfig/sunrise_game.dat151.rel',
  'audioconfig/sunrise_sounds.dat54.rel',
  'audioconfig/ventoso_game.dat151.rel',
  'audioconfig/ventoso_sounds.dat54.rel',
  'sfx/dlc_supergts/supergts.awc',
  'sfx/dlc_supergts/supergts_npc.awc',
  'audioconfig/supergts_game.dat151.rel',
  'audioconfig/supergts_sounds.dat54.rel',
  'sfx/dlc_zircoflow/stratumc.awc',
  'sfx/dlc_zircoflow/stratumc_npc.awc',
  'audioconfig/stratumc_game.dat151.rel',
  'audioconfig/stratumc_sounds.dat54.rel',
  'audioconfig/stratumc_amp.dat10.rel',
  'audioconfig/ferrarif140fe_game.dat151.rel',
  'audioconfig/ferrarif140fe_sounds.dat54.rel',
  'sfx/dlc_ferrarif140fe/ferrarif140fe.awc',
  'sfx/dlc_ferrarif140fe/ferrarif140fe_npc.awc',
  'audioconfig/sultanrsv8_game.dat151',
  'audioconfig/sultanrsv8_game.dat151.nametable',
  'audioconfig/sultanrsv8_game.dat151.rel',
  'audioconfig/sultanrsv8_sounds.dat54',
  'audioconfig/sultanrsv8_sounds.dat54.nametable',
  'audioconfig/sultanrsv8_sounds.dat54.rel',
  'sfx/dlc_v8sultanrs/v8sultanrs.awc',
  'sfx/dlc_v8sultanrs/v8sultanrs_npc.awc',
  'audioconfig/ta023l539_game.dat151.rel',
  'audioconfig/ta023l539_sounds.dat54.rel',
  'sfx/dlc_ta023l539/ta023l539.awc',
  'sfx/dlc_ta023l539/ta023l539_npc.awc',
  'audioconfig/taaud40v8_game.dat151.rel',
  'audioconfig/taaud40v8_sounds.dat54.rel',
  'sfx/dlc_taaud40v8/taaud40v8.awc',
  'sfx/dlc_taaud40v8/taaud40v8_npc.awc',
  'audioconfig/sfxtamworth_game.dat151.rel',
  'audioconfig/sfxtamworth_sounds.dat54.rel',
  'audioconfig/n55b30t0_game.dat151.rel',
  'audioconfig/n55b30t0_sounds.dat54.rel',
  'sfx/dlc_n55b30t0/n55b30t0.awc',
  'sfx/dlc_n55b30t0/n55b30t0_npc.awc',
  'audioconfig/s55b30_game.dat151.rel',
  'audioconfig/s55b30_sounds.dat54.rel',
  'sfx/dlc_s55b30/s55b30.awc',
  'sfx/dlc_s55b30/s55b30_npc.awc',
  'audioconfig/m158huayra_amp.dat10.nametable',
  'audioconfig/m158huayra_amp.dat10.rel',
  'audioconfig/m158huayra_game.dat151.nametable',
  'audioconfig/m158huayra_game.dat151.rel',
  'audioconfig/m158huayra_sounds.dat54.nametable',
  'audioconfig/m158huayra_sounds.dat54.rel',
  'sfx/dlc_m158huayra/m158huayra.awc',
  'sfx/dlc_m158huayra/m158huayra_npc.awc',
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/argento_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/argento_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_argento'
data_file 'AUDIO_GAMEDATA' 'audioconfig/asteropers_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/asteropers_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_asteropers'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_severo'
data_file 'AUDIO_GAMEDATA' 'audioconfig/severo_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/severo_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_rh7elegy'
data_file 'AUDIO_GAMEDATA' 'audioconfig/elegyrh7_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/elegyrh7_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_cypherct'
data_file 'AUDIO_GAMEDATA' 'audioconfig/cypherct_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/cypherct_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/elegyx_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/elegyx_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_elegyx'
data_file 'AUDIO_GAMEDATA' 'audioconfig/buffaloh_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/buffaloh_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_gresleyh'
data_file 'AUDIO_GAMEDATA' 'audioconfig/oracxsle_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/oracxsle_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_oracxsle'
data_file 'AUDIO_GAMEDATA' 'audioconfig/gresleyh_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/gresleyh_sounds.dat'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/gresleyh_amp.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_gresleyh'
data_file 'AUDIO_GAMEDATA' 'audioconfig/sultan2c_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/sultan2c_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_sultan2c'
data_file 'AUDIO_GAMEDATA' 'audioconfig/sunrise_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/sunrise_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_sunrise'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ventoso_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ventoso_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/supergts_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/supergts_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_supergts'
data_file 'AUDIO_GAMEDATA' 'audioconfig/stratumc_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/stratumc_sounds.dat'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/stratumc_amp.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_zircoflow'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ferrarif140fe_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ferrarif140fe_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ferrarif140fe'
data_file 'AUDIO_GAMEDATA' 'audioconfig/sultanrsv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/sultanrsv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_v8sultanrs'
data_file 'AUDIO_GAMEDATA' 'audioconfig/ta023l539_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ta023l539_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ta023l539'
data_file 'AUDIO_GAMEDATA' 'audioconfig/taaud40v8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/taaud40v8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_taaud40v8'
data_file 'AUDIO_GAMEDATA' 'audioconfig/sfxtamworth_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/sfxtamworth_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/n55b30t0_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/n55b30t0_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_n55b30t0'
data_file 'AUDIO_GAMEDATA' 'audioconfig/s55b30_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/s55b30_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_s55b30'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/m158huayra_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/m158huayra_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/m158huayra_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_m158huayra'


-- Taxi2 (Lilla Mercedes)
data_file 'HANDLING_FILE' 'meta/taxi2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/taxi2/vehicles.meta'

files {
  'meta/taxi2/handling.meta',
  'meta/taxi2/vehicles.meta',
}

-- Taxi2 (VW T6)
data_file 'VEHICLE_METADATA_FILE' 'meta/taxi2/vehicles.meta'

files {
  'meta/taxi2/vehicles.meta',
}

-- Flatbed3 (AutoHjørnet Flatbed)
data_file 'HANDLING_FILE' 'meta/flatbed3/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/flatbed3/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/flatbed3/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/flatbed3/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'meta/flatbed3/vehiclelayouts.meta'

files {
  'meta/flatbed3/handling.meta',
  'meta/flatbed3/vehicles.meta',
  'meta/flatbed3/vehiclelayouts.meta',
  'meta/flatbed3/carcols.meta',
  'meta/flatbed3/carvariations.meta',
}

--Skraldevogn (Ombygget NPC Skraldevogn)
data_file 'HANDLING_FILE' 'meta/skraldevogn/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/skraldevogn/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/skraldevogn/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/skraldevogn/carvariations.meta'

files{
    'meta/skraldevogn/handling.meta',
    'meta/skraldevogn/vehicles.meta',
    'meta/skraldevogn/carcols.meta',
    'meta/skraldevogn/carvariations.meta',
}

-- Sagkyndig (Skolevogn)
data_file 'HANDLING_FILE' 'meta/sagkyndig/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/sagkyndig/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/sagkyndig/carvariations.meta'

files {
  'meta/sagkyndig/handling.meta',
  'meta/sagkyndig/vehicles.meta',
  'meta/sagkyndig/carvariations.meta',
}

-- Sagkyndig2 (Skolevogn2)
data_file 'HANDLING_FILE' 'meta/sagkyndig2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/sagkyndig2/vehicles.meta'

files {
  'meta/sagkyndig2/handling.meta',
  'meta/sagkyndig2/vehicles.meta',
  'meta/sagkyndig2/carvariations.meta',
}

-- G4S Van
data_file 'HANDLING_FILE' 'meta/g4svan/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/g4svan/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/g4svan/carvariations.meta'

files {
  'meta/g4svan/handling.meta',
  'meta/g4svan/vehicles.meta',
  'meta/g4svan/carvariations.meta',
}

-- Rumpo Weazel Newsvan
data_file 'HANDLING_FILE' 'meta/newsvan/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/newsvan/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/newsvan/carvariations.meta'

files {
  'meta/newsvan/handling.meta',
  'meta/newsvan/vehicles.meta',
  'meta/newsvan/carvariations.meta',
}

-- Hungry Pizza Vogn
data_file 'HANDLING_FILE' 'meta/pizzavogn/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/pizzavogn/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/pizzavogn/carvariations.meta'

files {
  'meta/pizzavogn/vehicles.meta',
  'meta/pizzavogn/carvariations.meta',
  'meta/pizzavogn/handling.meta',
}

-- Post Nord
data_file 'HANDLING_FILE' 'meta/sprinter/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/sprinter/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/sprinter/carvariations.meta'

files {
  'meta/sprinter/vehicles.meta',
  'meta/sprinter/carvariations.meta',
  'meta/sprinter/handling.meta',
}

-- AutoHjørnet bil
data_file 'HANDLING_FILE' 'meta/explorermek/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/explorermek/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/explorermek/carvariations.meta'

files {
  'meta/explorermek/vehicles.meta',
  'meta/explorermek/carvariations.meta',
  'meta/explorermek/handling.meta',
}

data_file 'VEHICLE_METADATA_FILE' 'meta/trump-stretcher/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/trump-stretcher/carvariations.meta'

files {
	'meta/trump-stretcher/vehicles.meta',
	'meta/trump-stretcher/carvariations.meta',
}

-- Argento.
data_file 'HANDLING_FILE' 'meta/argento/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/argento/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/argento/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/argento/carvariations.meta'

files {
  'meta/argento/handling.meta',
  'meta/argento/vehicles.meta',
  'meta/argento/carcols.meta',
  'meta/argento/carvariations.meta',
}

-- Streiter2

data_file 'HANDLING_FILE' 'meta/streiter2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/streiter2/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/streiter2/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/streiter2/carvariations.meta'

files {
  'meta/streiter2/handling.meta',
  'meta/streiter2/vehicles.meta',
  'meta/streiter2/carcols.meta',
  'meta/streiter2/carvariations.meta',
}

-- Severo
data_file 'HANDLING_FILE' 'meta/severo/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/severo/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/severo/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/severo/carvariations.meta'
 
files {
  'meta/severo/handling.meta',
  'meta/severo/vehicles.meta',
  'meta/severo/carcols.meta',
  'meta/severo/carvariations.meta',
}

-- Elegy RH7
data_file 'HANDLING_FILE' 'meta/elegyrh7/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/elegyrh7/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/elegyrh7/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/elegyrh7/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'meta/elegyrh7/vehiclelayouts.meta'

files {
  'meta/elegyrh7/handling.meta',
  'meta/elegyrh7/vehicles.meta',
  'meta/elegyrh7/carcols.meta',
  'meta/elegyrh7/carvariations.meta',
  'meta/elegyrh7/vehiclelayouts.meta',
}

-- CypherCT
data_file 'HANDLING_FILE' 'meta/cypherct/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/cypherct/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/cypherct/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/cypherct/carvariations.meta'

files {
  'meta/cypherct/handling.meta',
  'meta/cypherct/vehicles.meta',
  'meta/cypherct/carcols.meta',
  'meta/cypherct/carvariations.meta',
} 

-- Scheisser
data_file 'HANDLING_FILE' 'meta/scheisser/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/scheisser/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/scheisser/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/scheisser/carvariations.meta'

files {
  'meta/scheisser/handling.meta',
  'meta/scheisser/vehicles.meta',
  'meta/scheisser/carcols.meta',
  'meta/scheisser/carvariations.meta',
}

-- Elegy RH-X
data_file 'HANDLING_FILE' 'meta/elegyx/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/elegyx/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/elegyx/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/elegyx/carvariations.meta'

files {
  'meta/elegyx/handling.meta',
  'meta/elegyx/vehicles.meta',
  'meta/elegyx/carcols.meta',
  'meta/elegyx/carvariations.meta',
}

-- Übermacht Oracle XS-LE
data_file 'HANDLING_FILE' 'meta/oracxsle/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/oracxsle/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/oracxsle/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/oracxsle/carvariations.meta'

files {
  'meta/oracxsle/handling.meta',
  'meta/oracxsle/vehicles.meta',
  'meta/oracxsle/carcols.meta',
  'meta/oracxsle/carvariations.meta',
}

-- Buffalo Hellhound
data_file 'HANDLING_FILE' 'meta/buffaloh/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/buffaloh/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/buffaloh/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/buffaloh/carvariations.meta'

files {
  'meta/buffaloh/handling.meta',
  'meta/buffaloh/vehicles.meta',
  'meta/buffaloh/carcols.meta',
  'meta/buffaloh/carvariations.meta',
}

  -- VetoK
  data_file 'HANDLING_FILE' 'meta/vetok/handling.meta'
  data_file 'VEHICLE_METADATA_FILE' 'meta/vetok/vehicles.meta'
  data_file 'CARCOLS_FILE' 'meta/vetok/carcols.meta'
  data_file 'VEHICLE_VARIATION_FILE' 'meta/vetok/carvariations.meta'
  data_file 'VEHICLE_LAYOUTS_FILE' 'meta/vetok/vehiclelayouts.meta'
 
  files {
    'meta/vetok/handling.meta',
    'meta/vetok/vehicles.meta',
    'meta/vetok/carcols.meta',
    'meta/vetok/carvariations.meta',
    'meta/vetok/vehiclelayouts.meta',
  }
  
  -- VetoG
  data_file 'HANDLING_FILE' 'meta/vetog/handling.meta'
  data_file 'VEHICLE_METADATA_FILE' 'meta/vetog/vehicles.meta'
  data_file 'CARCOLS_FILE' 'meta/vetog/carcols.meta'
  data_file 'VEHICLE_VARIATION_FILE' 'meta/vetog/carvariations.meta'
 
  files {
    'meta/vetog/handling.meta',
    'meta/vetog/vehicles.meta',
    'meta/vetog/carcols.meta',
    'meta/vetog/carvariations.meta',
  }

-- gresleyh
data_file 'HANDLING_FILE' 'meta/gresleyh/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/gresleyh/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/gresleyh/carvariations.meta'

files {
  'meta/gresleyh/handling.meta',
  'meta/gresleyh/vehicles.meta',
  'meta/gresleyh/carvariations.meta',
}

-- Sultan2c
data_file 'HANDLING_FILE' 'meta/sultan2c/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/sultan2c/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/sultan2c/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/sultan2c/carvariations.meta'

files {
  'meta/sultan2c/handling.meta',
  'meta/sultan2c/vehicles.meta',
  'meta/sultan2c/carcols.meta',
  'meta/sultan2c/carvariations.meta',
}

-- Sunrise
data_file 'HANDLING_FILE' 'meta/sunrise1/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/sunrise1/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/sunrise1/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/sunrise1/carvariations.meta'

files {
  'meta/sunrise1/handling.meta',
  'meta/sunrise1/vehicles.meta',
  'meta/sunrise1/carcols.meta',
  'meta/sunrise1/carvariations.meta',
}

-- Ventoso
data_file 'HANDLING_FILE' 'meta/ventoso/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ventoso/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/ventoso/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ventoso/carvariations.meta'

files {
  'meta/ventoso/handling.meta',
  'meta/ventoso/vehicles.meta',
  'meta/ventoso/carcols.meta',
  'meta/ventoso/carvariations.meta',
}

-- Super GTS
data_file 'HANDLING_FILE' 'meta/supergts/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/supergts/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/supergts/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/supergts/carvariations.meta'

files {
  'meta/supergts/handling.meta',
  'meta/supergts/vehicles.meta',
  'meta/supergts/carcols.meta',
  'meta/supergts/carvariations.meta',
}

-- Stratum C
data_file 'HANDLING_FILE' 'meta/stratumc/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/stratumc/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/stratumc/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/stratumc/carvariations.meta'

files {
  'meta/stratumc/handling.meta',
  'meta/stratumc/vehicles.meta',
  'meta/stratumc/carcols.meta',
  'meta/stratumc/carvariations.meta',
}

-- Altior
data_file 'HANDLING_FILE' 'meta/altior/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/altior/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/altior/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/altior/carvariations.meta'

files {
  'meta/altior/handling.meta',
  'meta/altior/vehicles.meta',
  'meta/altior/carcols.meta',
  'meta/altior/carvariations.meta',
}

-- ITALI GTR
data_file 'HANDLING_FILE' 'meta/italigtr/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/italigtr/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/italigtr/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/italigtr/carvariations.meta'

files {
  'meta/italigtr/handling.meta',
  'meta/italigtr/vehicles.meta',
  'meta/italigtr/carcols.meta',
  'meta/italigtr/carvariations.meta',
}

-- ParagonXR
data_file 'HANDLING_FILE' 'meta/paragonxr/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/paragonxr/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/paragonxr/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/paragonxr/carvariations.meta'

files {
  'meta/paragonxr/handling.meta',
  'meta/paragonxr/vehicles.meta',
  'meta/paragonxr/carcols.meta',
  'meta/paragonxr/carvariations.meta',
}

-- Tempesta
data_file 'HANDLING_FILE' 'meta/tempestaes/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/tempestaes/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/tempestaes/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/tempestaes/carvariations.meta'

files {
  'meta/tempestaes/handling.meta',
  'meta/tempestaes/vehicles.meta',
  'meta/tempestaes/carcols.meta',
  'meta/tempestaes/carvariations.meta',
}

  -- Tamworth
  data_file 'HANDLING_FILE' 'meta/tamworth/handling.meta'
  data_file 'VEHICLE_METADATA_FILE' 'meta/tamworth/vehicles.meta'
  data_file 'CARCOLS_FILE' 'meta/tamworth/carcols.meta'
  data_file 'VEHICLE_VARIATION_FILE' 'meta/tamworth/carvariations.meta'
 
  files {
    'meta/tamworth/handling.meta',
    'meta/tamworth/vehicles.meta',
    'meta/tamworth/carcols.meta',
    'meta/tamworth/carvariations.meta',
  }

-- Peanut
data_file 'HANDLING_FILE' 'meta/peanut/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/peanut/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/peanut/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/peanut/carvariations.meta'

files {
  'meta/peanut/handling.meta',
  'meta/peanut/vehicles.meta',
  'meta/peanut/carcols.meta',
  'meta/peanut/carvariations.meta',
}

-- Tunak
data_file 'HANDLING_FILE' 'meta/tunak/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/tunak/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/tunak/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/tunak/carvariations.meta'

files {
  'meta/tunak/handling.meta',
  'meta/tunak/vehicles.meta',
  'meta/tunak/carcols.meta',
  'meta/tunak/carvariations.meta',
}

-- Eva
data_file 'HANDLING_FILE' 'meta/eva/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/eva/vehicles.meta'
data_file 'CARCOLS_FILE' 'meta/eva/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/eva/carvariations.meta'

files {
  'meta/eva/handling.meta',
  'meta/eva/vehicles.meta',
  'meta/eva/carcols.meta',
  'meta/eva/carvariations.meta',
}

  -- Auroras
  data_file 'HANDLING_FILE' 'meta/auroras/handling.meta'
  data_file 'VEHICLE_METADATA_FILE' 'meta/auroras/vehicles.meta'
  data_file 'CARCOLS_FILE' 'meta/auroras/carcols.meta'
  data_file 'VEHICLE_VARIATION_FILE' 'meta/auroras/carvariations.meta'
  data_file 'VEHICLE_LAYOUTS_FILE' 'meta/auroras/vehiclelayouts.meta'
 
  files {
    'meta/auroras/handling.meta',
    'meta/auroras/vehicles.meta',
    'meta/auroras/carcols.meta',
    'meta/auroras/carvariations.meta',
    'meta/auroras/vehiclelayouts.meta',
  }

  -- Howitzer
  data_file 'HANDLING_FILE' 'meta/howitzer/handling.meta'
  data_file 'VEHICLE_METADATA_FILE' 'meta/howitzer/vehicles.meta'
  data_file 'CARCOLS_FILE' 'meta/howitzer/carcols.meta'
  data_file 'VEHICLE_VARIATION_FILE' 'meta/howitzer/carvariations.meta'
  
  files {
    'meta/howitzer/handling.meta',
    'meta/howitzer/vehicles.meta',
    'meta/howitzer/carcols.meta',
    'meta/howitzer/carvariations.meta',
  }

-- Bus
data_file 'HANDLING_FILE' 'meta/galaxyroamer/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/galaxyroamer/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/galaxyroamer/carvariations.meta'

files {
  'meta/galaxyroamer/handling.meta',
  'meta/galaxyroamer/vehicles.meta',
  'meta/galaxyroamer/carvariations.meta',
}