#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// State variables:
debug            = false;
fade_state       = 0;
menu_state       = 0;
title_card_state = 0;
retry_state      = 0;

// Transition variables:
transition_type    = TRANS_FADE;
transition_speed   = 0.02;
transition_timer   = 0;
transition_standby = 0;
transition_room    = room;

// Background variables:
background_position     = -15;
background_speed        =  0;
background_target       =  global.display_height + 15;
background_scroll       =  0;
background_scroll_speed =  0.5;

// Banner variables:
banner_position     = -sprite_get_width(spr_title_card_banner) - 12;
banner_speed        =  0;
banner_target       =  0;
banner_scroll       =  0;
banner_scroll_speed =  1;

// Zone variables:
zone_position     = 0;
zone_start        = 0;
zone_speed        = 0;
zone_target       = 40;
zone_scroll       = 0;
zone_scroll_speed = 1;
zone_distance     = 0;

// Act variables:
act_position = global.display_height;
act_speed    = 0;

// Retry variables:
retry_position = 0;
retry_start    = 0;
retry_speed    = 0;
retry_target   = global.display_width / 2 - 3;
retry_distance = 0;
retry_steps    = 15;
retry_size     = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Transition

if (transition_type == TRANS_FADE) {
    // 0 - Fade to black:
    if (fade_state == 0) {
        if (transition_timer < 1) transition_timer += transition_speed;
        else {
            transition_timer = 1;
            fade_state       = 1;
        }
    }

    // 1 - Standing by:
    if (fade_state == 1) {
        if (transition_standby < 0.5) transition_standby += transition_speed;
        else {
            transition_standby = 0.5;

            if (debug == true) {
                event_user(0);

                if (input_check(INP_ACCEPT, CHECK_PRESSED)) {
                    fade_state = 2;
                    event_user(1);
                }
            } else {
                room_goto(transition_room);
                fade_state = 2;
            }
        }
    }

    // 2 - Fade from black:
    if (fade_state == 2) {
        if (transition_timer > 0) transition_timer -= transition_speed;
        else instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Transition

if (transition_type == TRANS_MENU) {
    // 0 - Background start:
    if (menu_state == 0) {
        if (background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
            menu_state          = 1;
        }
    }

    // 1 - Room change:
    if (menu_state == 1) {
        if (transition_timer < 1) transition_timer += transition_speed;
        else {
            //transition_timer = 1;

            if (debug == true) {
                event_user(0);

                if (input_check(INP_ACCEPT, CHECK_PRESSED)) {
                    menu_state = 2;
                    event_user(1);
                }
            } else {
                room_goto(transition_room);
                menu_state = 2;
            }
        }
    }

    // 2 - Background end:
    if (menu_state == 2) {
        // Background target:
        background_target = -15;

        if (background_position > background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position -= background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target
            instance_destroy();
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card Transition

if (transition_type == TRANS_CARD) {
    // Banner scroll:
    banner_scroll += banner_scroll_speed;

    // Zone distance:
    zone_distance = zone_start + zone_position;

    // Run kickoff:
    if (player_exists(0)) {
        if (title_card_state >= 4 && room_kickoff == KICKOFF_RUN && room_run_end_x != -1) {
            global.player_instance[0].x_speed     = global.player_instance[0].x_top_speed;
            global.player_instance[0].input_right = true;
        }
    }

    // 0 - Background start:
    if (title_card_state == 0) {
        if (background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
            title_card_state    = 1;
        }
    }

    // 1 - Banner/zone start:
    if (title_card_state == 1) {
        // Banner start:
        if (banner_position < 0) {
            banner_speed     = ceil(abs(banner_position - banner_target) / 6);
            banner_position += banner_speed;
        } else {
            banner_speed    = 0;
            banner_position = banner_target;
        }

        // Zone start:
        if (zone_distance < zone_target) {
            zone_speed     = ceil(abs(zone_distance - zone_target) / 9);
            zone_position += zone_speed;
        } else {
            zone_speed       = 0;
            zone_position    = -zone_start + zone_target;
            title_card_state = 2;
        }
    }

    // 2 - Room change:
    if (title_card_state == 2) {
        if (transition_timer < 1) transition_timer += transition_speed;
        else {
            transition_timer = 1;

            if (debug == true) {
                event_user(0);

                if (input_check(INP_ACCEPT, CHECK_PRESSED)) {
                    title_card_state = 4;
                    event_user(1);
                }
            } else {
                room_goto(transition_room);
                title_card_state = 3;
            }
        }
    }

    // 3 - Standing by:
    if (title_card_state == 3) {
        ctrl_stage.culling = true;

        if (transition_standby < 2) transition_standby += transition_speed;
        else {
            transition_standby = 2;
            title_card_state   = 4;
        }
    }

    // 4 - Background end:
    if (title_card_state == 4) {
        // Background target:
        background_target = -15;

        if (background_position > background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position -= background_speed;

            // Player kickoffs:
            if (player_exists(0)) {
                // Ready kickoff:
                if (room_kickoff == KICKOFF_READY) {
                    if (floor(background_position) <= global.player_instance[0].y + 13 - view_yview[view_current]) {
                        global.player_instance[0].animation_target = "ready";

                        if (player_exists(1)) global.player_instance[1].animation_target = "ready";
                    }
                } else {
                    if (room_kickoff != KICKOFF_DEFAULT && room_kickoff != KICKOFF_RUN) global.player_instance[0].input_lock = false;
                }
            }
        }  else {
            background_speed    = 0;
            background_position = background_target;
            title_card_state    = 5;
        }
    }

    // 5 - Banner/stage end:
    if (title_card_state == 5) {
        // Banner target:
        banner_target = -sprite_get_width(spr_title_card_banner) - 12;

        // Zone target:
        zone_target = global.display_width + 9;

        if (debug == false) {
            // Kickoff standbys:
            if (player_exists(0)) {
                // Default standby:
                if (room_kickoff == KICKOFF_DEFAULT) {
                    if (transition_standby < 3.7) transition_standby += transition_speed;
                    else transition_standby = 3.7;
                }

                // Animation standby:
                if (room_kickoff == KICKOFF_READY && global.player_instance[0].animation_target != "ready") {
                    if (transition_standby < 2.2) transition_standby += transition_speed;
                    else transition_standby = 2.2;
                }

                // Stop running:
                if (room_kickoff == KICKOFF_RUN) {
                    if (room_run_end_x != -1 && global.player_instance[0].x >= room_run_end_x) room_run_end_x = -1;
                }
            }
        }

        if (debug == true || room_kickoff == KICKOFF_DEBUG || (room_kickoff == KICKOFF_DEFAULT && transition_standby == 3.7) ||
            (room_kickoff == KICKOFF_READY && transition_standby >= 2.2) || (room_kickoff == KICKOFF_RUN && room_run_end_x == -1)) {
            // Start stage:
            stage_start();

            // Remove persistence:
            persistent = false;

            // Banner end:
            if (banner_position > banner_target) {
                banner_speed     = ceil(abs(banner_position - banner_target) / 6);
                banner_position -= banner_speed;
            } else {
                banner_speed = 0;
                banner_position = banner_target;
            }

            // Zone end:
            if (zone_distance < zone_target) {
                zone_speed     = ceil(abs(zone_distance - zone_target) / 9);
                zone_position += zone_speed;
            } else {
                zone_speed    = 0;
                zone_position = -zone_distance + zone_target;
            }
        }

        // Title card end:
        if (banner_position == banner_target && zone_distance == zone_target) instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Retry Transition

if (transition_type == TRANS_RETRY) {
    // Background scroll:
    background_scroll += background_scroll_speed;

    // Retry distance:
    retry_distance = retry_start - retry_position;

    // Run kickoff:
    if (player_exists(0)) {
        if (retry_state >= 4 && room_kickoff == KICKOFF_RUN && room_run_end_x != -1 && global.checkpoint_x == -1 && global.checkpoint_y == -1) {
            global.player_instance[0].x_speed     = global.player_instance[0].x_top_speed;
            global.player_instance[0].input_right = true;
        }
    }

    // Background position:
    if (retry_state != 4) {
        if (background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / retry_steps);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
        }
    } else {
        if (background_position > background_target) {
            background_speed     = ceil(abs(background_target - background_position) / retry_steps);
            background_position -= background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
        }
    }

    // Retry position:
    if (retry_distance > retry_target) {
        retry_speed     = ceil(abs(retry_target - retry_distance) / 9);
        retry_position += retry_speed;
    } else {
        retry_speed    = 0;
        retry_position = -retry_target + retry_start;
    }

    // Skip states:
    if (transition_standby != 1 && retry_state <= 1 && transition_standby != 1 && input_check(INP_ACCEPT, CHECK_PRESSED)) {
        transition_standby = 1;
        retry_state        = 1;
    }

    // 0 - Background start:
    if (retry_state == 0) {
        // Recompile animations
        //with(ctrl_stage) event_user(0);

        // Background target:
        background_target = 32;

        if (retry_distance == retry_target && background_position == background_target) retry_state = 1;
    }

    // 1 - Standing by:
    if (retry_state == 1) {
        if (transition_standby < 1) transition_standby += transition_speed;
        else {
            if (debug == true) event_user(0);
            if ((debug == true && input_check(INP_ACCEPT, CHECK_PRESSED)) || debug == false) {
                if (debug == true) event_user(1);

                retry_state = 2;
            }
        }
    }

    // 2 - Retry end:
    if (retry_state == 2) {
        // Background target:
        background_target = global.display_height / 2 + 15;

        // Retry target:
        retry_target = -retry_size - 9;

        if (retry_distance == retry_target && background_position == background_target) retry_state = 3;
    }

    // 3 - Room change:
    if (retry_state == 3) {
        if (transition_timer < 0.8) transition_timer += transition_speed;
        else {
            if (debug == false) room_goto(transition_room);

            retry_state = 4;
        }
    }

    // 4 - Background end:
    if (retry_state == 4) {
        ctrl_stage.culling = true;

        if (transition_timer < 1) transition_timer += transition_speed;
        else {
            // Background target:
            background_target = -15;

            // Stop running:
            if (player_exists(0)) {
                if (global.player_instance[0].x >= room_run_end_x && global.player_instance[0].action_state != ACTION_DEATH) room_run_end_x = -1;
            }

            if (debug == true || room_kickoff != KICKOFF_RUN || (room_kickoff == KICKOFF_RUN && (room_run_end_x == -1 || (global.checkpoint_x != -1 && global.checkpoint_y != -1)))) {
                // Resume stage:
                stage_start();

                if (background_position == background_target) instance_destroy();
            }
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play Music

// Reset music volume:
if (sound_kind_get_volume(3) != global.audio_bgm / 100) sound_kind_volume(3, global.audio_bgm / 100);

// Set music:
if (room_music != "") {
    if (!sound_isplaying(room_music)) {
        with (ctrl_audio) {
            // Discard music:
            if (music_instance != -1) {
                sound_discard(music_instance);
                music_instance = -1;
            }

            // Create music instance:
            if (music_instance == -1) music_instance = sound_loop_single(other.room_music);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Objects

// Create background:
if (room_background != -1) instance_create(0, 0, room_background);

// Create water:
if (room_water_level != -1) instance_create(0, room_water_level, obj_water_surface);

// Create stage objects:
if (transition_type == TRANS_CARD || transition_type == TRANS_RETRY) {
    instance_create(0, 0, ctrl_stage);
    instance_create(0, 0, ctrl_hud);

    instance_deactivate_all(true);
    instance_activate_object(gm82core_object);
    instance_activate_object(ctrl_display);
    instance_activate_object(ctrl_audio);
    instance_activate_object(ctrl_input);
    instance_activate_object(ctrl_text);
    instance_activate_object(ctrl_stage);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Open Debug Header
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Close Debug Header
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fade Transition

if (transition_type == TRANS_FADE) {
    draw_set_color(c_black);
    draw_set_alpha(transition_timer);

    draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + global.display_width, view_yview[view_current] + global.display_height, false);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu Transition

if (transition_type == TRANS_MENU) {
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_position);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card Transition

if (transition_type == TRANS_CARD) {
    // Font:
    draw_set_font(global.font_title_card);

    // Background:
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_position);

    // Bar:
    draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_position, view_yview[view_current] + banner_scroll);

    // Zone:
    zone_start = -string_width(room_zone) - 9;

    draw_text(view_xview[view_current] + zone_start + zone_position, view_yview[view_current] + 87, room_zone);

    if (room_act != 0) draw_sprite(spr_title_card_acts, room_act, view_xview[view_current] + zone_start + zone_position + 5, view_yview[view_current] + 128);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Retry Transition

if (transition_type == TRANS_RETRY) {
    // Font:
    draw_set_font(global.font_title_card);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Background:
    draw_sprite_tiled_horizontal(spr_transition_background, 1, view_xview[view_current] + background_scroll, view_yview[view_current] + background_position);
    draw_sprite_tiled_horizontal_yscale(spr_transition_background, 1, view_xview[view_current] - background_scroll, view_yview[view_current] + global.display_height - background_position, -1);

    // Try again:
    retry_size  = string_width("Try Again");
    retry_start = global.display_width + retry_size + 9;

    draw_text(view_xview[view_current] + retry_start - retry_position, view_yview[view_current] + global.display_height / 2, "Try Again");

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
