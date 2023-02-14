-- DanishRP ELS Køretøjer Pack
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

----------------------------------------------------------------------------------------------------
-- All køretøjer stilles op som nedenunder, holdes clean.

-- Køretøj navn
-- data_file 'HANDLING_FILE' 'meta/AFDELING/SPAWNAVN/handling.meta'
-- data_file 'VEHICLE_METADATA_FILE' 'meta/AFDELING/SPAWNAVN/vehicles.meta'
-- data_file 'VEHICLE_VARIATION_FILE' 'meta/AFDELING/SPAWNAVN/carvariations.meta'

-- files {
--   'meta/AFDELING/SPAWNAVN/handling.meta',
--   'meta/AFDELING/SPAWNAVN/vehicles.meta',
--   'meta/AFDELING/SPAWNAVN/carvariations.meta',
--   'vcf/SPAWNAVN.xml',
-- }

----------------------------------------------------------------------------------------------------

client_script 'names.lua'

------- EMS KØRETØJER --------

-- Læge Helikopter
data_file 'HANDLING_FILE' 'meta/ambulance/heliambulance/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/heliambulance/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/heliambulance/carvariations.meta'
files {
  'meta/ambulance/heliambulance/handling.meta',
  'meta/ambulance/heliambulance/vehicles.meta',
  'meta/ambulance/heliambulance/carvariations.meta',
}

-- Volvo Micu Behandlingsplads
data_file 'HANDLING_FILE' 'meta/ambulance/micuambu/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/micuambu/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/micuambu/carvariations.meta'

files {
  'meta/ambulance/micuambu/handling.meta',
  'meta/ambulance/micuambu/vehicles.meta',
  'meta/ambulance/micuambu/carvariations.meta',
  'vcf/micuambu.xml',
}

-- Mercedes ML63 Akut
data_file 'HANDLING_FILE' 'meta/ambulance/ml63akut/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/ml63akut/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/ml63akut/carvariations.meta'

files {
  'meta/ambulance/ml63akut/handling.meta',
  'meta/ambulance/ml63akut/vehicles.meta',
  'meta/ambulance/ml63akut/carvariations.meta',
  'vcf/ml63akut.xml',
}

-- Mercedes 2019 Sprinter Ambulance
data_file 'HANDLING_FILE' 'meta/ambulance/otarisambulance2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/otarisambulance2/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/otarisambulance2/carvariations.meta'

files {
  'meta/ambulance/otarisambulance2/handling.meta',
  'meta/ambulance/otarisambulance2/vehicles.meta',
  'meta/ambulance/otarisambulance2/carvariations.meta',
  'vcf/otarisambulance2.xml',
}

-- Toyota Hillux Skiltevogn
data_file 'HANDLING_FILE' 'meta/ambulance/toyotaskilt/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/toyotaskilt/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/toyotaskilt/carvariations.meta'

files {
  'meta/ambulance/toyotaskilt/handling.meta',
  'meta/ambulance/toyotaskilt/vehicles.meta',
  'meta/ambulance/toyotaskilt/carvariations.meta',
  'vcf/toyotaskilt.xml',
}

-- Volvo XC90 Ambulance
data_file 'HANDLING_FILE' 'meta/ambulance/volvoxc90ambulance/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/volvoxc90ambulance/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/volvoxc90ambulance/carvariations.meta'

files {
  'meta/ambulance/volvoxc90ambulance/handling.meta',
  'meta/ambulance/volvoxc90ambulance/vehicles.meta',
  'meta/ambulance/volvoxc90ambulance/carvariations.meta',
  'vcf/volvoxc90ambulance.xml',
}


-------- POLITI KØRETØJER --------

-- Mercedes C250 Uniformeret
data_file 'HANDLING_FILE' 'meta/marked/mercedesc250/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/mercedesc250/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/mercedesc250/carvariations.meta'
files {
  'meta/marked/mercedesc250/handling.meta',
  'meta/marked/mercedesc250/vehicles.meta',
  'meta/marked/mercedesc250/carvariations.meta',
  'vcf/mercedesc250.xml',
}

-- VW Passat Uniformeret
data_file 'HANDLING_FILE' 'meta/marked/passatmarked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/passatmarked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/passatmarked/carvariations.meta'

files {
  'meta/marked/passatmarked/handling.meta',
  'meta/marked/passatmarked/vehicles.meta',
  'meta/marked/passatmarked/carvariations.meta',
  'vcf/passatmarked.xml',
}

-- VW T6 Indsatsleder
data_file 'HANDLING_FILE' 'meta/marked/t6marked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/t6marked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/t6marked/carvariations.meta'
files {
  'meta/marked/t6marked/handling.meta',
  'meta/marked/t6marked/vehicles.meta',
  'meta/marked/t6marked/carvariations.meta',
  'vcf/t6marked.xml',
}

-- VW Touran Uniformeret
data_file 'HANDLING_FILE' 'meta/marked/touranmarked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/touranmarked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/touranmarked/carvariations.meta'
files {
  'meta/marked/touranmarked/handling.meta',
  'meta/marked/touranmarked/vehicles.meta',
  'meta/marked/touranmarked/carvariations.meta',
  'vcf/touranmarked.xml',
}

-- Yamaha Uniformeret Politi MC
data_file 'HANDLING_FILE' 'meta/marked/yamahamc/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/yamahamc/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/yamahamc/carvariations.meta'

files {
  'meta/marked/yamahamc/handling.meta',
  'meta/marked/yamahamc/vehicles.meta',
  'meta/marked/yamahamc/carvariations.meta',
  'vcf/yamahamc.xml',
}

-- Politi Helikopter
data_file 'HANDLING_FILE' 'meta/marked/politiheli/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/politiheli/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/politiheli/carvariations.meta'

files {
  'meta/marked/politiheli/handling.meta',
  'meta/marked/politiheli/vehicles.meta',
  'meta/marked/politiheli/carvariations.meta',
}

-- Civil Baller2
data_file 'HANDLING_FILE' 'meta/unmarked/ballercivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/ballercivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/ballercivil/carvariations.meta'

files {
  'meta/unmarked/ballercivil/handling.meta',
  'meta/unmarked/ballercivil/vehicles.meta',
  'meta/unmarked/ballercivil/carvariations.meta',
  'vcf/ballercivil.xml',
}

-- Ford Mondeo Hundevogn
data_file 'HANDLING_FILE' 'meta/marked/forddoggo/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/forddoggo/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/forddoggo/carvariations.meta'

files {
  'meta/marked/forddoggo/handling.meta',
  'meta/marked/forddoggo/vehicles.meta',
  'meta/marked/forddoggo/carvariations.meta',
  'vcf/forddoggo.xml',
}

-- Volvo V90 - Hundevogn
data_file 'HANDLING_FILE' 'meta/marked/volvov90/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/volvov90/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/volvov90/carvariations.meta'

files {
  'meta/marked/volvov90/handling.meta',
  'meta/marked/volvov90/vehicles.meta',
  'meta/marked/volvov90/carvariations.meta',
  'vcf/volvov90.xml',
}

-- Prado Markeret
data_file 'HANDLING_FILE' 'meta/marked/pradomarked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/pradomarked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/pradomarked/carvariations.meta'

files {
  'meta/marked/pradomarked/handling.meta',
  'meta/marked/pradomarked/vehicles.meta',
  'meta/marked/pradomarked/carvariations.meta',
  'vcf/pradomarked.xml',
}

-- Schafter3 Civil
data_file 'HANDLING_FILE' 'meta/unmarked/schafter3civil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/schafter3civil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/schafter3civil/carvariations.meta'

files {
  'meta/unmarked/schafter3civil/handling.meta',
  'meta/unmarked/schafter3civil/vehicles.meta',
  'meta/unmarked/schafter3civil/carvariations.meta',
  'vcf/schafter3civil.xml',
}

-- Tailgater2 Civil
data_file 'HANDLING_FILE' 'meta/unmarked/tailgater2civil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/tailgater2civil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/tailgater2civil/carvariations.meta'

files {
  'meta/unmarked/tailgater2civil/handling.meta',
  'meta/unmarked/tailgater2civil/vehicles.meta',
  'meta/unmarked/tailgater2civil/carvariations.meta',
  'vcf/tailgater2civil.xml',
}

-- Rebla Civil
data_file 'HANDLING_FILE' 'meta/unmarked/reblacivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/reblacivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/reblacivil/carvariations.meta'

files {
  'meta/unmarked/reblacivil/handling.meta',
  'meta/unmarked/reblacivil/vehicles.meta',
  'meta/unmarked/reblacivil/carvariations.meta',
  'vcf/reblacivil.xml',
}

-- VSTR Civil
data_file 'HANDLING_FILE' 'meta/unmarked/vstrcivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/vstrcivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/vstrcivil/carvariations.meta'

files {
  'meta/unmarked/vstrcivil/handling.meta',
  'meta/unmarked/vstrcivil/vehicles.meta',
  'meta/unmarked/vstrcivil/carvariations.meta',
  'vcf/vstrcivil.xml',
}

-- Komoda Civil
data_file 'HANDLING_FILE' 'meta/unmarked/komodacivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/komodacivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/komodacivil/carvariations.meta'

files {
  'meta/unmarked/komodacivil/handling.meta',
  'meta/unmarked/komodacivil/vehicles.meta',
  'meta/unmarked/komodacivil/carvariations.meta',
  'vcf/komodacivil.xml',
}

-- XLS Civil
data_file 'HANDLING_FILE' 'meta/unmarked/xlscivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/xlscivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/xlscivil/carvariations.meta'

files {
  'meta/unmarked/xlscivil/handling.meta',
  'meta/unmarked/xlscivil/vehicles.meta',
  'meta/unmarked/xlscivil/carvariations.meta',
  'vcf/xlscivil.xml',
}

-- Politi Boat
data_file 'HANDLING_FILE' 'meta/marked/politiboat/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/politiboat/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/politiboat/carvariations.meta'
data_file 'CARCOLS_FILE' 'meta/marked/politiboat/carcols.meta'

files {
  'meta/marked/politiboat/handling.meta',
  'meta/marked/politiboat/vehicles.meta',
  'meta/marked/politiboat/carvariations.meta',
  'vcf/politiboat.xml',
}

-- VW T6 Kriminalteknisk
data_file 'HANDLING_FILE' 'meta/unmarked/t6kta/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/t6kta/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/t6kta/carvariations.meta'

files {
  'meta/unmarked/t6kta/handling.meta',
  'meta/unmarked/t6kta/vehicles.meta',
  'meta/unmarked/t6kta/carvariations.meta',
  'vcf/t6kta.xml',
}

-- Obey Tailgater Civil
data_file 'HANDLING_FILE' 'meta/unmarked/tailgatercivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/tailgatercivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/tailgatercivil/carvariations.meta'

files {
  'meta/unmarked/tailgatercivil/handling.meta',
  'meta/unmarked/tailgatercivil/vehicles.meta',
  'meta/unmarked/tailgatercivil/carvariations.meta',
  'vcf/tailgatercivil.xml',
}

-- BMW 800GS Markeret Politi MC
data_file 'HANDLING_FILE' 'meta/marked/bmwmc/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/bmwmc/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/bmwmc/carvariations.meta'

files {
  'meta/marked/bmwmc/handling.meta',
  'meta/marked/bmwmc/vehicles.meta',
  'meta/marked/bmwmc/carvariations.meta',
  'vcf/bmwmc.xml',
}

-- Obey Tailgater Civil
data_file 'HANDLING_FILE' 'meta/unmarked/pradounmarked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/pradounmarked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/pradounmarked/carvariations.meta'

files {
  'meta/unmarked/pradounmarked/handling.meta',
  'meta/unmarked/pradounmarked/vehicles.meta',
  'meta/unmarked/pradounmarked/carvariations.meta',
  'vcf/pradounmarked.xml',
}

-- Obey Tailgater Civil
data_file 'HANDLING_FILE' 'meta/unmarked/jackalcivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/jackalcivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/jackalcivil/carvariations.meta'

files {
  'meta/unmarked/jackalcivil/handling.meta',
  'meta/unmarked/jackalcivil/vehicles.meta',
  'meta/unmarked/jackalcivil/carvariations.meta',
  'vcf/jackalcivil.xml',
}

-- Obey Tailgater Civil
data_file 'HANDLING_FILE' 'meta/unmarked/oraclecivil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/oraclecivil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/oraclecivil/carvariations.meta'

files {
  'meta/unmarked/oraclecivil/handling.meta',
  'meta/unmarked/oraclecivil/vehicles.meta',
  'meta/unmarked/oraclecivil/carvariations.meta',
  'vcf/oraclecivil.xml',
}

-- Dubsta Civil
data_file 'HANDLING_FILE' 'meta/unmarked/dubsta2civil/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/dubsta2civil/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/unmarked/dubsta2civil/carvariations.meta'

files {
  'meta/unmarked/dubsta2civil/handling.meta',
  'meta/unmarked/dubsta2civil/vehicles.meta',
  'meta/unmarked/dubsta2civil/carvariations.meta',
  'vcf/dubsta2civil.xml'
}

-- Speedo PD
data_file 'VEHICLE_METADATA_FILE' 'meta/unmarked/speedopd/vehicles.meta'

files {
  'meta/unmarked/speedopd/vehicles.meta'
}

-- VW Arteon Uniformeret
data_file 'HANDLING_FILE' 'meta/marked/arteonmarked/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/arteonmarked/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/arteonmarked/carvariations.meta'

files {
  'meta/marked/arteonmarked/handling.meta',
  'meta/marked/arteonmarked/vehicles.meta',
  'meta/marked/arteonmarked/carvariations.meta',
  'vcf/arteonmarked.xml',
}

-- Explorer Uniformeret
data_file 'HANDLING_FILE' 'meta/marked/explorerpoli/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/marked/explorerpoli/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/marked/explorerpoli/carvariations.meta'

files {
  'meta/marked/explorerpoli/handling.meta',
  'meta/marked/explorerpoli/vehicles.meta',
  'meta/marked/explorerpoli/carvariations.meta',
  'vcf/explorerpoli.xml',
}

-- Explorer Ambu
data_file 'HANDLING_FILE' 'meta/ambulance/explorerambu/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/explorerambu/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/explorerambu/carvariations.meta'

files {
  'meta/ambulance/explorerambu/handling.meta',
  'meta/ambulance/explorerambu/vehicles.meta',
  'meta/ambulance/explorerambu/carvariations.meta',
  'vcf/explorerambu.xml',
}

-- VW CRAFTER Ambu
data_file 'HANDLING_FILE' 'meta/ambulance/vwambulance/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/vwambulance/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/vwambulance/carvariations.meta'

files {
  'meta/ambulance/vwambulance/handling.meta',
  'meta/ambulance/vwambulance/vehicles.meta',
  'meta/ambulance/vwambulance/carvariations.meta',
  'vcf/vwambulance.xml',
}

-- VW Touareq EMS
data_file 'HANDLING_FILE' 'meta/ambulance/emstouareq/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/emstouareq/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/emstouareq/carvariations.meta'

files {
  'meta/ambulance/emstouareq/handling.meta',
  'meta/ambulance/emstouareq/vehicles.meta',
  'meta/ambulance/emstouareq/carvariations.meta',
  'vcf/emstouareq.xml',
}

-- Sprinter Ambulance
data_file 'HANDLING_FILE' 'meta/ambulance/sprinterambulance/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'meta/ambulance/sprinterambulance/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'meta/ambulance/sprinterambulance/carvariations.meta'
data_file 'CARCOLS_FILE' 'meta/ambulance/sprinterambulance/carcols.meta'

files {
  'meta/ambulance/sprinterambulance/handling.meta',
  'meta/ambulance/sprinterambulance/vehicles.meta',
  'meta/ambulance/sprinterambulance/carvariations.meta',
  'meta/ambulance/sprinterambulance/carcols.meta',
  'vcf/sprinterambulance.xml',
}

is_els 'true'
