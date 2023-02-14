Config = {}

Config.Walks = {
    ["alien"] = {"move_m@alien"},
    ["armored"] = {"anim_group_move_ballistic"},
    ["arrogant"] = {"move_f@arrogant@a"},
    ["brave"] = {"move_m@brave"},
    ["casual"] = {"move_m@casual@a"},
    ["casual2"] = {"move_m@casual@b"},
    ["casual3"] = {"move_m@casual@c"},
    ["casual4"] = {"move_m@casual@d"},
    ["casual5"] = {"move_m@casual@e"},
    ["casual6"] = {"move_m@casual@f"},
    ["chichi"] = {"move_f@chichi"},
    ["confident"] = {"move_m@confident"},
    ["cop"] = {"move_m@business@a"},
    ["cop2"] = {"move_m@business@b"},
    ["cop3"] = {"move_m@business@c"},
    ["default Female"] = {"move_f@multiplayer"},
    ["default Male"] = {"move_m@multiplayer"},
    ["drunk"] = {"move_m@drunk@a"},
    ["drunk"] = {"move_m@drunk@slightlydrunk"},
    ["drunk2"] = {"move_m@buzzed"},
    ["drunk3"] = {"move_m@drunk@verydrunk"},
    ["femme"] = {"move_f@femme@"},
    ["fire"] = {"move_characters@franklin@fire"},
    ["fire2"] = {"move_characters@michael@fire"},
    ["fire3"] = {"move_m@fire"},
    ["flee"] = {"move_f@flee@a"},
    ["franklin"] = {"move_p_m_one"},
    ["gangster"] = {"move_m@gangster@generic"},
    ["gangster2"] = {"move_m@gangster@ng"},
    ["gangster3"] = {"move_m@gangster@var_e"},
    ["gangster4"] = {"move_m@gangster@var_f"},
    ["gangster5"] = {"move_m@gangster@var_i"},
    ["grooving"] = {"anim@move_m@grooving@"},
    ["guard"] = {"move_m@prison_gaurd"},
    ["handcuffs"] = {"move_m@prisoner_cuffed"},
    ["heels"] = {"move_f@heels@c"},
    ["heels2"] = {"move_f@heels@d"},
    ["hiking"] = {"move_m@hiking"},
    ["hipster"] = {"move_m@hipster@a"},
    ["hobo"] = {"move_m@hobo@a"},
    ["hurry"] = {"move_f@hurry@a"},
    ["janitor"] = {"move_p_m_zero_janitor"},
    ["janitor2"] = {"move_p_m_zero_slow"},
    ["jog"] = {"move_m@jog@"},
    ["lemar"] = {"anim_group_move_lemar_alley"},
    ["lester"] = {"move_heist_lester"},
    ["lester2"] = {"move_lester_caneup"},
    ["maneater"] = {"move_f@maneater"},
    ["michael"] = {"move_ped_bucket"},
    ["money"] = {"move_m@money"},
    ["muscle"] = {"move_m@muscle@a"},
    ["posh"] = {"move_m@posh@"},
    ["posh2"] = {"move_f@posh@"},
    ["quick"] = {"move_m@quick"},
    ["runner"] = {"female_fast_runner"},
    ["sad"] = {"move_m@sad@a"},
    ["sassy"] = {"move_m@sassy"},
    ["sassy2"] = {"move_f@sassy"},
    ["scared"] = {"move_f@scared"},
    ["sexy"] = {"move_f@sexy@a"},
    ["shady"] = {"move_m@shadyped@a"},
	["skadet"] = {"move_m@injured"},
    ["slow"] = {"move_characters@jimmy@slow@"},
    ["swagger"] = {"move_m@swagger"},
    ["sough"] = {"move_m@tough_guy@"},
    ["tough2"] = {"move_f@tough_guy@"},
    ["trash"] = {"clipset@move@trash_fast_turn"},
    ["trash2"] = {"missfbi4prepp1_garbageman"},
    ["trevor"] = {"move_p_m_two"},
    ["wide"] = {"move_m@bag"}
}

Config.Expressions = {
    ["angry"] = {"Expression", "mood_angry_1"},
    ["drunk"] = {"Expression", "mood_drunk_1"},
    ["dumb"] = {"Expression", "pose_injured_1"},
    ["electrocuted"] = {"Expression", "electrocuted_1"},
    ["grumpy"] = {"Expression", "effort_1"},
    ["grumpy2"] = {"Expression", "mood_drivefast_1"},
    ["grumpy3"] = {"Expression", "pose_angry_1"},
    ["happy"] = {"Expression", "mood_happy_1"},
    ["injured"] = {"Expression", "mood_injured_1"},
    ["joyful"] = {"Expression", "mood_dancing_low_1"},
    ["mouthbreather"] = {"Expression", "smoking_hold_1"},
    ["never_blink"] = {"Expression", "pose_normal_1"},
    ["one_eye"] = {"Expression", "pose_aiming_1"},
    ["shocked"] = {"Expression", "shocked_1"},
    ["shocked2"] = {"Expression", "shocked_2"},
    ["sleeping"] = {"Expression", "mood_sleeping_1"},
    ["sleeping2"] = {"Expression", "dead_1"},
    ["sleeping3"] = {"Expression", "dead_2"},
    ["smug"] = {"Expression", "mood_smug_1"},
    ["speculative"] = {"Expression", "mood_aiming_1"},
    ["stressed"] = {"Expression", "mood_stressed_1"},
    ["sulking"] = {"Expression", "mood_sulk_1"},
    ["weird"] = {"Expression", "effort_2"},
    ["weird2"] = {"Expression", "effort_3"},
}

Config.Emotes = {
    ["drink"] = {
        "mp_player_inteat@pnq",
        "loop",
        "Drink",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["handsup_x"] = {
        "random@mugging3",
        "handsup_standing_base",
        "Hænderne op",
        AnimationOptions = {
            allowedWeapon = true,
            EmoteMoving = true
        }
    },
    ["beast"] = {
        "anim@mp_fm_event@intro",
        "beast_transform",
        "Beast",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["wank"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_01",
        "Fab",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["itchy"] = {
        "mp_player_int_uppergrab_crotch",
        "mp_player_int_grab_crotch",
        "Itchy",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["chill"] = {
        "switch@trevor@scares_tramp",
        "trev_scares_tramp_idle_tramp",
        "Chill",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cloudgaze"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_girl",
        "Cloudgaze",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cloudgaze2"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_guy",
        "Cloudgaze 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["prone"] = {
        "missfbi3_sniping",
        "prone_dave",
        "Prone",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pullover"] = {
        "misscarsteal3pullover",
        "pull_over_right",
        "Pullover",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ["idle"] = {
        "anim@heists@heist_corona@team_idles@male_a",
        "idle",
        "Idle",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 8"},
    ["idle9"] = {
        "friends@fra@ig_1",
        "base_idle",
        "Idle 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle10"] = {
        "mp_move@prostitute@m@french",
        "idle",
        "Idle 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["idle11"] = {
        "random@countrysiderobbery",
        "idle_a",
        "Idle 11",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle2"] = {
        "anim@heists@heist_corona@team_idles@female_a",
        "idle",
        "Idle 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle3"] = {
        "anim@heists@humane_labs@finale@strip_club",
        "ped_b_celebrate_loop",
        "Idle 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle4"] = {
        "anim@mp_celebration@idles@female",
        "celebration_idle_f_a",
        "Idle 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle5"] = {
        "anim@mp_corona_idles@female_b@idle_a",
        "idle_a",
        "Idle 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle6"] = {
        "anim@mp_corona_idles@male_c@idle_a",
        "idle_a",
        "Idle 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle7"] = {
        "anim@mp_corona_idles@male_d@idle_a",
        "idle_a",
        "Idle 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["wait3"] = {
        "amb@world_human_hang_out_street@female_hold_arm@idle_a",
        "idle_a",
        "Wait 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd1",
        "Idle Drunk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk2"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd2",
        "Idle Drunk 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk3"] = {
        "missarmenian2",
        "standing_idle_loop_drunk",
        "Idle Drunk 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
    ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},
    ["aim"] = {
        "move_weapon@pistol@copa",
        "idle",
        "Aim",
        AnimationOptions = {
            EmoteMoving = true,
            allowedWeapon = true,
        }
    },
    ["aim2"] = {
        "move_weapon@pistol@cope",
        "idle",
        "Aim 2",
        AnimationOptions = {
            EmoteMoving = true,
            allowedWeapon = true,
        }
    },
    ["argue"] = {
        "misscarsteal4@actor",
        "actor_berating_loop",
        "Argue",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["argue2"] = {
        "oddjobs@assassinate@vice@hooker",
        "argue_a",
        "Argue 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bartender"] = {
        "anim@amb@clubhouse@bar@drink@idle_a",
        "idle_a_bartender",
        "Bartender",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss"},
    ["blowkiss2"] = {
        "anim@mp_player_intselfieblow_kiss",
        "exit",
        "Blow Kiss 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy"},
    ["bringiton"] = {
        "misscommon@response",
        "bring_it_on",
        "Bring It On",
        AnimationOptions = {
            EmoteMoving = true,
            allowedWeapon = true,
            EmoteDuration = 3000
        }
    },
    ["comeatmebro"] = {
        "mini@triathlon",
        "want_some_of_this",
        "Come at me bro",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["cop2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Cop 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cop3"] = {
        "amb@code_human_police_investigate@idle_a",
        "idle_b",
        "Cop 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["crossarms"] = {
        "amb@world_human_hang_out_street@female_arms_crossed@idle_a",
        "idle_a",
        "Crossarms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms2"] = {
        "amb@world_human_hang_out_street@male_c@idle_a",
        "idle_b",
        "Crossarms 2",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["crossarms3"] = {
        "anim@heists@heist_corona@single_team",
        "single_team_loop_boss",
        "Crossarms 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms4"] = {
        "random@street_race",
        "_car_b_lookout",
        "Crossarms 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms5"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Crossarms 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Fold Arms 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            allowedWeapon = true,
        }
    },
    ["crossarms6"] = {
        "random@shop_gunstore",
        "_idle",
        "Crossarms 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms7"] = {
        "switch@franklin@gang_taunt_p5",
        "fras_ig_6_p5_loop_g2",
        "Crossarms 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "stand_phone_phoneputdown_idle_nowork",
        "Fold Arms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            allowedWeapon = true,
        }
    },
    ["crossarmsside"] = {
        "rcmnigel1a_band_groupies",
        "base_m2",
        "Crossarms Side",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["damn"] = {
        "gestures@m@standing@casual",
        "gesture_damn",
        "Damn",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["damn2"] = {
        "anim@am_hold_up@male",
        "shoplift_mid",
        "Damn 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["pointdown"] = {
        "gestures@f@standing@casual",
        "gesture_hand_down",
        "Point Down",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["surrender"] = {
        "random@arrests@busted",
        "idle_a",
        "surrender",
        AnimationOptions = {
            EmoteLoop = true,
            allowedWeapon = true,
        }
    },
    ["facepalm2"] = {
        "anim@mp_player_intcelebrationfemale@face_palm",
        "face_palm",
        "Facepalm 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm"] = {
        "random@car_thief@agitated@idle_a",
        "agitated_idle_a",
        "Facepalm",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm3"] = {
        "missminuteman_1ig_2",
        "tasered_2",
        "Facepalm 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm4"] = {
        "anim@mp_player_intupperface_palm",
        "idle_a",
        "Facepalm 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over"},
    ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 2"},
    ["fallover3"] = {"mp_suicide", "pill", "Fall Over 3"},
    ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 4"},
    ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 5"},
    ["fallasleep"] = {
        "mp_sleep",
        "sleep_loop",
        "Fall Asleep",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me"},
    ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 2"},
    ["finger"] = {
        "anim@mp_player_intselfiethe_bird",
        "idle_a",
        "Finger",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["finger2"] = {
        "anim@mp_player_intupperfinger",
        "idle_a_fp",
        "Finger 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Handshake",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Handshake 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["wait4"] = {
        "amb@world_human_hang_out_street@Female_arm_side@idle_a",
        "idle_a",
        "Wait 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["wait5"] = {
        "missclothing",
        "idle_storeclerk",
        "Wait 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait6"] = {
        "timetable@amanda@ig_2",
        "ig_2_base_amanda",
        "Wait 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait7"] = {
        "rcmnigel1cnmt_1c",
        "base",
        "Wait 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait8"] = {
        "rcmjosh1",
        "idle",
        "Wait 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait9"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Wait 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait10"] = {
        "timetable@amanda@ig_3",
        "ig_3_base_tracy",
        "Wait 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait11"] = {
        "misshair_shop@hair_dressers",
        "keeper_base",
        "Wait 11",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hiking"] = {
        "move_m@hiking",
        "idle",
        "Hiking",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug"},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2"},
    ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3"},
    ["inspect"] = {"random@train_tracks", "idle_e", "Inspect"},
    ["jazzhands"] = {
        "anim@mp_player_intcelebrationfemale@jazz_hands",
        "jazz_hands",
        "Jazzhands",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 6000
        }
    },
    ["jog2"] = {
        "amb@world_human_jog_standing@male@idle_a",
        "idle_a",
        "Jog 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog3"] = {
        "amb@world_human_jog_standing@female@idle_a",
        "idle_a",
        "Jog 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog4"] = {
        "amb@world_human_power_walker@female@idle_a",
        "idle_a",
        "Jog 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog5"] = {
        "move_m@joy@a",
        "walk",
        "Jog 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jumpingjacks"] = {
        "timetable@reunited@ig_2",
        "jimmy_getknocked",
        "Jumping Jacks",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kneel2"] = {
        "rcmextreme3",
        "idle",
        "Kneel 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kneel3"] = {
        "amb@world_human_bum_wash@male@low@idle_a",
        "idle_a",
        "Kneel 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["knock"] = {
        "timetable@jimmy@doorknock@",
        "knockdoor_idle",
        "Knock",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["knock2"] = {
        "missheistfbi3b_ig7",
        "lift_fibagent_loop",
        "Knock 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["knucklecrunch"] = {
        "anim@mp_player_intcelebrationfemale@knuckle_crunch",
        "knuckle_crunch",
        "Knuckle Crunch",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
    ["lean2"] = {
        "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
        "idle_a",
        "Lean 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean3"] = {
        "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a",
        "idle_a",
        "Lean 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean4"] = {
        "amb@world_human_leaning@male@wall@back@foot_up@idle_a",
        "idle_a",
        "Lean 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean5"] = {
        "amb@world_human_leaning@male@wall@back@hands_together@idle_b",
        "idle_b",
        "Lean 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanflirt"] = {
        "random@street_race",
        "_car_a_flirt_girl",
        "Lean Flirt",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar2"] = {
        "amb@prop_human_bum_shopping_cart@male@idle_a",
        "idle_c",
        "Lean Bar 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar3"] = {
        "anim@amb@nightclub@lazlow@ig1_vip@",
        "clubvip_base_laz",
        "Lean Bar 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar4"] = {
        "anim@heists@prison_heist",
        "ped_b_loop_a",
        "Lean Bar 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanhigh"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_one",
        "Lean High",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanhigh2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Lean High 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside"] = {
        "timetable@mime@01_gc",
        "idle_a",
        "Leanside",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside2"] = {
        "misscarstealfinale",
        "packer_idle_1_trevor",
        "Leanside 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside3"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside4"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["leanside5"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Leanside 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["me"] = {
        "gestures@f@standing@casual",
        "gesture_me_hard",
        "Me",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["mechanic"] = {
        "mini@repair",
        "fixing_a_ped",
        "Mechanic",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mechanic2"] = {
        "amb@world_human_vehicle_mechanic@male@base",
        "idle_a",
        "Mechanic 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mechanic3"] = {
        "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        "machinic_loop_mechandplayer",
        "Mechanic 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mechanic4"] = {
        "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        "machinic_loop_mechandplayer",
        "Mechanic 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["medic2"] = {
        "amb@medic@standing@tendtodead@base",
        "base",
        "Medic 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["meditate"] = {
        "rcmcollect_paperleadinout@",
        "meditiate_idle",
        "Meditiate",
        AnimationOptions = { -- CHANGE ME
            EmoteLoop = true
        }
    },
    ["meditate2"] = {
        "rcmepsilonism3",
        "ep_3_rcm_marnie_meditating",
        "Meditiate 2",
        AnimationOptions = { -- CHANGE ME
            EmoteLoop = true
        }
    },
    ["meditate3"] = {
        "rcmepsilonism3",
        "base_loop",
        "Meditiate 3",
        AnimationOptions = { -- CHANGE ME
            EmoteLoop = true
        }
    },
    ["metal"] = {
        "anim@mp_player_intincarrockstd@ps@",
        "idle_a",
        "Metal",
        AnimationOptions = { -- CHANGE ME
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no"] = {
        "anim@heists@ornate_bank@chat_manager",
        "fail",
        "No",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no2"] = {
        "mp_player_int_upper_nod",
        "mp_player_int_nod_no",
        "No 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nosepick"] = {
        "anim@mp_player_intcelebrationfemale@nose_pick",
        "nose_pick",
        "Nose Pick",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nosepick2"] = {
        "anim@mp_player_intcelebrationmale@nose_pick",
        "nose_pick",
        "Nose Pick 2",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["noway"] = {
        "gestures@m@standing@casual",
        "gesture_no_way",
        "No Way",
        AnimationOptions = {
            EmoteDuration = 1500,
            EmoteMoving = true
        }
    },
    ["dab"] = {
        "custom@dab",
        "Dab",
        AnimationOptions = {
            EmoteMoving = true,
        }
    },
--    ["sheeeeesh"] = {
--        "custom@sheeeeesh",
--        "sheeeeesh",
--        "Sheeeeesh",
--        AnimationOptions = {
--            EmoteLoop = true,
--            EmoteDuration = 1500,
--        }
--    },
    ["ok"] = {
        "anim@mp_player_intselfiedock",
        "idle_a",
        "OK",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["outofbreath"] = {
        "re@construction",
        "out_of_breath",
        "Out of Breath",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pickup"] = {"random@domestic", "pickup_low", "Pickup"},
    ["push"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_f",
        "Push",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["push2"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_m",
        "Push 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["point"] = {
        "gestures@f@standing@casual",
        "gesture_point",
        "Point",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pushup"] = {
        "amb@world_human_push_ups@male@idle_a",
        "idle_d",
        "Pushup",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["countdown"] = {
        "random@street_race",
        "grid_girl_race_start",
        "Countdown",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pointright"] = {
        "mp_gun_shop_tut",
        "indicate_right",
        "Point Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute"] = {
        "anim@mp_player_intincarsalutestd@ds@",
        "idle_a",
        "Salute",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute2"] = {
        "anim@mp_player_intincarsalutestd@ps@",
        "idle_a",
        "Salute 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute3"] = {
        "anim@mp_player_intuppersalute",
        "idle_a",
        "Salute 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared"] = {
        "random@domestic",
        "f_distressed_loop",
        "Scared",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared2"] = {
        "random@homelandsecurity",
        "knees_loop_girl",
        "Scared 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["screwyou"] = {
        "misscommon@response",
        "screw_you",
        "Screw You",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shakeoff"] = {
        "move_m@_idles@shake_off",
        "shakeoff_1",
        "Shake Off",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3500
        }
    },
    ["shot"] = {
        "random@dealgonewrong",
        "idle_a",
        "Shot",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sleep"] = {
        "timetable@tracy@sleep@",
        "idle_c",
        "Sleep",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["shrug"] = {
        "gestures@f@standing@casual",
        "gesture_shrug_hard",
        "Shrug",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["shrug2"] = {
        "gestures@m@standing@casual",
        "gesture_shrug_hard",
        "Shrug 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["sit"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_idle_nowork",
        "Sit",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit2"] = {
        "rcm_barry3",
        "barry_3_sit_loop",
        "Sit 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit3"] = {
        "amb@world_human_picnic@male@idle_a",
        "idle_a",
        "Sit 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit4"] = {
        "amb@world_human_picnic@female@idle_a",
        "idle_a",
        "Sit 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit5"] = {
        "anim@heists@fleeca_bank@ig_7_jetski_owner",
        "owner_idle",
        "Sit 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit6"] = {
        "timetable@jimmy@mics3_ig_15@",
        "idle_a_jimmy",
        "Sit 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit7"] = {
        "anim@amb@nightclub@lazlow@lo_alone@",
        "lowalone_base_laz",
        "Sit 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit8"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_jimmy",
        "Sit 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sit9"] = {
        "amb@world_human_stupor@male@idle_a",
        "idle_a",
        "Sit 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitlean"] = {
        "timetable@tracy@ig_14@",
        "ig_14_base_tracy",
        "Sit Lean",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "Sit Sad",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitscared"] = {
        "anim@heists@ornate_bank@hostages@hit",
        "hit_loop_ped_b",
        "Sit Scared",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitscared2"] = {
        "anim@heists@ornate_bank@hostages@ped_c@",
        "flinch_loop",
        "Sit Scared 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitscared3"] = {
        "anim@heists@ornate_bank@hostages@ped_e@",
        "flinch_loop",
        "Sit Scared 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitdrunk"] = {
        "timetable@amanda@drunk@base",
        "base",
        "Sit Drunk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchair2"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Sit Chair 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchair3"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Sit Chair 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchair4"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Sit Chair 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["weepingsit"] = {
        "timetable@tracy@ig_1@base",
        "base",
        "Weepingsit",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchair5"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_tracy",
        "Sit Chair 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchair6"] = {
        "timetable@maid@couch@",
        "base",
        "Sit Chair 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitchairside"] = {
        "timetable@ron@ron_ig_2_alt1",
        "ig_2_alt1_base",
        "Sit Chair Side",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["situp"] = {
        "amb@world_human_sit_ups@male@idle_a",
        "idle_a",
        "Sit Up",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clapangry"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "angry_clap_a_player_a",
        "Clap Angry",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["slowclap3"] = {
        "anim@mp_player_intupperslow_clap",
        "idle_a",
        "Slow Clap 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clap"] = {
        "amb@world_human_cheering@male_a",
        "base",
        "Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["slowclap"] = {
        "anim@mp_player_intcelebrationfemale@slow_clap",
        "slow_clap",
        "Slow Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["slowclap2"] = {
        "anim@mp_player_intcelebrationmale@slow_clap",
        "slow_clap",
        "Slow Clap 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smell"] = {
        "move_p_m_two_idles@generic",
        "fidget_sniff_fingers",
        "Smell",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Stick Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stumble"] = {
        "misscarsteal4@actor",
        "stumble",
        "Stumble",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stunned"] = {
        "stungun@standing",
        "damage",
        "Stunned",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sunbathe"] = {
        "amb@world_human_sunbathe@male@back@base",
        "base",
        "Sunbathe",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sunbathe2"] = {
        "amb@world_human_sunbathe@female@back@base",
        "base",
        "Sunbathe 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["t"] = {
        "missfam5_yoga",
        "a2_pose",
        "T",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["t2"] = {
        "mp_sleep",
        "bind_pose_180",
        "T 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["think5"] = {
        "mp_cp_welcome_tutthink",
        "b_think",
        "Think 5",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["think"] = {
        "misscarsteal4@aliens",
        "rehearsal_base_idle_director",
        "Think",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["think3"] = {
        "timetable@tracy@ig_8@base",
        "base",
        "Think 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["think2"] = {
        "missheist_jewelleadinout",
        "jh_int_outro_loop_a",
        "Think 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["thumbsup3"] = {
        "anim@mp_player_intincarthumbs_uplow@ds@",
        "enter",
        "Thumbs Up 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["thumbsup2"] = {
        "anim@mp_player_intselfiethumbs_up",
        "idle_a",
        "Thumbs Up 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["thumbsup"] = {
        "anim@mp_player_intupperthumbs_up",
        "idle_a",
        "Thumbs Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type"] = {
        "anim@heists@prison_heiststation@cop_reactions",
        "cop_b_idle",
        "Type",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type2"] = {
        "anim@heists@prison_heistig1_p1_guard_checks_bus",
        "loop",
        "Type 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type3"] = {
        "mp_prison_break",
        "hack_loop",
        "Type 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type4"] = {
        "mp_fbi_heist",
        "loop",
        "Type 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["warmth"] = {
        "amb@world_human_stand_fire@male@idle_a",
        "idle_a",
        "Warmth",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave4"] = {
        "random@mugging5",
        "001445_01_gangintimidation_1_female_idle_b",
        "Wave 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["wave2"] = {
        "anim@mp_player_intcelebrationfemale@wave",
        "wave",
        "Wave 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave3"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Wave 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave"] = {
        "friends@frj@ig_1",
        "wave_a",
        "Wave",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave5"] = {
        "friends@frj@ig_1",
        "wave_b",
        "Wave 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave6"] = {
        "friends@frj@ig_1",
        "wave_c",
        "Wave 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave7"] = {
        "friends@frj@ig_1",
        "wave_d",
        "Wave 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave8"] = {
        "friends@frj@ig_1",
        "wave_e",
        "Wave 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave9"] = {
        "gestures@m@standing@casual",
        "gesture_hello",
        "Wave 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wavehigh"] = {
        "anim@amb@waving@male",
        "ground_wave",
        "Wave High",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wavehigh2"] = {
        "anim@amb@waving@female",
        "ground_wave",
        "Wave High 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wavehigh3"] = {
        "anim@amb@waving@male",
        "air_wave",
        "Wave High 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wavehigh4"] = {
        "anim@amb@waving@female",
        "air_wave",
        "Wave High 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whistle"] = {
        "taxi_hail",
        "hail_taxi",
        "Whistle",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ["whistle2"] = {
        "rcmnigel1c",
        "hailing_whistle_waive_a",
        "Whistle 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["yeah"] = {
        "anim@mp_player_intupperair_shagging",
        "idle_a",
        "Yeah",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lift"] = {
        "random@hitch_lift",
        "idle_f",
        "Lift",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lol"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "laugh_a_player_b",
        "LOL",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lol2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "giggle_a_player_b",
        "LOL 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["statue2"] = {
        "fra_0_int-1",
        "cs_lamardavis_dual-1",
        "Statue 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["statue3"] = {
        "club_intro2-0",
        "csb_englishdave_dual-0",
        "Statue 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["gangsign"] = {
        "mp_player_int_uppergang_sign_a",
        "mp_player_int_gang_sign_a",
        "Gang Sign",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign2"] = {
        "mp_player_int_uppergang_sign_b",
        "mp_player_int_gang_sign_b",
        "Gang Sign 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["passout"] = {
        "missarmenian2",
        "drunk_loop",
        "Passout",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["passout2"] = {
        "missarmenian2",
        "corpse_search_exit_ped",
        "Passout 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["passout3"] = {
        "anim@gangops@morgue@table@",
        "body_search",
        "Passout 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["passout4"] = {
        "mini@cpr@char_b@cpr_def",
        "cpr_pumpchest_idle",
        "Passout 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["passout5"] = {
        "random@mugging4",
        "flee_backward_loop_shopkeeper",
        "Passout 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["petting"] = {
        "creatures@rottweiler@tricks@",
        "petting_franklin",
        "Petting",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["crawl"] = {
        "move_injured_ground",
        "front_loop",
        "Crawl",
        AnimationOptions = {
            EmoteLoop = true
        }
    },

    ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2"},
    ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip"},
    ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide"},
    ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2"},
    ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3"},
    ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger"},

    ["flipoff"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_a_1st",
        "Flip Off",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["flipoff2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_c_1st",
        "Flip Off 2",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["bow"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_c_1st",
        "Bow",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bow2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_a_1st",
        "Bow 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["keyfob"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Key Fob",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Golf Swing"},
    ["eat"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Eat",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["reaching"] = {
        "move_m@intimidation@cop@unarmed",
        "idle",
        "Reaching",
        AnimationOptions = {
            EmoteLoop = true,
            allowedWeapon = true,
            EmoteMoving = true
        }
    },
    ["wait"] = {
        "random@shop_tattoo",
        "_idle_a",
        "Wait",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait2"] = {
        "missbigscore2aig_3",
        "wait_for_van_c",
        "Wait 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait12"] = {
        "rcmjosh1",
        "idle",
        "Wait 12",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait13"] = {
        "rcmnigel1a",
        "base",
        "Wait 13",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait14"] = {
        "anim@amb@casino@hangout@ped_male@stand@01a@base",
        "base",
        "Wait 14",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait15"] = {
        "anim@amb@carmeet@checkout_car@female_a@base",
        "base",
        "Wait 15",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait16"] = {
        "anim@amb@carmeet@checkout_car@male_a@base",
        "base",
        "Wait 16",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait17"] = {
        "anim@amb@carmeet@checkout_engine@female_a@base",
        "base",
        "Wait 17",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["interested"] = {
        "anim@amb@casino@bar@special_peds@lauren@01a@base@",
        "base_lauren",
        "Interested",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lapdance2"] = {
        "mini@strip_club@private_dance@idle",
        "priv_dance_idle",
        "Lapdance 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance3"] = {
        "mini@strip_club@private_dance@part2",
        "priv_dance_p2",
        "Lapdance 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance4"] = {
        "mini@strip_club@private_dance@part3",
        "priv_dance_p3",
        "Lapdance 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["twerk"] = {
        "switch@trevor@mocks_lapdance",
        "001443_01_trvs_28_idle_stripper",
        "Twerk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Slap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt"},
    ["fishdance"] = {
        "anim@mp_player_intupperfind_the_fish",
        "idle_a",
        "Fish Dance",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace"] = {
        "mp_player_int_upperpeace_sign",
        "mp_player_int_peace_sign",
        "Peace",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign"] = {
        "mp_player_int_uppergang_sign_a",
        "mp_player_int_gang_sign_a",
        "Gangsign 1",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign2"] = {
        "mp_player_int_uppergang_sign_b",
        "mp_player_int_gang_sign_b",
        "Gangsign 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ms13"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@std@rps@base",
        "idle_a",
        "MS-13",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["neighbors"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@std@ds@base",
        "idle_a",
        "Neighborhood Crip",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign7"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",
        "idle_a",
        "Gangsign 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign6"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@std@rps@base",
        "idle_a",
        "Gangsign 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hoover"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@std@rds@base",
        "idle_a",
        "W/S Hoover",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign8"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@std@ds@base",
        "idle_a",
        "Gangsign 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign5"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base",
        "idle_a",
        "Gangsign 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign4"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rps@base",
        "idle_a",
        "Gangsign 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign3"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base",
        "idle_a",
        "Gangsign 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace2"] = {
        "anim@mp_player_intupperpeace",
        "idle_a",
        "Peace 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace3"] = {
        "anim@mp_player_intcelebrationfemale@v_sign",
        "v_sign",
        "Peace 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace4"] = {
        "anim@mp_player_intincarv_signbodhi@ds@",
        "idle_a",
        "Peace 4",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["peace5"] = {
        "anim@mp_player_intincarv_signbodhi@ps@",
        "idle_a",
        "Peace 5",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["peace6"] = {
        "mp_player_int_upperv_sign",
        "mp_player_int_v_sign",
        "Peace 6",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["cpr"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cpr2"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ledge"] = {
        "missfbi1",
        "ledge_loop",
        "Ledge",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["airplane"] = {
        "missfbi1",
        "ledge_loop",
        "Air Plane",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peek"] = {
        "random@paparazzi@peek",
        "left_peek_a",
        "Peek",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cough"] = {
        "timetable@gardener@smoking_joint",
        "idle_cough",
        "Cough",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stretch"] = {
        "mini@triathlon",
        "idle_e",
        "Stretch",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch2"] = {
        "mini@triathlon",
        "idle_f",
        "Stretch 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch3"] = {
        "mini@triathlon",
        "idle_d",
        "Stretch 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch4"] = {
        "rcmfanatic1maryann_stretchidle_b",
        "idle_e",
        "Stretch 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["celebrate"] = {
        "rcmfanatic1celebrate",
        "celebrate",
        "Celebrate",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["punching"] = {
        "rcmextreme2",
        "loop_punching",
        "Punching",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["superhero"] = {
        "rcmbarry",
        "base",
        "Superhero",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["superhero2"] = {
        "rcmbarry",
        "base",
        "Superhero 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mindcontrol"] = {
        "rcmbarry",
        "mind_control_b_loop",
        "Mind Control",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mindcontrol2"] = {
        "rcmbarry",
        "bar_1_attack_idle_aln",
        "Mind Control 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown"] = {
        "rcm_barry2",
        "clown_idle_0",
        "Clown",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown2"] = {
        "rcm_barry2",
        "clown_idle_1",
        "Clown 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown3"] = {
        "rcm_barry2",
        "clown_idle_2",
        "Clown 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown4"] = {
        "rcm_barry2",
        "clown_idle_3",
        "Clown 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clown5"] = {
        "rcm_barry2",
        "clown_idle_6",
        "Clown 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes"] = {
        "mp_clothing@female@trousers",
        "try_trousers_neutral_a",
        "Try Clothes",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes2"] = {
        "mp_clothing@female@shirt",
        "try_shirt_positive_a",
        "Try Clothes 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes3"] = {
        "mp_clothing@female@shoes",
        "try_shoes_positive_a",
        "Try Clothes 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["nervous2"] = {
        "mp_missheist_countrybank@nervous",
        "nervous_idle",
        "Nervous 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous"] = {
        "amb@world_human_bum_standing@twitchy@idle_a",
        "idle_c",
        "Nervous",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous3"] = {
        "rcmme_tracey1",
        "nervous_loop",
        "Nervous 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["uncuff"] = {
        "mp_arresting",
        "a_uncuff",
        "Uncuff",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["namaste"] = {
        "timetable@amanda@ig_4",
        "ig_4_base",
        "Namaste",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dj"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_dance_cntr_open_dix",
        "DJ",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["threaten"] = {
        "random@atmrobberygen",
        "b_atm_mugging",
        "Threaten",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["radio"] = {
        "random@arrests",
        "generic_radio_chatter",
        "Radio",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pull"] = {
        "random@mugging4",
        "struggle_loop_b_thief",
        "Pull",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bird"] = {"random@peyote@bird", "wakeup", "Bird"},
    ["chicken"] = {
        "random@peyote@chicken",
        "wakeup",
        "Chicken",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bark"] = {"random@peyote@dog", "wakeup", "Bark"},
    ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit"},
    ["spiderman"] = {
        "missexile3",
        "ex03_train_roof_idle",
        "Spider-Man",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["boi"] = {
        "special_ped@jane@monologue_5@monologue_5c",
        "brotheradrianhasshown_2",
        "BOI",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["adjust"] = {
        "missmic4",
        "michael_tux_fidget",
        "Adjust",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["handsup"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Hands Up",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["pee"] = {
        "misscarsteal2peeing",
        "peeing_loop",
        "Pee",
        AnimationOptions = {
            EmoteStuck = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
            PtfxInfo = 'Tisse',
            PtfxWait = 3000
        }
    },
    ["umbrella"] = {
        "amb@world_human_drinking@coffee@male@base",
        "base",
        "Umbrella",
        AnimationOptions = {
            Prop = "p_amb_brolly_01",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["candy"] = {
        "anim@move_f@waitress",
        "idle",
        "Candy",
        AnimationOptions = {
            Prop = "prop_candy_pqs",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 0.0, -190.0, 90.0},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["waitress"] = {
        "anim@move_f@waitress",
        "idle",
        "Waitress",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_03",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 0.0, -190.0, 90.0},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["waitress2"] = {
        "anim@move_f@waitress",
        "idle",
        "Waitress 2",
        AnimationOptions = {
            Prop = "prop_cs_plate_01",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, -0.01, 0.0, -190.0, 90.0},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["notepad"] = {
        "missheistdockssetup1clipboard@base",
        "base",
        "Notepad",
        AnimationOptions = {
            Prop = "prop_notepad_01",
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            SecondProp = "prop_pencil_01",
            SecondPropBone = 58866,
            SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["box"] = {
        "anim@heists@box_carry@",
        "idle",
        "Box",
        AnimationOptions = {
            Prop = "hei_prop_heist_box",
            PropBone = 60309,
            PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["pizza"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pizza",
        AnimationOptions = {
            Prop = "prop_pizza_box_02",
            PropBone = 60309,
            PropPlacement = {0.115, 0.0, 0.225, -125.0, 110.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["laundry"] = {
        "anim@heists@box_carry@",
        "idle",
        "Laundry",
        AnimationOptions = {
            Prop = "v_res_tre_laundrybasket",
            PropBone = 60309,
            PropPlacement = {0.115, 0.0, 0.225, -125.0, 110.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["rose"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Rose",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke2"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_c",
        "Smoke 2",
        AnimationOptions = {
            Prop = "prop_cs_ciggy_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke3"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_b",
        "Smoke 3",
        AnimationOptions = {
            Prop = "prop_cs_ciggy_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke4"] = {
        "amb@world_human_smoking@female@idle_a",
        "idle_b",
        "Smoke 4",
        AnimationOptions = {
            Prop = "prop_cs_ciggy_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bong"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong",
        AnimationOptions = {
            Prop = "hei_heist_sh_bong_01",
            PropBone = 18905,
            PropPlacement = {0.10, -0.25, 0.0, 95.0, 190.0, 180.0}
        }
    },
    ["suitcase"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Suitcase",
        AnimationOptions = {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["suitcase2"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Suitcase 2",
        AnimationOptions = {
            Prop = "prop_security_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mugshot"] = {
        "mp_character_creation@customise@male_a",
        "loop",
        "Mugshot",
        AnimationOptions = {
            Prop = "prop_police_id_board",
            PropBone = 58868,
            PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["coffee"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Coffee",
        AnimationOptions = {
            Prop = "p_amb_coffeecup_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskey"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Whiskey",
        AnimationOptions = {
            Prop = "prop_drink_whisky",
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Beer",
        AnimationOptions = {
            Prop = "prop_amb_beer_bottle",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cup"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Cup",
        AnimationOptions = {
            Prop = "prop_plastic_cup_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["donut"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut",
        AnimationOptions = {
            Prop = "prop_amb_donut",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["burger"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Burger",
        AnimationOptions = {
            Prop = "prop_cs_burger_01",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["taco"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Taco",
        AnimationOptions = {
            Prop = "prop_taco_01",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["sandwich"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Sandwich",
        AnimationOptions = {
            Prop = "prop_sandwich_01",
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["soda"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Soda",
        AnimationOptions = {
            Prop = "prop_ecola_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["egobar"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Ego Bar",
        AnimationOptions = {
            Prop = "prop_choc_ego",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true
        }
    },
    ["wine"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Wine",
        AnimationOptions = {
            Prop = "prop_drink_redwine",
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["flute"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Flute",
        AnimationOptions = {
            Prop = "prop_champ_flute",
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["pcamera"] = {
        "amb@world_human_binoculars@male@idle_a", 
        "idle_c",
        "PCamera",
        AnimationOptions = {
            Prop = "prop_pap_polaroidcamera_01",
            PropBone = 28422,
            PropPlacement = {-0.06, 0.02, -0.04, 0.0, 0.0, 0.0},
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["champagne"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Champagne",
        AnimationOptions = {
            Prop = "prop_drink_champ",
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cigar"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar",
        AnimationOptions = {
            Prop = "prop_cigar_02",
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cigar2"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar 2",
        AnimationOptions = {
            Prop = "prop_cigar_01",
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["guitar"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar2"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Guitar 2",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric",
        AnimationOptions = {
            Prop = "prop_el_guitar_01",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric2"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric 2",
        AnimationOptions = {
            Prop = "prop_el_guitar_03",
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["book"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Book",
        AnimationOptions = {
            Prop = "prop_novel_01",
            PropBone = 6286,
            PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bouquet"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Bouquet",
        AnimationOptions = {
            Prop = "prop_snow_flower_02",
            PropBone = 24817,
            PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Teddy",
        AnimationOptions = {
            Prop = "v_ilev_mr_rasberryclean",
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy2"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Teddy2",
        AnimationOptions = {
            Prop = "v_club_vu_bear",
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["gift"] = {
        "bz@give_love@anim",
        "bz_give",
        "Gift",
        AnimationOptions = {
            Prop = "bz_prop_gift",
            PropBone = 57005,
            PropPlacement = {0.15, -0.08, -0.08, -60.0, -120.0, 40.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["gift2"] = {
        "bz@give_love@anim",
        "bz_give",
        "Gift 2",
        AnimationOptions = {
            Prop = "bz_prop_gift2",
            PropBone = 57005,
            PropPlacement = {0.15, -0.08, -0.08, -60.0, -120.0, 40.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["milka"] = {
        "bz@give_love@anim",
        "bz_give",
        "Milka",
        AnimationOptions = {
            Prop = "bz_prop_milka",
            PropBone = 57005,
            PropPlacement = {0.12, -0.05, -0.14, -19.0, -109.0, 40.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jewel"] = {
        "bz@give_love@anim",
        "bz_give",
        "Jewel",
        AnimationOptions = {
            Prop = "bz_prop_jewel",
            PropBone = 57005,
            PropPlacement = {0.13, 0.0, -0.19, -38.0, -120.0, 40.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["spurgt"] = {
        "bz@give_love@anim",
        "bz_give",
        "Spurgt",
        AnimationOptions = {
            Prop = "bz_prop_spurgt",
            PropBone = 57005,
            PropPlacement = {0.12, -0.05, -0.14, -19.0, -109.0, 40.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["backpack"] = {
        "move_p_m_zero_rucksack",
        "idle",
        "Backpack",
        AnimationOptions = {
            Prop = "p_michael_backpack_s",
            PropBone = 24818,
            PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["clipboard"] = {
        "missfam4",
        "base",
        "Clipboard",
        AnimationOptions = {
            Prop = "p_amb_clipboard_01",
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Map",
        AnimationOptions = {
            Prop = "prop_tourist_map_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["beg"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Beg",
        AnimationOptions = {
            Prop = "prop_beggers_sign_03",
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["makeitrain"] = {
        "anim@mp_player_intupperraining_cash",
        "idle_a",
        "Make It Rain",
        AnimationOptions = {
            Prop = "prop_anim_cash_pile_01",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_xs_celebration",
            PtfxName = "scr_xs_money_rain",
            PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
            PtfxInfo = 'Make It Rain',
            PtfxWait = 500
        }
    },
    ["camera"] = {
        "amb@world_human_paparazzi@male@base",
        "base",
        "Camera",
        AnimationOptions = {
            Prop = "prop_pap_camera_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["champagnespray"] = {
        "anim@mp_player_intupperspray_champagne",
        "idle_a",
        "Champagne Spray",
        AnimationOptions = {
            Prop = "ba_prop_battle_champ_open",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_ba_club",
            PtfxName = "scr_ba_club_champagne_spray",
            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            PtfxInfo = 'Spray Champ',
            PtfxWait = 500
        }
    },
    ["joint"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Joint",
        AnimationOptions = {
            Prop = "p_cs_joint_02",
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cig"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cig",
        AnimationOptions = {
            Prop = "prop_amb_ciggy_01",
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["brief3"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Brief 3",
        AnimationOptions = {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tablet",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tablet 2",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Phone Call",
        AnimationOptions = {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phone"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Phone",
        AnimationOptions = {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean"] = {
        "timetable@floyd@clean_kitchen@base",
        "base",
        "Clean",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean2"] = {
        "amb@world_human_maid_clean@",
        "base",
        "Clean 2",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
    ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
    ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin"},
    ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
    ["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Cheer"},
    ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"},
    ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},
    ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop"},
    ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Cop Beacon"},
    ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
    ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
    ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard"},
    ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
    ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
    ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
    ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
    ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog"},
    ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
    ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leafblower"},
    ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
    ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar"},
    ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout"},
    ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
    ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
    ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
    ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
    ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
    ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
    ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Texting"},
    ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
    ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
    ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
    ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
    ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair"},
    ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
    ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke Weed"},
    ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
    ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 3"},
    ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back"},
    ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
    ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},
    ["joint2"] = {"Scenario", "WORLD_HUMAN_SMOKING_POT", "Joint"},
    ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
    ["fising"] = {"Scenario", "world_human_stand_fishing", "Fisker"},
    ["planter"] = {"Scenario", "world_human_gardener_plant", "Gardner"},
    ["binoculars"] = {"Scenario", "WORLD_HUMAN_BINOCULARS", "Kikkert"},
    ["drilling"] = {"Scenario", "WORLD_HUMAN_CONST_DRILL", "Construction Drilling"},
    ["dancef"] = {
        "anim@amb@nightclub@dancers@solomun_entourage@",
        "mi_dance_facedj_17_v1_female^1",
        "Dance F",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Dance F2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef4"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^1",
        "Dance F4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef5"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^3",
        "Dance F5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef6"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Dance Slow 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center_down",
        "Dance Slow 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center",
        "Dance Slow 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance"] = {
        "anim@amb@nightclub@dancers@podium_dancers@",
        "hi_dance_facedj_17_v2_male^5",
        "Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_down",
        "Dance 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "high_center",
        "Dance 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_up",
        "Dance 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceupper"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Upper",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceupper2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center_up",
        "Dance Upper 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dancesalsa"] = {
        "anim@mp_player_intcelebrationmale@salsa_roll",
        "salsa_roll",
        "Dance Salsa",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["salsa"] = {
        "custom@salsa",
        "Salsa",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["gangnam"] = {
        "custom@gangnamstyle",
        "GangnamStyle",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cantsee"] = {
        "custom@cantsee",
        "Cantsee",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["makarena"] = {
        "custom@makarena",
        "Makarena",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["armswirl"] = {
        "custom@armswirl",
        "Armswirl",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["armwave"] = {
        "custom@armwave",
        "Armwave",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["circlecrunch"] = {
        "custom@circlecrunch",
        "CircleCrunch",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["dig"] = {
        "custom@dig",
        "Dig",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = false,
        }
    },
    ["whatidk"] = {
        "custom@what_idk",
        "What idk",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = false,
        }
    },
    ["maraschino"] = {
        "custom@maraschino",
        "Maraschino",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["danceshy"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "low_center",
        "Dance Shy",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceshy2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center_down",
        "Dance Shy 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "low_center",
        "Dance Slow",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly9"] = {
        "rcmnigel1bnmt_1b",
        "dance_loop_tyler",
        "Dance Silly 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance6"] = {
        "misschinese2_crystalmazemcs1_cs",
        "dance_loop_tao",
        "Dance 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance7"] = {
        "misschinese2_crystalmazemcs1_ig",
        "dance_loop_tao",
        "Dance 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance8"] = {
        "missfbi3_sniping",
        "dance_m_default",
        "Dance 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly"] = {
        "special_ped@mountain_dancer@monologue_3@monologue_3a",
        "mnt_dnc_buttwag",
        "Dance Silly",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly2"] = {
        "move_clown@p_m_zero_idles@",
        "fidget_short_dance",
        "Dance Silly 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly3"] = {
        "move_clown@p_m_two_idles@",
        "fidget_short_dance",
        "Dance Silly 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly4"] = {
        "anim@amb@nightclub@lazlow@hi_podium@",
        "danceidle_hi_11_buttwiggle_b_laz",
        "Dance Silly 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly5"] = {
        "timetable@tracy@ig_5@idle_a",
        "idle_a",
        "Dance Silly 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly6"] = {
        "timetable@tracy@ig_8@idle_b",
        "idle_d",
        "Dance Silly 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance9"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "med_center_up",
        "Dance 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly8"] = {
        "anim@mp_player_intcelebrationfemale@the_woogie",
        "the_woogie",
        "Dance Silly 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceglowstick"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_13_mi_hi_sexualgriding_laz",
        "Dance Glowsticks",
        AnimationOptions = {
            Prop = "ba_prop_battle_glowstick_01",
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = "ba_prop_battle_glowstick_01",
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceglowstick2"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_12_mi_hi_bootyshake_laz",
        "Dance Glowsticks 2",
        AnimationOptions = {
            Prop = "ba_prop_battle_glowstick_01",
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = "ba_prop_battle_glowstick_01",
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ["danceglowstick3"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Glowsticks 3",
        AnimationOptions = {
            Prop = "ba_prop_battle_glowstick_01",
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = "ba_prop_battle_glowstick_01",
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ["dancehorse"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_15_handup_laz",
        "Dance Horse",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dancehorse2"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "crowddance_hi_11_handup_laz",
        "Dance Horse 2",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["dancehorse3"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_11_hu_shimmy_laz",
        "Dance Horse 3",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
--    ["breakdance"] = {
--        "export@breakdance", 
--        "Breakdance", 
--        AnimationOptions = {
--            EmoteLoop = true,
--        }
--    },
    ["djdance1"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_a_dixon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance2"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_c_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance3"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_d_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance4"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_e_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance5"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance6"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_dance_open_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance7"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_end_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance8"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_a_loop_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance9"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance10"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_b_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance11"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_c_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance12"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_d_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance13"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_loop_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance14"] = {
        "anim@amb@nightclub@djs@black_madonna@", "dance_b_trans_pose_c_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance15"] = {
        "anim@amb@nightclub@djs@black_madonna@", "drink_down_long_trans_pose_b_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance16"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_a_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance17"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_b_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance18"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_c_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance19"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_d_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance20"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_e_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance21"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_f_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance22"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_g_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance23"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_a_idle_h_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance24"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_b_long_trans_dance_a_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance25"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_a_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance26"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_b_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance27"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_c_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance28"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_d_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance29"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_e_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djdance30"] = {
        "anim@amb@nightclub@djs@black_madonna@", "pose_c_idle_f_blamadon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle1"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle2"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle3"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_e_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle4"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_f_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle5"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_gb_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle6"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_h_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle7"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_i_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle8"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_j_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle9"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_k_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle10"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_kb_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle11"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_kc_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle12"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_l_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle13"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_lng_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle14"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_m_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle15"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_n_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle16"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_o_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle17"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_shrt_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle18"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_shrt_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle19"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_lft_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle20"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_lft_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle21"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_lft_c_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle22"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_open_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle23"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_open_ab_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle24"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_open_shrt_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle25"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_idle_trns_hp_hd_nk_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle27"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_start_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle28"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle29"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle30"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_c_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle31"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_d_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle32"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_e_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle33"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_f_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle34"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_g_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle32"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_e_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle35"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_h_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle36"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_i_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle37"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_j_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle38"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_k_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle39"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_sync_lft_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle40"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_lft_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle41"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_lft_c_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle42"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_lft_d_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle43"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_lft_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle44"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_lft_e_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle45"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_open_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle46"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_open_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle47"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_cntr_to_right_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle48"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lft_to_cntr_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle49"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lft_to_cntr_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle50"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lft_to_lh_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle51"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lft_to_open_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle52"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lh_to_cntr_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle53"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_lh_to_cntr_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle54"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_open_to_cntr_a_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle55"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_open_to_cntr_b_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle56"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_open_to_cntr_c_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle57"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_open_to_cntr_d_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle58"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_open_to_lft_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle59"] = {
        "anim@amb@nightclub@djs@dixon@", "dixn_trns_right_to_cntr_dix",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["djidle60"] = {
        "anim@amb@nightclub@djs@dixon@", "temp_dxn_set_dixon",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["vehtrhow"] = {
        "oddjobs@taxi@tie", "vomit_outside",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["vehtrhow"] = {
        "oddjobs@taxi@tie", "vomit_outside",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehtaxi1"] = {
        "oddjobs@taxi@driver", "leanover_idle",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehtaxi2"] = {
        "oddjobs@taxi@cyi", "std_hand_off_ps_passenger",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehblowm"] = {
        "oddjobs@towing", "m_blow_job_loop",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehblowf"] = {
        "oddjobs@towing", "f_blow_job_loop",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehsexm"] = {
        "mini@prostitutes@sexlow_veh", "low_car_sex_loop_player",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehsexf"] = {
        "mini@prostitutes@sexlow_veh", "low_car_sex_loop_female",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },
    ["vehsexm"] = {
        "mini@prostitutes@sexlow_veh", "low_car_sex_loop_player",
        AnimationOptions = {
            EmoteLoop = true,
            Vehicle = true
        }
    },

    -- Casino DLC
    ["think4"] = {
        "anim@amb@casino@hangout@ped_male@stand@02b@idles",
        "idle_a",
        "Think 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["dancesilly7"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Silly 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["karate"] = {
        "anim@mp_player_intcelebrationfemale@karate_chops", 
        "karate_chops", 
        "Karate"
    },
    ["karate2"] = {
        "anim@mp_player_intcelebrationmale@karate_chops", 
        "karate_chops", 
        "Karate 2"
    },
    ["cutthroat"] = {
        "anim@mp_player_intcelebrationmale@cut_throat", 
        "cut_throat", 
        "Cut Throat"
    },
    ["cutthroat2"] = {
        "anim@mp_player_intcelebrationfemale@cut_throat", 
        "cut_throat", 
        "Cut Throat 2"
    },
    ["mindblown"] = {
        "anim@mp_player_intcelebrationmale@mind_blown", 
        "mind_blown", 
        "Mind Blown", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["mindblown2"] = {
        "anim@mp_player_intcelebrationfemale@mind_blown", 
        "mind_blown", 
        "Mind Blown 2", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing"] = {
        "anim@mp_player_intcelebrationmale@shadow_boxing", 
        "shadow_boxing", 
        "Boxing", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing2"] = {
        "anim@mp_player_intcelebrationfemale@shadow_boxing", 
        "shadow_boxing", 
        "Boxing 2", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["stink"] = {
        "anim@mp_player_intcelebrationfemale@stinker", 
        "stink", 
        "Stink", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["dance18"] = {
        "anim@mp_player_intcelebrationfemale@the_woogie", 
        "the_woogie", 
        "Dance 18", 
        AnimationOptions = {
            EmoteLoop = true,
        },
    },
    ["dance19"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
        "med_center", 
        "Dance 19", 
        AnimationOptions = {
            EmoteLoop = true,
        },
    },
    ["hug4"] = {
        "misscarsteal2chad_goodbye", 
        "chad_armsaround_chad", 
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.05,
        }
    },
    ["newscam"] = {
        "missfinale_c2mcs_1", 
        "fin_c2_mcs_1_camman",  
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0300, 0.0100,0.0,0.0,0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newsmic"] = {
        "anim@heists@humane_labs@finale@keycards", 
        "ped_a_enter_loop", 
        AnimationOptions = {
            Prop = "p_ing_microphonel_01",
            PropBone = 4154,
            PropPlacement = {-0.00, -0.0200, 0.1100, 0.00, 0.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newsbmic"] = {
        "missfra1", 
        "mcs2_crew_idle_m_boom", 
        AnimationOptions = {
            Prop = "prop_v_bmike_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@", 
        "shake_can_male", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag2"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@", 
        "shake_can_female", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag3"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@", 
        "spray_can_var_01_male", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag4"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@", 
        "spray_can_var_02_male", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag5"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@", 
        "spray_can_var_01_female", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag6"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@", 
        "spray_can_var_02_female", 
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["toolbox"] = {
        "move_weapon@jerrycan@generic", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_tool_box_04",
            PropBone = 28422,
            PropPlacement = {0.3960,0.0410,-0.0030, -90.00, 0.0, 90.00},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["toolbox2"] = {
        "move_weapon@jerrycan@generic", 
        "idle", 
        AnimationOptions = {
            Prop = "imp_prop_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {0.3700,0.0200, 0.0, 90.00, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["conehead"] = {
        "move_m@drunk@verydrunk_idles@", 
        "fidget_07",  
        AnimationOptions = {
            Prop = "prop_roadcone02b",
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0200, -0.000, 30.0000004, 90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray2"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray3"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray4"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray5"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_tray_03",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray6"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_bs_tray_03',
            SecondPropBone =18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray7"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_cb_tray_02',
            SecondPropBone =18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray8"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_tray_03',
            SecondPropBone =18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodtray9"] = {
        "anim@heists@box_carry@", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_tray_02',
            SecondPropBone =18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag"] = {
        "move_weapon@jerrycan@generic", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_bs_bag_01",
            PropBone = 57005,
            PropPlacement = {0.3300, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag2"] = {
        "move_weapon@jerrycan@generic", 
        "idle",  
        AnimationOptions = {
            Prop = "prop_food_cb_bag_01",
            PropBone = 57005,
            PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag3"] = {
        "move_weapon@jerrycan@generic", 
        "idle", 
        AnimationOptions = {
            Prop = "prop_food_bag1",
            PropBone = 57005,
            PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["protest"] = {
        "rcmnigel1d", 
        "base_club_shoulder",  
        AnimationOptions = {
            Prop = "prop_cs_protest_sign_01",
            PropBone = 57005,
            PropPlacement = {0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["binoculars2"] = {
        "amb@world_human_binoculars@male@idle_b", 
        "idle_f", 
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
   ["binoculars3"] = {
        "amb@world_human_binoculars@male@idle_a", 
        "idle_c",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weights"] = {
        "amb@world_human_muscle_free_weights@male@barbell@base", 
        "base", 
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weights2"] = {
        "amb@world_human_muscle_free_weights@male@barbell@idle_a", 
        "idle_d", 
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["fuel"] = {
        "weapons@misc@jerrycan@", 
        "fire",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 57005,
            PropPlacement = {0.1800, 0.1300, -0.2400, -165.8693883, -11.2122753, -32.9453021},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["fuelcarry"] = {
        "weapons@misc@jerrycan@franklin", 
        "idle", 
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 28422,
            PropPlacement = {0.26, 0.050, 0.0300, 80.00, 180.000, 79.99},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["hitchhike"] = {
        "random@hitch_lift", 
        "idle_f",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 18905,
            PropPlacement = {0.32, -0.0100, 0.0, -162.423, 74.83, 58.79},
            SecondProp = 'prop_michael_backpack',
            SecondPropBone = 40269,
            SecondPropPlacement = {-0.07, -0.21, -0.11, -144.93, 117.358, -6.16},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign2"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_02a",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign3"] = {
        "rcmnigel1d", 
        "base_club_shoulder",
        AnimationOptions = {
            Prop = "prop_sign_road_03d",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign4"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_04a",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign5"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_04w",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign6"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_05a",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign7"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_sign_road_05t",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign8"] = {
        "rcmnigel1d", 
        "base_club_shoulder",  
        AnimationOptions = {
            Prop = "prop_sign_freewayentrance",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign9"] = {
        "rcmnigel1d", 
        "base_club_shoulder", 
        AnimationOptions = {
            Prop = "prop_snow_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shopping"] = {
        "missheistdocksprep1hold_cellphone", 
        "static", 
        "Shopping ~g~v2.0", 
        AnimationOptions = {
            Prop = "prop_shopping_bags01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 232.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shopping2"] = {
        "missheistdocksprep1hold_cellphone", 
        "static", 
        "Shopping ~g~v2.0", 
        AnimationOptions = {
            Prop = "prop_shopping_bags02",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 232.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["microphone"] = {
        "anim@heists@humane_labs@finale@keycards", 
        "ped_a_enter_loop", 
        "Microphone ~g~v2.0", 
        AnimationOptions = {
            Prop = "prop_microphone_02",
            PropBone = 18905,
            PropPlacement = {0.10, -0.01, 0.03, -100.0, 0.0, -10.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["taunt"] = {
        "switch@franklin@gang_taunt_p1", 
        "gang_taunt_loop_thug_01", 
        "Taunt", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["taunt2"] = {
        "switch@franklin@gang_taunt_p1", 
        "gang_taunt_loop_thug_02", 
        "Taunt 2", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["taunt3"] = {
        "switch@franklin@gang_taunt_p1", 
        "gang_taunt_loop_lamar", 
        "Taunt 3", 
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["taunt4"] = {
        "switch@franklin@gang_taunt_p3", 
        "gang_taunt_with_lamar_loop_g2", 
        "Taunt 4", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["taunt5"] = {
        "switch@franklin@gang_taunt_p3", 
        "gang_taunt_with_lamar_loop_g1", 
        "Taunt 5", 
        AnimationOptions = {
            EmoteMoving = true,
        }
    },
    ["taunt6"] = {
        "switch@franklin@gang_taunt_p5", 
        "fras_ig_6_p5_loop_g1", 
        "Taunt 6", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["taunt7"] = {
        "anim@mp_player_intcelebrationmale@cry_baby", 
        "cry_baby", 
        "Taunt 7", 
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["die"] = {
        "misslamar1dead_body", 
        "dead_idle", 
        "Die", 
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["holdback"] = {
        "switch@franklin@gang_taunt_p1", 
        "gang_taunt_loop_franklin", 
        "Hold back", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 5000
    }},
    ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2 ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
       ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
      ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
       ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
      ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactno"] = {"missheist_jewel", "despair", "Reaction No ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Bang Bang ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
       ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2 ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Over Here ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Washing Face ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
     ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Last Day ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteLoop = true,
    }},
     ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
        allowedWeapon = true,
    }},
    ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 6000,
    }},
    ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2 ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 2 ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = true,
     allowedWeapon = true,
     EmoteLoop = true,
    }},
    
    ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jcheckout"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Check Out · Female ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Check Out 2 · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,  
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Heart Massage ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Pass Out ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Watch Strip · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "No Way ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3 ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = true,
     EmoteDuration = 2500,
    }},
    ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    
    ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Prop = 'prop_tool_shovel006',
        PropBone = 28422,
        PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
    }},
    ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Bend Over Wait ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan ~y~XD ~c~1.0", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang Drink ~y~XD ~c~1.0", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_03',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2 ~y~XD ~c~1.0", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_03',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Mobile Leaning · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    }},
    ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    }},
    ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "F*ck From Behind ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair7"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Sit Chair 7 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair8"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sit Chair 8 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair9"] = {"timetable@trevor@smoking_meth@base", "base", "Sit Chair 9 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair10"] = {"timetable@tracy@ig_7@base", "base", "Sit Chair 10 ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Standing Twitchy ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Standing Fit ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Standing · Male ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Standing · Female ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["ddance1"] = {"divined@dances@new", "ddance1", "Dance 1", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance2"] = {"divined@dances@new", "ddance2", "Dance 2", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance3"] = {"divined@dances@new", "ddance3", "Dance 3", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance4"] = {"divined@dances@new", "ddance4", "Dance 4", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance5"] = {"divined@dances@new", "ddance5", "Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance6"] = {"divined@dances@new", "ddance6", "Dance 6", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance7"] = {"divined@dances@new", "ddance7", "Dance 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance8"] = {"divined@dances@new", "ddance8", "Dance 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance9"] = {"divined@dances@new", "ddance9", "Dance 9", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance10"] = {"divined@dances@new", "ddance10", "Dance 10", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance11"] = {"divined@dances@new", "ddance11", "Dance 11", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance12"] = {"divined@dances@new", "ddance12", "Dance 12", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ddance13"] = {"divined@dances@new", "ddance13", "Dance 13", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance1"] = {"divined@dancesv2@new", "divdance1", "Dance 1", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance2"] = {"divined@dancesv2@new", "divdance2", "Dance 2", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance3"] = {"divined@dancesv2@new", "divdance3", "Dance 3", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance4"] = {"divined@dancesv2@new", "divdance4", "Dance 4", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance5"] = {"divined@dancesv2@new", "divdance5", "Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance6"] = {"divined@dancesv2@new", "divdance6", "Dance 6", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance7"] = {"divined@dancesv2@new", "divdance7", "Dance 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance8"] = {"divined@dancesv2@new", "divdance8", "Dance 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance9"] = {"divined@dancesv2@new", "divdance9", "Dance 9", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance10"] = {"divined@dancesv2@new", "divdance10", "Dance 10", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance11"] = {"divined@dancesv2@new", "divdance11", "Dance 11", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance12"] = {"divined@dancesv2@new", "divdance12", "Dance 12", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance13"] = {"divined@dancesv2@new", "divdance13", "Dance 13", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divdance14"] = {"divined@dancesv2@new", "divdance14", "Dance 14", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance1"] = {"divined@breakdances@new", "divbdance1", "Break Dance 1", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance2"] = {"divined@breakdances@new", "divbdance2", "Break Dance 2", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance3"] = {"divined@breakdances@new", "divbdance3", "Break Dance 3", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance4"] = {"divined@breakdances@new", "divbdance4", "Break Dance 4", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance5"] = {"divined@breakdances@new", "divbdance5", "Break Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance6"] = {"divined@breakdances@new", "divbdance6", "Break Dance 6", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance7"] = {"divined@breakdances@new", "divbdance7", "Break Dance 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance8"] = {"divined@breakdances@new", "divbdance8", "Break Dance 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance9"] = {"divined@breakdances@new", "divbdance9", "Break Dance 9", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance10"] = {"divined@breakdances@new", "divbdance10", "Break Dance 10", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance11"] = {"divined@breakdances@new", "divbdance11", "Break Dance 11", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance12"] = {"divined@breakdances@new", "divbdance12", "Break Dance 12", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance13"] = {"divined@breakdances@new", "divbdance13", "Break Dance 13", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance14"] = {"divined@breakdances@new", "divbdance14", "Break Dance 14", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["divbdance15"] = {"divined@breakdances@new", "divbdance14", "Break Dance 15", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["corkscrew"] = {"mikey@acrobatics@new", "corkscrew", "Corkscrew", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["corkscrew2"] = {"mikey@acrobatics@new", "corkscrew2", "Corkscrew 2", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["prop_flip"] = {"mikey@acrobatics@new", "prop_flip", "Prop Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["runfrontflip"] = {"mikey@acrobatics@new", "runfrontflip", "Run Front Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["runwallbackflip"] = {"mikey@acrobatics@new", "runwallbackflip", "Run Wall Back Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["spin_kickflip"] = {"mikey@acrobatics@new", "spin_kick_flip", "Spin Kick Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["standingbackflip"] = {"mikey@acrobatics@new", "standingbackflip", "Standing Back Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["steeze_backflip"] = {"mikey@acrobatics@new", "steeze_backflip", "Steeze Back Flip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["twistflip"] = {"mikey@acrobatics@new", "twistflip", "Twistflip", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_doublepoint"] = {"mikey@gestures@new", "gesture_doublepoint", "Come At Me", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_dramaticpoint"] = {"mikey@gestures@new", "gesture_dramaticpoint", "Dramatic Point", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_flex"] = {"mikey@gestures@new", "gesture_flex", "Flex Arms", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_icant"] = {"mikey@gestures@new", "gesture_icant", "Fall Back", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_loser"] = {"mikey@gestures@new", "gesture_loser", "Loser", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_salute"] = {"mikey@gestures@new", "gesture_salute", "Salute", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_taunt"] = {"mikey@gestures@new", "gesture_taunt", "Slit Throat", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_victory"] = {"mikey@gestures@new", "gesture_victory", "Victory Cheer", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_wave"] = {"mikey@gestures@new", "gesture_wave", "Wave", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["gesture_whatever"] = {"mikey@gestures@new", "gesture_whatever", "Shrug", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["crossbounce"] = {"custom@crossbounce", "crossbounce", "Cross bounce", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["dontstart"] = {"custom@dont_start", "dont_start", "Dont Start", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Orange Justice", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["renegade"] = {"custom@renegade", "renegade", "Renegade", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["rickroll"] = {"custom@rickroll", "rickroll", "Rick Roll", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["savage"] = {"custom@savage", "savage", "Savage", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["sayso"] = {"custom@sayso", "sayso", "Say So", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["takel"] = {"custom@take_l", "take_l", "Take the L", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},

   ["slide"] = {"custom@toosie_slide", "toosie_slide", "Tootsie Slide", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["dbdance1"] = {"divined@fndances@new", "dbdance1", "Mdance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance2"] = {"divined@fndances@new", "dbdance2", "A1 Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance3"] = {"divined@fndances@new", "dbdance3", "Boogie Down", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance4"] = {"divined@fndances@new", "dbdance4", "Break Boy", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance5"] = {"divined@fndances@new", "dbdance5", "Breakfast Coffee Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance6"] = {"divined@fndances@new", "dbdance6", "Candy Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance7"] = {"divined@fndances@new", "dbdance7", "Cheerleader Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance8"] = {"divined@fndances@new", "dbdance8", "Crab Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dbdance9"] = {"divined@fndances@new", "dbdance9", "Eastern Blocc", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance10"] = {"divined@fndances@new", "dbdance10", "Electro Swing", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance11"] = {"divined@fndances@new", "dbdance11", "Electro Shuffle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance12"] = {"divined@fndances@new", "dbdance12", "Floss", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance13"] = {"divined@fndances@new", "dbdance13", "Grooving Jam", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance14"] = {"divined@fndances@new", "dbdance14", "Hillbilly Shuffle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance15"] = {"divined@fndances@new", "dbdance15", "Laser Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance16"] = {"divined@fndances@new", "dbdance16", "Ribbon Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance17"] = {"divined@fndances@new", "dbdance17", "Running Man", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance18"] = {"divined@fndances@new", "dbdance18", "Step Breakdance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance19"] = {"divined@fndances@new", "dbdance19", "Cowboy Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
      ["dbdance20"] = {"divined@fndances@new", "dbdance20", "Egyptian Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
         ["dbdance21"] = {"divined@fndances@new", "dbdance21", "Swipe It", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clock"] = {"custom@around_the_clock", "around_the_clock", "Around the clock", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["dancemoves"] = {"custom@dancemoves", "dancemoves", "Dance moves", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["discodance"] = {"custom@disco_dance", "disco_dance", "Disco Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Electro Shuffle", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Electro Shuffle 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["fresh"] = {"custom@fresh_fortnite", "fresh_fortnite", "Fresh", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["gylphic"] = {"custom@gylphic", "gylphic", "Glyphic", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["hitit"] = {"custom@hitit", "hitit", "Hit It", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["inparty"] = {"custom@in_da_party", "in_da_party", "In Da Party", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["robotdance"] = {"custom@robotdance_fortnite", "robotdance_fortnite", "Robot Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["frightfunk"] = {"custom@frightfunk", "frightfunk", "Fright Funk", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["gloss"] = {"custom@gloss", "gloss", "Gloss", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["lastforever"] = {"custom@last_forever", "last_forever", "Last Forever", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["smoothmoves"] = {"custom@smooth_moves", "smooth_moves", "Smooth moves", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   
   ["introducing"] = {"custom@introducing", "introducing", "Introducing...", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["banddance"] = {"divined@tdances@new", "dtdance1", "Band Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bopdance"] = {"divined@tdances@new", "dtdance2", "Bop", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bboydance"] = {"divined@tdances@new", "dtdance3", "BBoy Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["capoeiramove"] = {"divined@tdances@new", "dtdance4", "Capoeira Move", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hiphopdance"] = {"divined@tdances@new", "dtdance5", "Hip Hop Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hipsterdance"] = {"divined@tdances@new", "dtdance6", "Hipster Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hippiedance"] = {"divined@tdances@new", "dtdance7", "Hippie Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hiphoptaunt"] = {"divined@tdances@new", "dtdance8", "Hip Hop Taunt", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hilowave"] = {"divined@tdances@new", "dtdance9", "Hi Lo Wave", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["squaredance"] = {"divined@tdances@new", "dtdance10", "Square Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hotdance"] = {"divined@tdances@new", "dtdance11", "Hot Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["hulahula"] = {"divined@tdances@new", "dtdance12", "Hula-Hula", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dabloop"] = {"divined@tdances@new", "dtdance13", "Dab Loop", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kingdance"] = {"divined@tdances@new", "dtdance14", "The King's Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["linedance"] = {"divined@tdances@new", "dtdance15", "Dance Line", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["magicman"] = {"divined@tdances@new", "dtdance16", "Magic Man", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["marat"] = {"divined@tdances@new", "dtdance17", "Marat", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["maskoff"] = {"divined@tdances@new", "dtdance18", "Mask Off", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mellow"] = {"divined@tdances@new", "dtdance19", "Mellow", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["showroomdance"] = {"divined@tdances@new", "dtdance20", "Showroom Dance", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["windmillfloss"] = {"divined@tdances@new", "dtdance21", "Windmill Floss", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["woahdance"] = {"divined@tdances@new", "dtdance22", "Woah", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["woowalk"] = {"div@woowalk@test", "woowalk", "Woo Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["drilldance"] = {"div@woowalk@test", "drilldance", "Drill Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["cripwalk2"] = {"div@woowalk@test", "cripwalk2", "Crip Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sturdy2"] = {"div@woowalk@test", "sturdy2", "Get Sturdy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["bloodwalk2"] = {"div@woowalk@test", "bloodwalk2", "Blood Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["blixkytwirl2"] = {"div@woowalk@test", "blixkytwirl2", "Blixky Twirl", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["catdaddy"] = {"div@woowalk@test", "catdaddy", "Cat Daddy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["popdance"] = {"div@woowalk@test", "popdance", "Pop Smoke Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["toprock"] = {"div@woowalk@test", "toprock", "Toprock", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["seex1"] = {"director@character_select_intro@female", "ambclub_13_mi_hi_sexualgriding_glowstick_l", "seex1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["seex2"] = {"misscarsteal2pimpsex", "pimpsex_pimp", "seex2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["seex3"] = {"misscarsteal2pimpsex", "pimpsex_hooker", "seex3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["seex4"] = {"misscarsteal2pimpsex", "pimpsex_punter", "seex4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["seex5"] = {"rcmpaparazzo_2", "shag_loop_poppy", "seex5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},  
   ["seex6"] = {"rcmpaparazzo_2", "shag_loop_a", "seex6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["heart"] = {"divined@rpack@new", "alchemy", "Heart", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["badmood"] = {"divined@rpack@new", "badmood", "Bad Mood", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["bunnyhop"] = {"divined@rpack@new", "bunnyhop", "Bunnyhop", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["burpee"] = {"divined@rpack@new", "burpee", "Burpee", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["callme"] = {"divined@rpack@new", "callme", "Call Me", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["coronet"] = {"divined@rpack@new", "coronet", "Coronet", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dcry"] = {"divined@rpack@new", "dcry", "Cry", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["hailcab"] = {"divined@rpack@new", "hailcab", "Hailcab", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["kepler"] = {"divined@rpack@new", "kepler", "King Of The Jungle", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["mindblown"] = {"divined@rpack@new", "mindblown", "Mindblown", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["uproar"] = {"divined@rpack@new", "uproar", "Uproar", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["yeet"] = {"divined@rpack@new", "yeet", "Yeet", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["mgangsigns_1"] = {"mikey@gangsigns2@new", "mgangsigns_1", "Gangsign 1", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_2"] = {"mikey@gangsigns2@new", "mgangsigns_2", "Gangsign 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_3"] = {"mikey@gangsigns2@new", "mgangsigns_3", "Gangsign 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_4"] = {"mikey@gangsigns2@new", "mgangsigns_4", "Gangsign 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_5"] = {"mikey@gangsigns2@new", "mgangsigns_5", "Gangsign 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_6"] = {"mikey@gangsigns2@new", "mgangsigns_6", "Gangsign 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_7"] = {"mikey@gangsigns2@new", "mgangsigns_7", "Gangsign 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_8"] = {"mikey@gangsigns2@new", "mgangsigns_8", "Gangsign 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mgangsigns_9"] = {"mikey@gangsigns2@new", "mgangsigns_9", "Gangsign 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["ashton"] = {"div@gdances@test", "ashton", "Ashton", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["charleston"] = {"div@gdances@test", "charleston", "Charleston", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["doggystrut"] = {"div@gdances@test", "doggystrut", "Strut", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dreamfeet"] = {"div@gdances@test", "dreamfeet", "Dream Feet", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["eerie"] = {"div@gdances@test", "eerie", "Eerie", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["fancyfeet"] = {"div@gdances@test", "fancyfeet", "Fancy Feet", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["festivus"] = {"div@gdances@test", "festivus", "Rave Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["flamingo"] = {"div@gdances@test", "flamingo", "Flamingo", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["fresh"] = {"div@gdances@test", "fresh", "Fresh", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["getgriddy"] = {"div@gdances@test", "getgriddy", "Get Griddy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["handstand"] = {"div@gdances@test", "handstand", "Handstand", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["imsmooth"] = {"div@gdances@test", "imsmooth", "Smooth", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["keepdance"] = {"div@gdances@test", "keepdance", "Goof Off", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["montecarlo"] = {"div@gdances@test", "montecarlo", "Monte Carlo", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["octopus"] = {"div@gdances@test", "octopus", "Octopus", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["pointydance"] = {"div@gdances@test", "pointydance", "Pointy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["ridingdance"] = {"div@gdances@test", "ridingdance", "Riding Cowboy", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["skeldance"] = {"div@gdances@test", "skeldance", "Skeleton Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["spinny"] = {"div@gdances@test", "spinny", "Spinny", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["zombiewalk"] = {"div@gdances@test", "zombiewalk", "Zombie Walk", AnimationOptions =
   {
       EmoteLoop = true
   }}, 
   ["kneesass"] = {"div@sex@test", "kneesass", "Pos #1 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["kneesassm"] = {"div@sex@test", "kneesassm", "Pos #1 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sidegrab"] = {"div@sex@test", "sidegrab", "Pos #2 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sidegrabf"] = {"div@sex@test", "sidegrabf", "Pos #2 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sidemissionary"] = {"div@sex@test", "sidemissionary", "Pos #3 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sidemissionarym"] = {"div@sex@test", "sidemissionarym", "Pos #3 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["sidewaysm"] = {"div@sex@test", "sidewaysm", "Pos #4 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["sidewaysf"] = {"div@sex@test", "sidewaysf", "Pos #4 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["topside"] = {"div@sex@test", "topside", "Pos #5 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["topsidef"] = {"div@sex@test", "topsidef", "Pos #5 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["topside2"] = {"div@sex@test", "topside2", "Pos #6 (M)", AnimationOptions =
   {
       EmoteLoop = true
   }},
      ["topside2f"] = {"div@sex@test", "topside2f", "Pos #6 (F)", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["woowalkinx"] = {"divined@rpack@new", "woowalkinx", "Woo Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["bloodwalk"] = {"divined@rpack@new", "bloodwalk", "Blood Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["cripwalk3"] = {"divined@rpack@new", "cripwalk3", "Crip Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["shootit"] = {"divined@rpack@new", "shootit", "Shoot Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["millyrocks"] = {"divined@rpack@new", "millyrocks", "Milly Rock", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["shmoney"] = {"divined@rpack@new", "shmoney", "Shmoney Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dougie"] = {"divined@rpack@new", "dougie", "Dougie", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["haiphuthon"] = {"divined@rpack@new", "haiphuthon", "Haiphuthon", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["curvette"] = {"divined@rpack@new", "curvette", "Curvette", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["tokyochall"] = {"divined@rpack@new", "tokyochall", "Tokyo Challenge", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["thotiana"] = {"divined@rpack@new", "thotiana", "Thotiana", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["moodswings"] = {"divined@rpack@new", "moodswings", "Moodswings Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["whatyouknowboutlove"] = {"divined@rpack@new", "whatyouknowboutlove", "Pop Love", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["pose1"] = {"jagoda@pose1", "jagoda_pose1", "Pose 1", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose2"] = {"jagoda@pose2", "jagoda_pose2", "Pose 2", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose3"] = {"jagoda@pose3", "jagoda_pose3", "Pose 3", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose4"] = {"jagoda@pose4", "jagoda_pose4", "Pose 4", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose5"] = {"jagoda@pose5", "jagoda_pose5", "Pose 5", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose6"] = {"jagoda@pose6", "jagoda_pose6", "Pose 6", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose7"] = {"jagoda@pose7", "jagoda_pose7", "Pose 7", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose8"] = {"jagoda@pose8", "jagoda_pose8", "Pose 8", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose9"] = {"jagoda@pose9", "jagoda_pose9", "Pose 9", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose10"] = {"jagoda@pose10", "jagoda_pose10", "Pose 10", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose11"] = {"jagoda@pose11", "jagoda_pose11", "Pose 11", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose12"] = {"jagoda@pose12", "jagoda_pose12", "Pose 12", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose13"] = {"jagoda@pose13", "jagoda_pose13", "Pose 13", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose14"] = {"jagoda@pose14", "jagoda_pose14", "Pose 14", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose15"] = {"jagoda@pose15", "jagoda_pose15", "Pose 15", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose16"] = {"jagoda@pose16", "jagoda_pose16", "Pose 16", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose17"] = {"jagoda@pose17", "jagoda_pose17", "Pose 17", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose18"] = {"jagoda@pose18", "jagoda_pose18", "Pose 18", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose19"] = {"jagoda@pose19", "jagoda_pose19", "Pose 19", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pose20"] = {"jagoda@pose20", "jagoda_pose20", "Pose 20", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose1"] = {"jagoda@male_pose1", "jagoda_male_pose1", "Male Pose 1", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose2"] = {"jagoda@male_pose2", "jagoda_male_pose2", "Male Pose 2", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose3"] = {"jagoda@male_pose3", "jagoda_male_pose3", "Male Pose 3", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose4"] = {"jagoda@male_pose4", "jagoda_male_pose4", "Male Pose 4", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose5"] = {"jagoda@male_pose5", "jagoda_male_pose5", "Male Pose 5", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose6"] = {"jagoda@male_pose6", "jagoda_male_pose6", "Male Pose 6", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose7"] = {"jagoda@male_pose7", "jagoda_male_pose7", "Male Pose 7", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["malepose8"] = {"jagoda@male_pose8", "jagoda_male_pose8", "Male Pose 8", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["haenderpaaryg"] = {"tigerle@custom@jobs@handsonback", "tigerle_custom_handsonback", "Hold hænder på ryggen", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sidafslappende"] = {"tigerle@custom@pose@sitting@chair1", "tigerle_pose_sitting_chair1", "Sid Afslappende", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["holdvest1"] = {"tigerle@custom@jobs@vest", "tigerle_custom_holdvest", "Hold Vest 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["holdvest2"] = {"tigerle@custom@jobs@vest2", "tigerle_custom_holdvest2", "Hold Vest 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["gaapaaknae"] = {"tigerle@custom@pose@proposal", "tigerle_pose_proposal", "Gå ned på knæ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sitlow"] = {"anim@veh@lowrider@std@ds@arm@base", "sit_low_lowdoor", "Sit Lowrider", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        Vehicle = true,
    }},
    ["riflerelax"] = {"anim@fog_rifle_relaxed", "rifle_relaxed_clip", "Relaxed With Rifle", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        allowedWeapon = true,
    }},
    ["stack1"] = {"anim@stack_pointman", "pointman_clip", "Stack Formation Pointman", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        allowedWeapon = true,
    }},
    ["stack2"] = {"anim@stack_two_man", "two_man_clip", "Stack Formation 2nd Man", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        allowedWeapon = true,
    }},
    ["stack3"] = {"anim@stack_three_man", "three_man_clip", "Stack Formation Door", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        allowedWeapon = true,
    }},
    ["highlow1"] = {"anim@highlow_low_lean", "low_lean_clip", "High-Low Low Stance", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        allowedWeapon = true,
    }},
    ["highlow2"] = {"anim@highlow_high_lean", "high_lean_clip", "High-Low High Stance", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        allowedWeapon = true,
    }},
    ["trifle1"] = {"anim@tactical_rifle_01", "t_rifle_01_clip", "Rifle Pose 1 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["trifle2"] = {"anim@tactical_rifle_02", "t_rifle_02_clip", "Rifle Pose 2 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["trifle3"] = {"anim@tactical_rifle_03", "t_rifle_03_clip", "Rifle Pose 3 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["tphoto1"] = {"anim@tactical_photo_01", "t_photo_01_clip", "Tactical Photo Pose 1 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["thg1"] = {"anim@tactical_handgun_01", "t_handgun_01_clip", "Handgun Pose 1 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["thg2"] = {"anim@tactical_handgun_02", "t_handgun_02_clip", "Handgun Pose 2 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["highlow3"] = {"anim@tactical_highlow_high_leftlean", "high_leftlean_clip", "Highlow Left Lean High (Smos)", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    
    ["highlow4"] = {"anim@tactical_highlow_low_leftlean", "low_leftlean_clip", "Highlow Left Lean Low (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["kneeltalkie"] = {"anim@tactical_kneel_walkie", "kneel_walkie_clip", "Communication Relaxed Rifle (Smos)", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    
    ["aimkneel"] = {"anim@tactical_kneel_aiming", "kneel_aiming_clip", "Kneeling and Aiming Rifle (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["riflerelax1"] = {"anim@male_tactical_collapsed_lowready", "collapsed_lowready_clip", "Collapsed Lowready Relaxed Rifle (Smos)", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
    }},
    
    ["riflerelax2"] = {"anim@male_tactical_highready_relaxed", "highready_relaxed_clip", "Highready Relaxed Rifle (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
}

Config.EnableVehicle = {
    ['vehtrhow'] = true,
    ['vehtaxi1'] = true,
    ['vehtaxi2'] = true,
    ['vehblowm'] = true,
    ['vehblowf'] = true,
    ['vehsexm'] = true,
    ['vehsexm'] = true,
    ['vehsexf'] = true,
    ['vehsexf'] = true,
    ['sitlow'] = true,
}
