fx_version 'adamant'
games { 'gta5' }
this_is_a_map 'yes'

description "Licensed under the Dolu License, you may not use this file except in compliance with the License. A copy of the license is available in each packages purchased on https://dolu.tebex.io"
made_by 'Dolu'

client_script {
    --'client/drug_locations.lua',
    'client/drug_locationsuj.lua',
    'client/hospital_pillbox.lua',
    'client/mojito_inn.lua',
    --'client/westons_mansion.lua',
	--'client/arcade.lua',
    'client/court.lua',
    --'client/bh_canyon_house.lua',
    --'client/the_lost.lua',
    --'client/gabz_garage.lua',
    'client/uj_facility.lua',
    'client/jdm.lua',
    'client/sandypd.lua',
}

files {
    'shellprops.ytyp',
    'shellpropsv2.ytyp',
    'shellpropsv3.ytyp',
	'shellpropsv4.ytyp',
	'shellpropsv5.ytyp',
    'shellpropsv7.ytyp',
    'shellpropsv8.ytyp',
	'shellpropsv9.ytyp',
	'shellpropsv11.ytyp',
	'shellpropsv12.ytyp',
    'shellpropsv14.ytyp',
    'shellpropsv15.ytyp',
    'shellpropsv16.ytyp',
    'cams.ytyp',
    'v_med_stretcher.ytyp',
	'fv_props.ytyp',
    'arcade_props.ytyp',
    'int_arcade.ytyp',
    'int_plan_road.ytyp',
    'int_plan.ytyp',
    'props.ytyp',
    'gabz_bennys_timecycle.xml',
    'sanhje_prison_timecycle.xml',
    'nutt_timecycle_mods_1.xml',
    'interiorproxies.meta',
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_pdm_timecycle.xml'
data_file 'TIMECYCLEMOD_FILE' 'gabz_bennys_timecycle.xml'
data_file 'TIMECYCLEMOD_FILE' 'sanhje_prison_timecycle.xml'
data_file 'TIMECYCLEMOD_FILE' 'nutt_timecycle_mods_1.xml'

data_file 'DLC_ITYP_REQUEST' 'shellprops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv3.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv4.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv5.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv7.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv8.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv9.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv11.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv12.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv14.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv15.ytyp'
data_file 'DLC_ITYP_REQUEST' 'shellpropsv16.ytyp'
data_file 'DLC_ITYP_REQUEST' 'v_med_stretcher.ytyp'
data_file "DLC_ITYP_REQUEST" "props.ytyp"
data_file "DLC_ITYP_REQUEST" "cams.ytyp"
data_file 'DLC_ITYP_REQUEST' 'fv_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'arcade_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'int_arcade.ytyp'
data_file 'DLC_ITYP_REQUEST' 'int_plan_road.ytyp'
data_file 'DLC_ITYP_REQUEST' 'int_plan.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/billboards/publist.ytyp'

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

data_file('DLC_ITYP_REQUEST')('stream/sandypd/v2_sheriff_props.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/sandypd/int_sheriff_main.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/sandypd/int_sheriff_stairs2.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/sandypd/int_sheriff_second.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/sandypd/int_sheriff_stairs1.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/sandypd/int_sheriff_first.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/prison/sanhje_Prison.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/prison/sanhje_Prison_cafeteria.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/prison/sanhje_Prison_infirmary.ytyp')
data_file('DLC_ITYP_REQUEST')('stream/prison/sanhje_prison_reception.ytyp')
data_file 'DLC_ITYP_REQUEST' 'stream/billboards/publist.ytyp'

-- Do not touch this or I will kill you
data_file 'DLC_ITYP_REQUEST' 'stream/int_dolu_sanders.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[lifttable]/dolu_prop_lifttable.ytyp'
data_file 'SCALEFORM_DLC_FILE' 'stream/[minimap]/int2587453113.gfx'

