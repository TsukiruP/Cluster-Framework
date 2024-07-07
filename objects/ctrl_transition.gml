#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// Image speed:
image_speed = 0;

// State variables:
debug            = false;
fade_state       = 0;
menu_state       = 0;
title_card_state = 0;
retry_state      = 0;

pause_ignore     = false;

// Transition variables:
transition_type    = TRANS_FADE;
transition_timer   = 0;
transition_standby = 0;
transition_speed   = 0.02;
transition_room    = room;

// Fade handle:
fade_handle = noone;

// Background variables:
background_y_current      = -15;
background_y_target       =  global.display_height + 15;
background_y_speed        =  0;

background_x_scroll       =  0;
background_x_scroll_speed =  1;

// Banner variables:
banner_x_current      = -sprite_get_width(spr_title_card_banner) - 12;
banner_x_target       =  0;
banner_x_speed        =  0;

banner_y_scroll       =  0;
banner_y_scroll_speed =  1;

// Zone variables:
zone_x_start     = 0;
zone_x_current   = 0;
zone_x_target    = 40;
zone_x_speed     = 0;

zone_distance = 0;

// Retry variables:
retry_x_start   = 0;
retry_x_current = 0;
retry_x_target  = (global.display_width / 2) - 3;
retry_x_speed   = 0;

retry_distance  = 0;
retry_steps     = 15;
retry_size      = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Transition

if (transition_type == TRANS_FADE) {
    switch (fade_state) {
        // 0 - Start fade:
        case 0:
            if (fade_handle == noone) {
                fade_handle            = fade_create(transition_speed, 1);
                fade_handle.persistent = true;
            }

            if (fade_handle.fade_alpha >= 1) {
                global.time_allow = false;
                fade_state        = 1;
            }
            break;

        // 1 - Standing by:
        case 1:
            if (transition_standby < 1) {
                transition_standby += transition_speed;

                if (transition_standby >= 1) {
                    transition_standby =1;

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
            break;

        // 2 - Reverse fade:
        case 2:
            fade_reverse(fade_handle);
            fade_state = 3;
            break;

        // 3 - End fade:
        case 3:
            // Start game:
            game_start();

            if (!instance_exists(fade_handle)) {
                instance_destroy();
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Transition

if (transition_type == TRANS_MENU) {
    switch (menu_state) {
        // 0 - Background start:
        case 0:
            if (background_y_current < background_y_target) {
                background_y_speed     = ceil(abs(background_y_current - background_y_target) / 5);
                background_y_current += background_y_speed;

                if (background_y_current >= background_y_target) {
                    background_y_speed    = 0;
                    background_y_current = background_y_target;
                    menu_state          = 1;
                }
            }
            break;

        // 1 - Room change:
        case 1:
            if (transition_timer < 1) {
                transition_timer += transition_speed;

                if (transition_timer >= 1) {
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
            break;

        // 2 - Background end:
        case 2:
            // Background target:
            background_y_target = -15;

            if (background_y_current > background_y_target) {
                background_y_speed     = ceil(abs(background_y_current - background_y_target) / 5);
                background_y_current -= background_y_speed;

                if (background_y_current <= background_y_target) {
                    background_y_speed    = 0;
                    background_y_current = background_y_target
                    instance_destroy();
                }
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card Transition

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_type == TRANS_CARD) {
    // Banner scroll:
    banner_y_scroll += banner_y_scroll_speed;

    // Zone distance:
    zone_distance = zone_x_start + zone_x_current;

    // Run kickoff:
    if (player_exists(0) != noone) {
        if (title_card_state >= 4 && room_kickoff == KICKOFF_RUN && room_run_end_x != -1) {
            with (player_exists(0)) {
                g_speed                             = top_speed;
                input_player[INP_RIGHT, CHECK_HELD] = true;
            }
        }
    }
    
    // Background target:
    if (title_card_state >= 4) {
        background_y_target = -15;
    }
    
    // Background position:
    if (background_y_current != background_y_target) {
        background_y_speed    = ceil((background_y_target - background_y_current) / 5);
        background_y_current += background_y_speed;
        
        if (background_y_current >= background_y_target && sign(background_y_current) == sign(background_y_target)) {
            background_y_speed   = 0;
            background_y_current = background_y_target;
        }
    }
    
    // Skip states:
    if ((room_kickoff == KICKOFF_DEFAULT || room_kickoff == KICKOFF_READY) && transition_standby < 3.7 && input_check(INP_ACCEPT, CHECK_PRESSED)) {
        transition_standby = 3.7;
        
        if (player_exists(0) != noone && room_kickoff == KICKOFF_READY) {
            with (player_exists(0)) {
                player_set_animation("stand");
            }
        }
    }
    
    switch (title_card_state) {
        // 0 - Background start:
        case 0:
            if (background_y_current >= background_y_target) {
                title_card_state = 1;
            }
            break;
        
        // 1 - Banner/zone start:
        case 1:
            // Banner start:
            if (banner_x_current < 0) {
                banner_x_speed    = ceil(abs(banner_x_current - banner_x_target) / 6);
                banner_x_current += banner_x_speed;
    
                if (banner_x_current >= 0) {
                    banner_x_speed   = 0;
                    banner_x_current = banner_x_target;
                }
            }
    
            // Zone start:
            if (zone_distance < zone_x_target) {
                zone_x_speed    = ceil(abs(zone_distance - zone_x_target) / 9);
                zone_x_current += zone_x_speed;
    
                if (zone_x_current >= zone_x_target - zone_x_start) {
                    global.time_allow = false;
                    
                    zone_x_speed      = 0;
                    zone_x_current    = -zone_x_start + zone_x_target;
                    title_card_state  = 2;
                }
            }
            break;
        
        // 2 - Room change:
        case 2:
            if (transition_timer < 1) {
                transition_timer += transition_speed;
    
                if (transition_timer >= 1) {
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
            break;
        
        // 3 - Standing by:
        case 3:
            if (transition_standby < 2) {
                transition_standby += transition_speed;
    
                if (transition_standby >= 2) {
                    transition_standby = 2;
                    title_card_state   = 4;
                }
            }
            break;
        
        // 4 - Background end:
        case 4:
            // Player kickoffs:
            if (player_exists(0) != noone) {
                // Ready kickoff:
                if (room_kickoff == KICKOFF_READY) {
                    with (player_exists(0)) {
                        if (floor(other.background_y_current) <= y + 13 - view_yview[view_current]) {
                            player_set_animation("ready");

                            if (player_exists(1) != noone) {
                                with (player_exists(1)) player_set_animation("ready");
                            }
                        }
                    }
                } else {
                    if (room_kickoff != KICKOFF_DEFAULT && room_kickoff != KICKOFF_RUN) {
                        with (player_exists(0)) input_lock = false;
                    }
                }
            }

            if (background_y_current <= background_y_target) {
                title_card_state = 5;
            }
            break;
        
        // 5 - Banner/stage end:
        case 5:
            // Banner target:
            banner_x_target = -sprite_get_width(spr_title_card_banner) - 12;
    
            // Zone target:
            zone_x_target = global.display_width + 9;
    
            if (debug == false) {
                // Kickoff standbys:
                if (player_exists(0) != noone) {
                    // Default standby:
                    if (room_kickoff == KICKOFF_DEFAULT) {
                        if (transition_standby < 3.7) transition_standby += transition_speed;
                        else transition_standby = 3.7;
                    }
    
                    with (player_exists(0)) {
                        // Animation standby:
                        if (other.room_kickoff == KICKOFF_READY && animation_current != "ready") {
                            if (other.transition_standby < 2.2) other.transition_standby += other.transition_speed;
                            else other.transition_standby = 2.2;
                        }
    
                        // Stop running:
                        if (other.room_kickoff == KICKOFF_RUN && other.room_run_end_x != -1 && x >= other.room_run_end_x) room_run_end_x = -1;
                    }
                }
            }
            
            if (debug == true || room_kickoff == KICKOFF_DEBUG || (room_kickoff == KICKOFF_DEFAULT && transition_standby == 3.7) ||
                (room_kickoff == KICKOFF_READY && transition_standby >= 2.2) || (room_kickoff == KICKOFF_RUN && room_run_end_x == -1)) {
                    title_card_state = 6;
            }
            break;
    
        // 6 - Start game:
        case 6:
            // Start game:
            game_start();
            
            // Banner end:
            if (banner_x_current > banner_x_target) {
                banner_x_speed    = ceil(abs(banner_x_current - banner_x_target) / 6);
                banner_x_current -= banner_x_speed;

                if (banner_x_current <= banner_x_target) {
                    banner_x_speed   = 0;
                    banner_x_current = banner_x_target;
                }
            }

            // Zone end:
            if (zone_distance < zone_x_target) {
                zone_x_speed    = ceil(abs(zone_distance - zone_x_target) / 9);
                zone_x_current += zone_x_speed;

                if (zone_distance >= zone_x_target - zone_x_start) {
                    zone_x_speed   = 0;
                    zone_x_current = -zone_distance + zone_x_target;
                }
            }
    
            // Title card end:
            if (banner_x_current == banner_x_target && zone_distance == zone_x_target) {
                global.time_allow = true;
                
                instance_destroy();
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Retry Transition

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_type == TRANS_RETRY) {
    // Background scroll:
    background_x_scroll += background_x_scroll_speed;

    // Retry distance:
    retry_distance = retry_x_start - retry_x_current;

    // Run kickoff:
    if (player_exists(0) != noone) {
        with (player_exists(0)) {
            if (other.retry_state >= 4 && other.room_kickoff == KICKOFF_RUN && other.room_run_end_x != -1 && global.checkpoint_x == -1 && global.checkpoint_y == -1) {
                g_speed                             = top_speed;
                input_player[INP_RIGHT, CHECK_HELD] = true;
            }
        }
    }

    // Background position:
    /*
    if (retry_state != 4) {
        if (background_y_current < background_y_target) {
            background_y_speed    = ceil(abs(background_y_current - background_y_target) / retry_steps);
            background_y_current += background_y_speed;
            
            if (background_y_current >= background_y_target) {
                background_y_speed   = 0;
                background_y_current = background_y_target;
            }
        }
    } else {
        if (background_y_current > background_y_target) {
            background_y_speed    = ceil(abs(background_y_target - background_y_current) / retry_steps);
            background_y_current -= background_y_speed;
            
            if (background_y_current <= background_y_target) {
                background_y_speed   = 0;
                background_y_current = background_y_target;
            }
        }
    }*/
    
    // Background position:
    if (background_y_current != background_y_target) {
        background_y_speed    = ceil((background_y_target - background_y_current) / retry_steps);
        background_y_current += background_y_speed;
        
        if (background_y_current >= background_y_target && sign(background_y_current) == sign(background_y_target)) {
            background_y_speed   = 0;
            background_y_current = background_y_target;
        }
    }

    // Retry position:
    if (retry_distance > retry_x_target) {
        retry_x_speed    = ceil(abs(retry_x_target - retry_distance) / 9);
        retry_x_current += retry_x_speed;
    } else {
        retry_x_speed   =  0;
        retry_x_current = -retry_x_target + retry_x_start;
    }

    // Skip states:
    if (transition_standby != 1 && retry_state <= 1 && transition_standby != 1 && input_check(INP_ACCEPT, CHECK_PRESSED)) {
        transition_standby = 1;
        retry_state        = 1;
    }
    
    switch (retry_state) {
        // 0 - Background start:
        case 0:
            // Background target:
            background_y_target = 32;
    
            if (retry_distance == retry_x_target && background_y_current == background_y_target) {
                retry_state = 1;
            }
            break;
        
        // 1 - Standing by:
        case 1:
            if (transition_standby < 1) {
                transition_standby += transition_speed;
            } else {
                if (debug == true) {
                    event_user(0);
                }
                
                if ((debug == true && input_check(INP_ACCEPT, CHECK_PRESSED)) || debug == false) {
                    if (debug == true) event_user(1);
    
                    retry_state = 2;
                }
            }
            break;
        
        // 2 - Retry end:
        case 2:
            // Background target:
            background_y_target = global.display_height / 2 + 15;
    
            // Retry target:
            retry_x_target = -retry_size - 9;
    
            if (retry_distance == retry_x_target && background_y_current == background_y_target) {
                retry_state = 3;
            }
            break;
        
        // 3 - Room change:
        case 3:
            if (transition_timer < 0.8) {
                transition_timer += transition_speed;
            } else {
                if (debug == false) room_goto(transition_room);
    
                retry_state = 4;
            }
            break;
        
        // 4 - Background end:
        case 4:
            if (transition_timer < 1) {
                transition_timer += transition_speed;
            } else {
                // Background target:
                background_y_target = -15;
    
                // Stop running:
                if (player_exists(0) != noone) {
                    with (player_exists(0)) {
                        if (x >= other.room_run_end_x && action_current != player_action_death) other.room_run_end_x = -1;
                    }
                }
    
                if (debug == true || room_kickoff != KICKOFF_RUN || (room_kickoff == KICKOFF_RUN && (room_run_end_x == -1 || (global.checkpoint_x != -1 && global.checkpoint_y != -1)))) {
                    // Start game:
                    game_start();
    
                    if (background_y_current == background_y_target) {
                        instance_destroy();
                    }
                }
        }
            break;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Ignore

pause_ignore = false;
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Open Debug Topic
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Close Debug Header
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Enable Pause

persistent         = false;
pause_ignore       = false;
global.pause_allow = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu Transition

if (transition_type == TRANS_MENU) {
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_y_current);

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
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_y_current);

    // Bar:
    draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_x_current, view_yview[view_current] + banner_y_scroll);

    // Zone:
    zone_x_start = -string_width(room_zone) - 9;

    draw_text(view_xview[view_current] + zone_x_start + zone_x_current, view_yview[view_current] + 87, room_zone);

    if (room_act != 0) draw_sprite(spr_title_card_acts, room_act, view_xview[view_current] + zone_x_start + zone_x_current + 5, view_yview[view_current] + 128);

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
    draw_sprite_tiled_horizontal(spr_transition_background, 1, view_xview[view_current] + background_x_scroll, view_yview[view_current] + background_y_current);
    draw_sprite_tiled_horizontal_yscale(spr_transition_background, 1, view_xview[view_current] - 16 - background_x_scroll - 1, view_yview[view_current] + global.display_height - background_y_current, -1);

    // Try again:
    retry_size    = string_width("Try Again");
    retry_x_start = global.display_width + retry_size + 9;

    draw_text(view_xview[view_current] + retry_x_start - retry_x_current, view_yview[view_current] + global.display_height / 2, "Try Again");

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
