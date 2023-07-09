
----------------------------------------------------------------------------------------------------------------
----  ITEM SLOTS             ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_item_multiplayer_item_class   = 1
slot_item_multiplayer_item_class2  = 2
slot_item_royale_item_class        = 3 --unique for royale are the item classes (sadly)
slot_item_multiplayer_gf           = 4 --patch1115 60/13
slot_item_multiplayer_availability_linked_list_begin = 5 --temporary, can be moved to higher values


----------------------------------------------------------------------------------------------------------------
----  AGENT SLOTS            ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_agent_last_voice_at          = 1
slot_agent_last_sound_at          = 2
slot_agent_underwater_time        = 3
slot_agent_underwater_now         = 4
slot_agent_frizzle_times          = 5
slot_agent_current_command        = 6
slot_agent_current_control_prop   = 7
slot_agent_used_prop_instance     = 8
slot_agent_alone                  = 9
slot_agent_cur_damage_modifier    = 10
slot_agent_cur_accuracy_modifier  = 11
slot_agent_cur_reload_speed_modifier = 12
slot_agent_cur_use_speed_modifier = 13
slot_agent_cur_speed_modifier     = 14
slot_agent_music_play_together    = 15
slot_agent_base_speed_mod         = 16
slot_agent_started_playing_music_at = 17
-- slot_agent_teleport_pos_x         = 17
-- slot_agent_teleport_pos_y         = 18
-- slot_agent_teleport_pos_z         = 19
-- slot_agent_teleport_pos_z_rot     = 20
slot_agent_flag_target            = 18
slot_agent_behaviour              = 19
slot_agent_in_duel_with           = 20
slot_agent_duel_start_time        = 21
slot_agent_map_overlay_id         = 22
slot_agent_is_running_away        = 23
slot_agent_courage_score          = 24
slot_agent_state                  = 25

slot_agent_last_build_at          = 27  --patch1115 fix 6/2
slot_agent_healed_perc            = 28 -- patch1115 surgeon
slot_agent_royale_horse           = 29

slot_agent_attached_prop_offset_x = 30
slot_agent_attached_prop_offset_y = 31
slot_agent_attached_prop_offset_z = 32

slot_agent_track_ends_at          = 33

slot_agent_has_fallen_off_horse   = 34
slot_agent_god_mode               = 35 --patch1115 54/14

slot_agent_last_rotz              = 36
slot_agent_last_speed_same_count  = 37

slot_agent_taser_ttl = 38

----------------------------------------------------------------------------------------------------------------
----  FACTION SLOTS          ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_faction_banner                     = 1


----------------------------------------------------------------------------------------------------------------
----  TROOP SLOTS            ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_troop_occupation          = 2  -- 0 = free, 1 = merchant
--slot_troop_banner_scene_prop    = 3 -- important for kingdom heroes and player only


-- MM added
slot_troop_initial_morale              = 5
slot_troop_officer_troop               = 6
slot_troop_scale_factor                = 7
slot_troop_base_type                   = 8

slot_troop_class                       = 10
slot_troop_class_type                  = 11
slot_troop_rank                        = 12
slot_troop_rank_type                  = 13

-- slot_troop_custom_banner_bg_color_1      = 10
-- slot_troop_custom_banner_bg_color_2      = 11
-- slot_troop_custom_banner_charge_color_1  = 12
-- slot_troop_custom_banner_charge_color_2  = 13
-- slot_troop_custom_banner_charge_color_3  = 14
-- slot_troop_custom_banner_charge_color_4  = 15
-- slot_troop_custom_banner_bg_type         = 16
-- slot_troop_custom_banner_charge_type_1   = 17
-- slot_troop_custom_banner_charge_type_2   = 18
-- slot_troop_custom_banner_charge_type_3   = 19
-- slot_troop_custom_banner_charge_type_4   = 20
-- slot_troop_custom_banner_flag_type       = 21
-- slot_troop_custom_banner_num_charges     = 22
-- slot_troop_custom_banner_positioning     = 23
-- slot_troop_custom_banner_map_flag_type   = 24



slot_troop_button_id              = 20
slot_troop_button_2_id            = 21
slot_troop_active_this_mission    = 22


----------------------------------------------------------------------------------------------------------------
----  PLAYER SLOTS           ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_player_spawned_this_round                 = 0
slot_player_selected_item_indices_begin        = 2
slot_player_selected_item_indices_end          = 11
slot_player_cur_selected_item_indices_begin    = slot_player_selected_item_indices_end
slot_player_cur_selected_item_indices_end      = slot_player_selected_item_indices_end + 9
slot_player_join_time                          = 21
slot_player_button_index                       = 22 --used for presentations
slot_player_can_answer_poll                    = 23
slot_player_first_spawn                        = 24
slot_player_spawned_at_siege_round             = 25
slot_player_poll_disabled_until_time           = 26
slot_player_last_team_select_time              = 27
slot_player_death_pos_x                        = 28
slot_player_death_pos_y                        = 29
slot_player_death_pos_z                        = 30
slot_player_last_bot_count                     = 31
slot_player_bot_type_1_wanted                  = 32
slot_player_bot_type_2_wanted                  = 33
slot_player_bot_type_3_wanted                  = 34
slot_player_bot_type_4_wanted                  = 35
slot_player_spawn_count                        = 36

-- MM
slot_player_selected_flag                      = 40
slot_player_bot_type_wanted                    = 41
slot_player_bot_type_spawned                   = 42
slot_player_teamkills                          = 43
slot_player_last_teamkill_at                   = 44

--slot_player_last_message_at          = 49  --patch1115
--slot_player_message_count          = 50  --patch1115

--patch1115 43/1 start
slot_player_musician_spawned					   = 45
slot_player_drummer_spawned					   = 46
slot_player_flag_spawned					   = 47
--patch1115 43/1 end
--slot_player_god_mode                 = 48 --patch1115 54/14
slot_player_revive_pos              = 48 --patch1115 46/16
slot_player_formation_change              = 49
slot_player_formation_change_2              = 50
slot_player_bot_order              = 51
--[[
slot_player_selected_player = next(52)
slot_player_found_player_0 = next()
slot_player_found_player_1 = next()
slot_player_found_player_2 = next()
slot_player_found_player_3 = next()
slot_player_found_player_4 = next()
slot_player_found_player_5 = next()
slot_player_found_player_6 = next()
slot_player_found_player_7 = next()
slot_player_found_player_8 = next()
slot_player_found_player_9 = next()
slot_player_found_player_end = slot_player_found_player_9

slot_player_gold = next()
slot_player_gold_increment = next()
slot_player_role = next()
slot_player_admin_perms = next()
slot_player_admin_show_local_chat = next()
slot_player_anti_spam_last_action_at = next()

slot_player_last_menu_open = next()
slot_player_last_menu_type = next()
slot_player_last_custom_button_used = next()

slot_player_purchased_fancy_head = next()
slot_player_purchased_fancy_torso = next()
slot_player_purchased_fancy_legs = next()
slot_player_purchased_armor_head = next()
slot_player_purchased_armor_torso = next()

slot_player_purchased_start = slot_player_purchased_fancy_head
slot_player_purchased_end = slot_player_purchased_armor_torso + 1
--]]
----------------------------------------------------------------------------------------------------------------
----  TEAM SLOTS             ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

slot_team_flag_situation                       = 0


------ Troop occupations slot_troop_occupation
----slto_merchant           = 1
slto_inactive           = 0 --for companions at the beginning of the game

slto_player_companion   = 5 --This is specifically for companions in the employ of the player -- ie, in the party, or on a mission


----------------------------------------------------------------------------------------------------------------
----  SCENE PROP SLOTS       ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

scene_prop_open_or_close_slot       = 1
scene_prop_smoke_effect_done        = 2
-- MM
scene_prop_slot_is_spawned          = 3
scene_prop_slot_in_use              = 4
scene_prop_slot_x_value             = 5
scene_prop_slot_y_value             = 6
scene_prop_slot_z_value             = 7
scene_prop_slot_x_rot               = 8
scene_prop_slot_y_rot               = 9
scene_prop_slot_z_rot               = 10
scene_prop_slot_z_rotation_limit    = 11
scene_prop_slot_x_scale             = 12
scene_prop_slot_y_scale             = 13
scene_prop_slot_z_scale             = 14
scene_prop_slot_is_scaled           = 15
scene_prop_slot_x_extra             = 16
scene_prop_slot_y_extra             = 17
scene_prop_slot_z_extra             = 18
scene_prop_slot_time                = 19
scene_prop_slot_bounces             = 20
scene_prop_slot_times_hit           = 21
scene_prop_slot_owner_team          = 22
scene_prop_slot_time_left           = 23
scene_prop_slot_has_ball            = 24
scene_prop_slot_is_loaded           = 25
scene_prop_slot_is_active           = 26
scene_prop_slot_just_fired          = 27
scene_prop_slot_health              = 28
scene_prop_slot_max_health          = 29
scene_prop_slot_displayed_particle  = 30
scene_prop_slot_ammo_type           = 31
scene_prop_slot_ignore_inherit_movement = 32
scene_prop_slot_float_ground        = 33
scene_prop_slot_ground_offset       = 34
scene_prop_slot_spawned_at          = 35
scene_prop_slot_is_not_pushed_back  = 36
scene_prop_slot_just_pushed_back    = 37


scene_prop_slot_destruct_wall_height            = 38
scene_prop_slot_destruct_wall_width             = 39
scene_prop_slot_destruct_wall_length            = 40
scene_prop_slot_destruct_move_height_to_center  = 41
scene_prop_slot_destruct_move_width_to_center   = 42
scene_prop_slot_destruct_move_length_to_center  = 43
scene_prop_slot_destruct_rotate_z_90            = 44
scene_prop_slot_destruct_wall_height_offset     = 45
scene_prop_slot_destruct_wall_width_offset      = 46
scene_prop_slot_destruct_wall_length_offset     = 47
scene_prop_slot_destruct_inverse_width_movement = 48
scene_prop_slot_destruct_max_length             = 49

scene_prop_slot_destruct_smoke_strength         = 50

-- under here slots that need -1 as default
scene_prop_slot_replaced_by         = 52
scene_prop_slot_replacing           = 53
scene_prop_slot_last_hit_by         = 54
scene_prop_slot_user_agent          = 55
scene_prop_slot_controller_agent    = 56
scene_prop_slot_carrier_agent       = 57
scene_prop_slot_linked_prop         = 58

scene_prop_slot_sound_effect        = 59
scene_prop_slot_particle_effect1    = 60
scene_prop_slot_particle_effect2    = 61
scene_prop_slot_particle_effect3    = 62
scene_prop_slot_particle_effect4    = 63

scene_prop_slot_destruct_smoke_type             = 64
scene_prop_slot_destruct_smoke_type2            = 65
scene_prop_slot_destruct_particles_type         = 66
scene_prop_slot_destruct_sound_id               = 67
scene_prop_slot_destruct_pile_prop_begin        = 68
scene_prop_slot_destruct_pile_prop_end          = 69

-- precalc the next stages because that saves us a lot of running of codes.
scene_prop_slot_destruct_next_stage_1           = 70
scene_prop_slot_destruct_next_stage_2           = 71
scene_prop_slot_destruct_next_stage_3           = 72
scene_prop_slot_destruct_next_stage_4           = 73
scene_prop_slot_destruct_next_stage_5           = 74
scene_prop_slot_destruct_next_stage_6           = 75
scene_prop_slot_destruct_next_stage_7           = 76
scene_prop_slot_destruct_next_stage_8           = 77
scene_prop_slot_destruct_next_stage_9           = 78
scene_prop_slot_destruct_next_stage_10          = 79

scene_prop_slot_parent_prop         = 80
scene_prop_slot_child_prop1         = 81
scene_prop_slot_child_prop2         = 82
scene_prop_slot_child_prop3         = 83
scene_prop_slot_child_prop4         = 84
scene_prop_slot_child_prop5         = 85
scene_prop_slot_child_prop6         = 86
scene_prop_slot_child_prop7         = 88
scene_prop_slot_child_prop8         = 89
scene_prop_slot_child_prop9         = 90
scene_prop_slot_child_prop10        = 91
scene_prop_slot_child_prop11        = 92
scene_prop_slot_child_prop12        = 93
scene_prop_slot_child_prop13        = 94
scene_prop_slot_child_prop14        = 95
scene_prop_slot_child_prop15        = 96
scene_prop_slot_child_prop16        = 97

scene_prop_slots_begin              = scene_prop_open_or_close_slot
scene_prop_slots_end                = 98

scene_prop_slots_defmin_begin       = scene_prop_slot_replaced_by

scene_prop_slot_gold_amount = 99


    --                                         *****************ORRA Start*****************

orra_child_is_changing_offset        = 11161
orra_child_is_active                 = 11162
orra_child_offset_x                  = 11163
orra_child_offset_y                  = 11164
orra_child_offset_z                  = 11165
orra_track_channel                   = 11166
orra_soundtrack_num                  = 11167
volume_1                            = 11168
volume_2                            = 11169
volume_3                            = 11170
volume_4                            = 11171
volume_5                            = 11172
volume_6                            = 11173
volume_7                            = 11174
volume_8                            = 11175
volume_9                            = 11176
volume_10                           = 11177
volume_11                           = 11178
volume_12                           = 11179
volume_13                           = 11180
volume_14                           = 11181
volume_15                           = 11182
orra_timer_repeating_pattern         = 11183
orra_timer_stage                     = 11184
orra_child_number                    = 11185
orra_parent_anchor                   = 11186
orra_first_rider                     = 11187
orra_clone                           = 11188
orra_2_child_offset_x                = 11189
orra_2_child_offset_y                = 11190
orra_2_child_offset_z                = 11191
orra_xy_half_range                   = 11192
orra_min_xy_angle                    = 11193
orra_init_pitch                      = 11194
orra_init_yaw                        = 11195
orra_front_wheels                    = 11196
orra_rear_wheels                     = 11197
scene_prop_slot_rotating_child1     = 11198
scene_prop_slot_rotating_child2     = 11199
scene_prop_slot_rotating_child3     = 11200
scene_prop_slot_rotating_child4     = 11201
scene_prop_slot_rotating_child5     = 11202
scene_prop_slot_rotating_child6     = 11203
scene_prop_slot_rotating_child7     = 11204
scene_prop_slot_rotating_child8     = 11205
scene_prop_slot_rotating_child9     = 11206
scene_prop_slot_rotating_child10    = 11207
scene_prop_slot_rotating_child11    = 11208
scene_prop_slot_rotating_child12    = 11209
scene_prop_slot_rotating_child13    = 11210
scene_prop_slot_rotating_child14    = 11211
scene_prop_slot_rotating_child15    = 11212
scene_prop_slot_rotating_child16    = 11213

orra_zero_track_slot                 = 9000
orra_first_track_slot                = 9001

orra_stopped_at_turn                 = 1705
orra_aircraft_roll                   = 1706
orra_aircraft_yaw                    = 1707
orra_aircraft_pitch                  = 1708    
orra_aircraft_throttle               = 1709
orra_aircraft_rotating_blades        = 1710
orra_cs_unloaded_auto_item_kind      = 1711
orra_cs_unloaded_semi_item_kind      = 1712
orra_train_fix_countdown             = 1713
orra_timer_prop                      = 1714
orra_timer_prop2                     = 1715
orra_timer_prop3                     = 1716
orra_timer_prop4                     = 1717
orra_timer_prop5                     = 1718
orra_max_child_slot                  = 1719
orra_horn_button                     = 1720
orra_sound_prop                      = 1721
orra_total_amount_of_junctions       = 1722
orra_junction_next_track_id          = 1723
orra_junction_next_track_var         = 1724
orra_junction_type                   = 1725
orra_SB1_rear_pos_x                  = 1726
orra_SB1_rear_pos_y                  = 1727
orra_SB1_rear_pos_z                  = 1728
orra_SB1_front_pos_x                 = 1729
orra_SB1_front_pos_y                 = 1730
orra_SB1_front_pos_z                 = 1731
orra_SB1_turn_length                 = 1732
orra_dist_to_previous_bogie          = 1733
orra_engine_prop                     = 1734
orra_single_bogie1                   = 1735
orra_front_bogie2                    = 1736
orra_rear_bogie2                     = 1737
orra_front_bogie3                    = 1738
orra_rear_bogie3                     = 1739
orra_local_speed                     = 1740
orra_carriage_length                 = 1741
orra_reverse_button                  = 1742
orra_carriage_root                   = 1743
orra_rear_bogie1                     = 1744
orra_bogie1_cur_turn_z               = 1745
orra_bogie1_cur_turn_y               = 1746
orra_bogie1_rear_global_turn_y       = 1747
orra_bogie1_front_global_turn_y      = 1748
orra_bogie_dead_end                  = 1749
orra_magnitude                       = 1750
orra_pitch                           = 1751
orra_yaw                             = 1752
orra_roll                            = 1753
orra_cs_auto_ammo                    = 1798
orra_cs_semi_ammo                    = 1799
orra_bogie1_front_turn_z             = 1800
orra_bogie1_front_turn_y             = 1801
orra_bogie1_front_pos_x              = 1802
orra_bogie1_front_pos_y              = 1803
orra_bogie1_front_pos_z              = 1804
orra_bogie1_rear_turn_z              = 1805
orra_bogie1_rear_turn_y              = 1806
orra_bogie1_rear_pos_x               = 1807
orra_bogie1_rear_pos_y               = 1808
orra_bogie1_rear_pos_z               = 1809
orra_bogie1_turn_length              = 1810
orra_current_track                   = 1876
orra_reverse                         = 1877
orra_speed_level                     = 1878
orra_implied_speed                   = 1879
orra_machinegun_test                 = 1880
orra_bogie_center                    = 1883
orra_bogie_length                    = 1884
orra_at_turn                         = 1885
orra_front_bogie1                    = 1886
orra_control_button                  = 1887
orra_hypotenuse_xy                   = 1990
orra_hypotenuse_xz                   = 1991
orra_invert_degree                   = 1995
scene_prop_slot_old_sin             = 1996
scene_prop_slot_old_cos             = 1997
orra_arty_crosshair_prop             = 2000
orra_arty_handle                     = 2001
orra_arty_spinup_progress            = 2002
orra_arty_twisting_barrel1           = 2101
orra_arty_twisting_barrel2           = 2102
orra_arty_twisting_barrel3           = 2103
orra_arty_twisting_barrel4           = 2104
orra_arty_twisting_barrel5           = 2105
orra_arty_twisting_barrel6           = 2106
orra_arty_reload_button              = 2107
orra_arty_manual_turn_button         = 2108
orra_arty_is_manual_turn_body        = 2109
orra_arty_fire_point                 = 2110
orra_arty_spin_anchor                = 2111
orra_arty_z_only_rot                 = 2112
orra_arty_root_prop                  = 2113
orra_arty_ammo_left                  = 2114
orra_arty_max_ammo                   = 2115
orra_arty_aim_button                 = 2116
orra_arty_loaded_rocket              = 2117
orra_cs_auto_delay                   = 2118
orra_arty_controller_agent           = 2119
orra_arty_test_look_prop             = 2120
orra_arty_aim_platform               = 2121
orra_cs_rpg_remaining_rockets        = 2122
orra_cs_just_threw_smoke             = 2123
orra_superpower_rain_used            = 2124
orra_vehicle_i_am_spawnpoint         = 2125
orra_soundtrack_cut_agent_id         = 2126
orra_cs_just_threw_frag              = 2127
orra_flamethrower_emit_prop          = 2128
orra_flamethrower_is_emit_prop       = 2129
orra_flamethrower_is_on              = 2130
orra_arty_aim_platform_starting_z    = 2131
orra_train_station_countdown         = 2132
orra_train_acceleration              = 2133
orra_killer_barrier                  = 2134
orra_train_force_stop                = 2135
orra_train_force_stop_countdown      = 2136
orra_train_time_stopped              = 2137
orra_flamethrower_fuel               = 2138
orra_flamethrower_interface_update   = 2139
orra_base_speed                      = 2140
orra_flamethrower_stream_length      = 2141
orra_train_force_stop_track          = 2142
orra_button_last_time_used           = 2143
orra_lingering_cooldown              = 2144
orra_is_emit_prop                    = 2145
orra_agent_is_on_fire                = 2146
orra_agent_arsonist_id               = 2147
orra_prop_is_on_fire                 = 2148
orra_arty_manual_turn_anchor         = 2149
orra_sound_played_times              = 2150
orra_aircraft_cur_flechette_box      = 2151
orra_aircraft_flechette_box_1        = 2152
orra_aircraft_flechette_box_2        = 2153
orra_aircraft_flechette_box_3        = 2154
orra_aircraft_flechette_box_4        = 2155
orra_aircraft_flechette_box_5        = 2156
orra_aircraft_flechette_box_6        = 2157
orra_aircraft_flechette_box_7        = 2158
orra_aircraft_flechette_box_8        = 2159
orra_aircraft_flechette_box_9        = 2160
orra_aircraft_flechette_box_10       = 2161
orra_aircraft_flechettes_left_in_box = 2162
orra_aircraft_flechette_uses_left    = 2163
orra_crator_is_burning               = 2164
orra_crator_creator                  = 2165
orra_explosion_time                  = 2166
orra_respawn_cooldown                = 2167
orra_aircraft_missile1               = 2168
orra_aircraft_missile2               = 2169
orra_aircraft_missile3               = 2170
orra_aircraft_missile4               = 2171
orra_aircraft_missile5               = 2172
orra_aircraft_missile6               = 2173
orra_aircraft_missile7               = 2174
orra_aircraft_missile8               = 2175
orra_aircraft_missile9               = 2176
orra_aircraft_missile10              = 2177
orra_heli_cargo_door                 = 2178
orra_aircraft_machinegun             = 2179
orra_aircraft_flamethrower1          = 2180
orra_aircraft_flamethrower2          = 2181
orra_aircraft_flamethrower3          = 2182
orra_agent_spawned_with_bow          = 2183
orra_lingering_range                 = 2184
orra_child_is_machinegun             = 2185
orra_child_is_flamethrower           = 2186
orra_child_is_rocket_socket          = 2187
orra_aircraft_flamethrower_is_on     = 2188
orra_heli_cargo_door_state           = 2189
orra_machinegun_rounds_left          = 2190
orra_child_is_aircraft_blade         = 2191
orra_lingering_strength              = 2192
orra_child_is_shield                 = 2193
orra_max_flamethrower_slot           = 2194
orra_child_is_deployer               = 2195
orra_aircraft_deployer1              = 2196
orra_aircraft_deployer10             = 2206
orra_deployer_smokes_left            = 2207
orra_button_current_activating_agent = 2208
orra_child_is_tnt                    = 2209
orra_last_time_knocked_down          = 2210
orra_player_changed_to_horsed_class  = 2211
orra_player_mandatory_horse_type     = 2212
orra_player_already_horsed           = 2213
orra_player_troop_is_transport_cart  = 2214
orra_entity_already_registered       = 2215
orra_entity_was_spawned_manually     = 2216
orra_entity_spawned                  = 2217
orra_child_is_part_of_pilot_door     = 2218
orra_flamethrower_tank_carrier_agent = 2219
orra_flamethrower_fuel_tank          = 2220
flamethrower_first_x                = 2221
flamethrower_first_y                = 2222
flamethrower_first_z                = 2223
flamethrower_second_x               = 2224
flamethrower_second_y               = 2225
flamethrower_second_z               = 2226
orra_aircraft_blade_collision        = 2227
orra_agent_fly_z_momentum            = 2228
orra_cs_bwrr_delay                   = 2229
orra_cs_bwrr_ammo                    = 2230
orra_player_is_shapeshifter          = 2231
orra_player_is_imposter              = 2232
orra_shapeshifter_stolen_player_id   = 2233
orra_is_custom_missile               = 2234
slot_agent_last_fire_at             = 2235
orra_test_arrow                      = 2236
orra_wheels_acos                     = 2237
orra_test_first_try                  = 2238

-- GATE

orra_gate_is_opened                  = 2300
orra_gate_first_left_part            = 2301
orra_gate_first_right_part           = 2302
orra_gate_part_is_opening            = 2303
orra_gate_opening_stage              = 2304
orra_gate_second_part                = 2305
orra_gate_third_part                 = 2306
orra_gate_fourth_part                = 2307
orra_gate_part_is_opening            = 2308
orra_gate_closing_stage              = 2309
orra_gate_is_animating               = 2310

-- AIRPLANE

orra_airplane_turning_blades         = 2500
orra_airplane_landing_wheels         = 2501
orra_airplane_engine_handle          = 2502
orra_airplane_engine_button          = 2503
orra_airplane_gatling_gun            = 2504
orra_aircraft_rocket_socket1         = 2505
orra_aircraft_rocket_socket2         = 2506
orra_aircraft_rocket_socket3         = 2507
orra_aircraft_rocket_socket4         = 2508
orra_aircraft_rocket_socket5         = 2509
orra_aircraft_rocket_socket6         = 2510
orra_aircraft_rocket_socket7         = 2511
orra_aircraft_rocket_socket8         = 2512
orra_aircraft_rocket_socket9         = 2513
orra_aircraft_rocket_socket10        = 2514
orra_aircraft_thrust                 = 2515
orra_aircraft_exploded               = 2516
orra_aircraft_cur_rocket_socket      = 2517
orra_aircraft_gatling_ammo           = 2518
orra_airplane_exhaustion_pipe1       = 2519
orra_airplane_exhaustion_pipe2       = 2520
orra_aircraft_current_roll           = 2521
orra_aircraft_current_pitch          = 2522
orra_aircraft_wheels_momentum        = 2523
orra_aircraft_is_on_land             = 2524
orra_aircraft_altitude               = 2525
orra_aircraft_been_underground       = 2526
orra_aircraft_is_rocket              = 2527
orra_aircraft_rocket_just_fired      = 2528
orra_aircraft_pitch_direction        = 2529
orra_aircraft_updated_pitch_direction= 2530
orra_aircraft_spawned                = 2531
orra_airplane_seconds_left           = 2532
orra_aircraft_last_rocket_socket_slot= 2533

-- ULTRALIGHT HELICOPTER

orra_ultraheli_shield_hinge          = 2580
orra_ultraheli_shield_body           = 2581
orra_ultraheli_shield_body10         = 2591
orra_ultraheli_interface_update      = 2592

-- VTOL

orra_vtol_front_wheels               = 2600
orra_vtol_right_wheels               = 2601
orra_vtol_left_wheels                = 2602
orra_vtol_right_door_hinge           = 2603
orra_vtol_right_door_button          = 2604
orra_vtol_right_door_body            = 2605
orra_vtol_left_door_hinge            = 2606
orra_vtol_left_door_button           = 2607
orra_vtol_left_door_body             = 2608
orra_vtol_cargo_door                 = 2609
orra_vtol_right_rotor                = 2610
orra_vtol_left_rotor                 = 2611
orra_vtol_right_blade1               = 2612
orra_vtol_right_blade2               = 2613
orra_vtol_right_blade3               = 2614
orra_vtol_left_blade1                = 2615
orra_vtol_left_blade2                = 2616
orra_vtol_left_blade3                = 2617
orra_vtol_rotation_stage             = 2618
orra_vtol_rotor_incline              = 2619
orra_vtol_right_door_inner_button    = 2620
orra_vtol_cargo_door_state           = 2621
orra_vtol_door_state                 = 2622
orra_vtol_door_part1                 = 2623
orra_vtol_door_part20                = 2643
orra_vtol_collision_box              = 2644
orra_vtol_collision_box_state        = 2645
orra_vtol_broken_blades              = 2646
orra_vtol_player_interface_tilt      = 2647
orra_vtol_player_interface_altitude  = 2648
orra_vtol_player_interface_thrust    = 2649
orra_vtol_player_interface_warning   = 2650
orra_vtol_player_interface_cargo_door= 2651
orra_vtol_warning                    = 2652
orra_vtol_player_interface_throttle  = 2653
orra_vtol_interface_update           = 2654

-- HELICOPTER

orra_heli_rear_rotor                 = 2660
orra_heli_land_point                 = 2661
orra_heli_player_interface_altitude  = 2662
orra_heli_player_interface_throttle  = 2663
orra_heli_player_interface_flamethrower_fuel = 2664
orra_heli_player_interface_rockets   = 2665
orra_heli_player_interface_rounds    = 2666
orra_heli_player_interface_cargo_door= 2667
orra_heli_blade1                     = 2668
orra_heli_blade2                     = 2669
orra_heli_blade3                     = 2670
orra_heli_blade4                     = 2671
orra_heli_blade5                     = 2672
orra_heli_blade6                     = 2673
orra_heli_blade7                     = 2674
orra_heli_blade8                     = 2675
orra_heli_blade9                     = 2676
orra_heli_blade10                    = 2677
orra_heli_blade11                    = 2678
orra_heli_blade12                    = 2679
orra_heli_blade13                    = 2680
orra_heli_blade14                    = 2681
orra_heli_blade15                    = 2682
orra_heli_blade16                    = 2683
orra_heli_blade17                    = 2684
orra_heli_blade18                    = 2685
orra_heli_blade19                    = 2686
orra_heli_blade20                    = 2687
orra_heli_interface_update           = 2688
orra_heli_player_interface_smokes    = 2689

-- SECONDARY PARENTING

orra_prt_rot_x                       = 2700
orra_prt_rot_y                       = 2701
orra_prt_rot_z                       = 2702
orra_prt_move_x                      = 2703
orra_prt_move_y                      = 2704
orra_prt_move_z                      = 2705
orra_prt_step                        = 2706
orra_intermediate_yaw                = 2707
orra_prt_step_dist_x                 = 2708
orra_prt_step_dist_y                 = 2709
orra_prt_step_dist_z                 = 2710
orra_prt_step_turn_x                 = 2711
orra_prt_step_turn_y                 = 2712
orra_prt_step_turn_z                 = 2713
orra_prt_intermediary_anchor         = 2714

-- Bow

orra_bow_agent_ready_bow             = 2730
orra_bow_walking_is_toggled          = 2731
orra_bow_arrows_instead_of_rockets   = 2732

-- VEHICLES

orra_vehicle_reverse_door            = 2800
orra_vehicle_exhausting_pipe1        = 2801
orra_vehicle_exhausting_pipe2        = 2802
orra_vehicle_exhausting_pipe3        = 2803
orra_vehicle_exhausting_pipe4        = 2804
orra_vehicle_steering_wheel          = 2805
orra_vehicle_door                    = 2806
orra_vehicle_spawnpoint              = 2807
orra_vehicle_door_state              = 2808
orra_vehicle_left_steering_stage     = 2809
orra_vehicle_right_steering_stage    = 2810
orra_vehicle_spawnpoint1             = 2811
orra_vehicle_spawnpoint2             = 2812
orra_vehicle_spawnpoint3             = 2813
orra_vehicle_spawnpoints_amount      = 2814
orra_vehicle_collision1              = 2815
orra_vehicle_collision2              = 2816
orra_vehicle_collision20             = 2835
orra_wheelbarrow_last_speed_x        = 2836
orra_wheelbarrow_last_speed_y        = 2837
orra_is_collision                    = 2838
orra_vehicle_is_colliding            = 2839
orra_vehicle_is_falling              = 2840
orra_vehicle_sound_is_on             = 2841
orra_vehicle_fall_height             = 2842
orra_vehicle_current_passengers_num  = 2843
orra_vehicle_kill_collision_at_speed = 2844
orra_vehicle_flag_1                  = 2845
orra_vehicle_flag_10                 = 2855
orra_medbed_extra_equipment          = 2856
orra_vehicle_last_roll               = 2857
orra_vehicle_inertia_z               = 2858
orra_vehicle_times_in_free_fall      = 2859
orra_vehicle_x_rot                   = 2860
orra_vehicle_acceleration			 = 2861
orra_prop_object_id					 = 2862

-- FIGHTER JET

orra_jet_pilot_hatch                 = 3000
orra_jet_flame_cover                 = 3001
orra_jet_front_hydraulics            = 3002
orra_jet_left_hydraulics             = 3003
orra_jet_right_hydraulics            = 3004
orra_jet_front_wheels                = 3005
orra_jet_left_wheels                 = 3006
orra_jet_right_wheels                = 3007
orra_jet_left_tail_fin               = 3008
orra_jet_right_tail_fin              = 3009
orra_jet_pilot_glass                 = 3010
orra_jet_pilot_hatch_state           = 3011
orra_jet_chassis_state               = 3012
orra_jet_updated_chassis_state       = 3013
orra_jet_player_interface_rounds     = 3014
orra_jet_player_interface_cluster_missiles = 3015
orra_jet_player_interface_altitude   = 3016
orra_jet_player_interface_thrust     = 3017
orra_jet_player_interface_chassis    = 3018
orra_jet_player_interface_warning    = 3019
orra_jet_warning                     = 3020
orra_jet_rounds                      = 3021
orra_jet_flame_cover_stage           = 3022
orra_jet_flame_cover_x_scale         = 3023
orra_jet_flame_cover_y_scale         = 3024
orra_jet_flame_cover_z_scale         = 3025

-- CUSTOM MISSILES

cannon_ammo_type_cluster_missile    = 3100
orra_missile_already_shot            = 3101

-- WHEELBARROW

orra_wheelbarrow_passenger_button_1  = 3200
orra_wheelbarrow_passenger_button_2  = 3201
orra_wheelbarrow_passenger_button_3  = 3202
orra_wheelbarrow_armament_tnt        = 3203
orra_wheelbarrow_stance              = 3204
orra_wheelbarrow_cur_incline         = 3205
orra_wheelbarrow_x_rot               = 3206
orra_wheelbarrow_y_rot               = 3207
orra_wheelbarrow_z_rot               = 3208
orra_wheelbarrow_last_height         = 3209
orra_wheelbarrow_armament_nitro1     = 3210
orra_wheelbarrow_armament_nitro2     = 3211
orra_wheelbarrow_armament_nitro3     = 3212
orra_wheelbarrow_armament_nitro4     = 3213
orra_wheelbarrow_tnt_is_loaded       = 3214
orra_child_is_frontal_wheelbarrow_seat= 3215
orra_wheelbarrow_x_rot_difference    = 3216
orra_wheelbarrow_y_rot_difference    = 3217

-- JEEP

orra_jeep_rotary_ball                = 3316
orra_jeep_machinegun                 = 3317
orra_jeep_machinegun_seat            = 3318
orra_jeep_machinegun_button          = 3319
orra_jeep_window_grating             = 3320
orra_jeep_window_grating_extra       = 3321
orra_jeep_bumper                     = 3322
orra_jeep_right_door_grating         = 3323
orra_jeep_hull_grating               = 3324
orra_jeep_madmax_intake              = 3325
orra_jeep_madmax_exhaust_x_4_5       = 3326
orra_jeep_madmax_exhaust_x_2_65      = 3327
orra_jeep_madmax_exhaust_x_3_2       = 3328
orra_jeep_cage                       = 3329
orra_jeep_cage_roof                  = 3330
orra_jeep_cage_portcullis            = 3331
orra_jeep_tower                      = 3332
orra_jeep_side_step                  = 3333
orra_jeep_tower_mortar               = 3334
orra_jeep_load_mortar                = 3335
orra_jeep_rear_panel                 = 3336
orra_jeep_open_load                  = 3337
orra_jeep_closed_load                = 3338
orra_jeep_left_cargo_door            = 3339
orra_jeep_left_cargo_button          = 3340
orra_jeep_left_cargo_hinge           = 3341
orra_jeep_right_cargo_door           = 3342
orra_jeep_right_cargo_button         = 3343
orra_jeep_right_cargo_hinge          = 3344
orra_jeep_open_load                  = 3345
orra_jeep_load_mortar_ammo           = 3346
orra_jeep_tower_mortar_ammo          = 3347
orra_jeep_left_door_grating          = 3348
orra_jeep_bigfoot_rear_wheels        = 3349
orra_jeep_bigfoot_front_wheels       = 3350
orra_jeep_bigfoot_rear_suspension    = 3351
orra_jeep_bigfoot_front_suspension   = 3352
orra_jeep_bigfoot_horsepower_minus_z = 3353
orra_jeep_bigfoot_horsepower_plus_z  = 3354
orra_jeep_suspension_x_rot           = 3355
orra_jeep_suspension_z_weight        = 3356
orra_jeep_side_stairs                = 3357
orra_jeep_z_from_wheels_to_root      = 3358
orra_jeep_wheels_mode                = 3359

-- MLRS

orra_mlrs_rotary_point               = 3400
orra_mlrs_base                       = 3401
orra_mlrs_portcullis                 = 3402

-- GruZ-200

orra_gruz200_frontal_barrel          = 3500
orra_gruz200_rear_wheels             = 3501
orra_gruz200_gatling_base            = 3502
orra_gruz200_gatling_barrels         = 3503
orra_gruz200_cart                    = 3504

-- MAGIC

orra_magic_fireball_aura_stage       = 3900
orra_magic_fireball_clockwise_rot    = 3901
orra_magic_fireball_state            = 3902
orra_magic_fireball_z_offset         = 3903
orra_magic_fireball_0                = 3904
orra_magic_fireball_9                = 3913
orra_magic_fireballs_in_aura         = 3914
orra_magic_fireball_z_rot            = 3915

-- CUSTOM MENU

--settings_orra_jeep_load				 = 4000


orra_setting_normal_fire_mode        = 0
orra_setting_semi_auto               = 1
orra_setting_full_auto               = 2
orra_setting_bwrr                    = 3
orra_fire_mode_setting_end           = 4 

orra_spawnpoint_setting_1            = 0
orra_spawnpoint_setting_2            = 1
orra_spawnpoint_setting_3            = 2
orra_spawnpoint_setting_random       = 3
orra_spawnpoint_setting_no_spawn     = 4
orra_spawnpoint_setting_end          = 5

orra_respawn_time_setting_1          = 0
orra_respawn_time_setting_2          = 1
orra_respawn_time_setting_3          = 2
orra_respawn_time_setting_4          = 3
orra_respawn_time_setting_5          = 4
orra_respawn_time_setting_6          = 5
orra_respawn_time_setting_7          = 6
orra_respawn_time_setting_no_respawn = 7
orra_respawn_time_setting_end        = 8

orra_heli_armament_setting_no_armament= 0
orra_heli_armament_setting_1         = 1
orra_heli_armament_setting_2         = 2
orra_heli_armament_setting_end       = 3

orra_ultraheli_armament_setting_no_armament= 0
orra_ultraheli_armament_setting_1         = 1
orra_ultraheli_armament_setting_2         = 2
orra_ultraheli_armament_setting_3         = 3
orra_ultraheli_armament_setting_end       = 4

orra_wheelbarrow_armament_setting_no_armament= 0
orra_wheelbarrow_armament_setting_1          = 1
orra_wheelbarrow_armament_setting_end        = 2

orra_wheelbarrow_passenger_setting_speed_boost = 0
orra_wheelbarrow_passenger_setting_slow_down   = 1
orra_wheelbarrow_passenger_setting_no_affect   = 2
orra_wheelbarrow_passenger_setting_end         = 3

orra_jeep_load_setting_empty = 0
orra_jeep_load_setting_semienclosed = 1
orra_jeep_load_setting_enclosed = 2
orra_jeep_load_setting_roofless_open_cage = 3
orra_jeep_load_setting_roofless_prison_cage = 4
orra_jeep_load_setting_open_cage = 5
orra_jeep_load_setting_prison_cage = 6
orra_jeep_load_setting_fuel_tank = 7
orra_jeep_load_setting_machinegun = 8
orra_jeep_load_setting_machinegun_caged = 9
orra_jeep_load_setting_mortar = 10
orra_jeep_load_setting_mortar_caged = 11
orra_jeep_load_setting_mlrs = 12
orra_jeep_load_setting_end = 13

orra_jeep_wheels_setting_normie = 0
orra_jeep_wheels_setting_bigfoot = 1
orra_jeep_wheels_setting_drift = 2
orra_jeep_wheels_setting_horsepower = 3
orra_jeep_wheels_setting_end = 4

orra_jeep_tower_setting_no_tower = 0
orra_jeep_tower_setting_yes_tower = 1
orra_jeep_tower_setting_tower_with_mortar = 2
orra_jeep_tower_setting_end = 3

orra_jeep_side_steps_setting_none = 0
orra_jeep_side_steps_setting_platforms = 1
orra_jeep_side_steps_setting_stairs = 2
orra_jeep_side_steps_setting_end = 3

orra_jeep_window_grating_setting_no_grating = 0
orra_jeep_window_grating_setting_light_grating = 1
orra_jeep_window_grating_setting_heavy_grating = 2
orra_jeep_window_grating_setting_combined_grating = 3
orra_jeep_window_grating_setting_end = 4

orra_jeep_madmax_setting_no_madmax = 0
orra_jeep_madmax_setting_intake_only = 1
orra_jeep_madmax_setting_exhaust_only = 2
orra_jeep_madmax_setting_full_madmax = 3
orra_jeep_madmax_setting_end = 4


orra_boat_speed_setting_1            = 0
orra_boat_speed_setting_2            = 1
orra_boat_speed_setting_3            = 2
orra_boat_speed_setting_4            = 3
orra_boat_speed_setting_5            = 4
orra_boat_speed_setting_6            = 5
orra_boat_speed_setting_7            = 6
orra_boat_speed_setting_8            = 7
orra_boat_speed_setting_9            = 8
orra_boat_speed_setting_end          = 9
    
    --                                          *****************ORRA End*****************