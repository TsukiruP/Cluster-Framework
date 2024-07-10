#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// Image speed:
image_speed = 0;

// Transition variables:
transition_type    = TRANS_FADE;
transition_state   = 0;
transition_alarm   = 0;

transition_timer   = 0;
transition_standby = 0;
transition_speed   = 0.02;

transition_room    = room;

// State variables:
debug            = false;
fade_state       = 0;
menu_state       = 0;
title_card_state = 0;
retry_state      = 0;

pause_ignore     = false;

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
banner_x_factor       =  6;

banner_y_scroll       =  0;
banner_y_scroll_speed =  1;

// Zone variables:
zone_x_current = 0;
zone_x_target  = 40;
zone_x_speed   = 0;
zone_x_factor  = 9;

// Retry variables:
draw_set_font(global.font_title_card);

retry_text = "Try Again";
retry_width = string_width(retry_text);

retry_x_current = global.display_width + retry_width + zone_x_factor;
retry_x_target  = (global.display_width / 2) - 3;
retry_x_speed   = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_alarm > 0) {
    transition_alarm -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Background

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

// Background target - bottom of screen:
if ((transition_type == TRANS_MENU && transition_state < 2) || (transition_type == TRANS_CARD && transition_state < 4)) {
    background_y_target = global.display_height + 15;
}

// Background target - retry letterbox:
else if (transition_type == TRANS_RETRY && (transition_state < 2 || transition_state == 4)) {
    background_y_target = 32;
}

// Background target - middle of screen:
else if (transition_type == TRANS_RETRY && (transition_state == 2 || transition_state == 3)) {
    background_y_target = global.display_height / 2 + 15;
}

// Background target - top of screen:
else {
    background_y_target = -15;
}

// Background position:
if (background_y_current != background_y_target) {
    var background_y_steps;
    
    // Background steps:
    if (transition_type == TRANS_RETRY) {
        background_y_factor = 15;
    } else {
        background_y_factor = 5;
    }
    
    background_y_speed    = ceil(abs(background_y_target - background_y_current) / background_y_factor);
    background_y_current += background_y_speed * sign(background_y_target - background_y_current);
    
    // abs(background_y_current) >= abs(background_y_target) && sign(background_y_current) == sign(background_y_target)
    
    if (background_y_current == background_y_target) {
        background_y_speed   = 0;
        background_y_current = background_y_target;
        
        // Transition behavior:
        switch (transition_type) {
            // Menu:
            case TRANS_MENU:
                // Move to change rooms:
                if (transition_state == 0) {
                    transition_state = 1;
                    transition_alarm = 60;
                }
                break;
            
            // Title card:
            case TRANS_CARD:
                if (transition_state == 0) {
                    transition_state = 1;
                }
                break;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room & Debug

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_alarm <= 0) {
    if ((transition_type != TRANS_CARD && transition_state == 1) || (transition_type == TRANS_CARD && transition_state == 2)) {
        // Open debug topic:
        if (debug == true) {
            topic_message_set("Debug");
        }
        
        // Close debug topic:
        if (debug == false || (debug == true && input_check(INP_ACCEPT, CHECK_PRESSED))) {
            if (debug == true) {
                with (ctrl_text) {
                    text_clear = true;
                }
            }
            
            // Retry has its own room_goto call:
            if (transition_type != TRANS_RETRY) {
                room_goto(transition_room);
            }
            
            transition_state += 1;
            
            // Title card calls a delay:
            if (transition_type == TRANS_CARD) {
                transition_alarm = 90;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Transition Specifc
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

if (transition_type == TRANS_FADE) {
    switch (transition_state) {
        // 0 - Start fade:
        case 0:
            if (fade_handle == noone) {
                fade_handle            = fade_create(transition_speed, 1);
                fade_handle.persistent = true;
            }

            if (fade_handle.fade_alpha >= 1) {
                global.time_allow = false;

                transition_state = 1;
                transition_alarm = 60;
            }
            break;

        // 2 - Reverse fade:
        case 2:
            fade_reverse(fade_handle);
            transition_state = 3;
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
/// Title Card

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_type == TRANS_CARD) {
    // Banner scroll:
    banner_y_scroll += banner_y_scroll_speed;

    if (player_exists(0) != noone) {
        // Run:
        if (room_kickoff == KICKOFF_RUN && room_run_end_x != -1 && transition_state >= 4) {
            if (player_exists(0).x >= room_run_end_x) {
                room_run_end_x = -1;
            } else {
                with (player_exists(0)) {
                    g_speed                             = top_speed;
                    input_player[INP_RIGHT, CHECK_HELD] = true;
                }
            }
        }
        
        // Skip:
        if ((room_kickoff == KICKOFF_DEFAULT || room_kickoff == KICKOFF_READY) && transition_state >= 4 && transition_state != 6) {
            if (input_check(INP_ANY, CHECK_PRESSED) && !input_check(INP_START, CHECK_PRESSED)) {
                transition_state = 5;
                transition_alarm = 1;
                
                // Skip ready animation:
                if (player_exists(0).animation_current == "ready") {
                    with (player_exists(0)) {
                        player_set_animation("stand");
                    }
                }
            }
        }
    } 
    
    // Banner & zone target:
    if (transition_state >= 6) {
        banner_x_target = -sprite_get_width(spr_title_card_banner) - 12;
        zone_x_target   =  global.display_width + zone_x_factor;
    } else {
        banner_x_target = 0;
        zone_x_target   = 40;
    }
    
    // Banner position:
    if (transition_state > 0 && banner_x_current != banner_x_target) {
        var banner_x_distance;
        
        // Banner distance:
        banner_x_distance = banner_x_target - banner_x_current;
        
        banner_x_speed    = ceil(abs(banner_x_distance) / banner_x_factor);
        banner_x_current += banner_x_speed * (sign(banner_x_distance));
    }
    
    // Zone position:
    if (transition_state > 0 && zone_x_current != zone_x_target) {
        zone_x_speed    = ceil((zone_x_target - zone_x_current) / zone_x_factor);
        zone_x_current += zone_x_speed;
        
        if (zone_x_current >= zone_x_target && sign(zone_x_current) == sign(zone_x_target)) {
            zone_x_speed   = 0;
            zone_x_current = zone_x_target;
            
            // Move to room change:
            if (transition_state == 1) {
                global.time_allow = false;
                
                transition_state  = 2;
                transition_alarm  = 60;
            }
        }
    }
    
    switch (transition_state) {
        // 0 - Initialize zone:
        case 0:
            // Font:
            draw_set_font(global.font_title_card);
            
            if (zone_x_current != (-string_width(room_zone) - zone_x_factor)) {
                zone_x_current = -string_width(room_zone) - zone_x_factor;
            }
            break;
        
        // 3 - Standing by:
        case 3:
            if (transition_alarm <= 0) {
                transition_state = 4;
            }
            break;
        
        // 4 - Kickoff start:
        case 4:
            if (player_exists(0) != noone && debug == false && (room_kickoff != KICKOFF_RUN || room_run_end_x != -1)) {
                // Ready:
                if (room_kickoff == KICKOFF_READY) {
                    // Time it with the background:
                    if (background_y_current <= floor(player_exists(0).y + player_exists(0).main_bottom - view_yview[view_current])) {
                        with (player_exists(0)) {
                            if (animation_current != "ready" && animation_previous != "ready") {
                                player_set_animation("ready");
                            }
                        }
                    }
                }
                
                // Free player:
                else if (room_kickoff != KICKOFF_DEFAULT && room_kickoff != KICKOFF_RUN) {
                    with (player_exists(0)) {
                        input_lock = false;
                    }
                }
                
                // Move to next state:
                if (background_y_current == background_y_target) {
                    if (room_kickoff == KICKOFF_DEFAULT || (room_kickoff == KICKOFF_READY && player_exists(0).animation_current != "ready")) {
                        transition_state = 5
                        transition_alarm = 30;
                    }
                }
            }
            
            // Skip kickoff end, since there's no player:
            else {
                transition_state = 6;
            }
            break;

        // 5 - Kickoff end:
        case 5:
            if (debug == true || ((room_kickoff == KICKOFF_DEFAULT || room_kickoff == KICKOFF_READY) && transition_alarm == 0)) {
                transition_state = 6;
            }
            break;

        // 6 - Title card end:
        case 6:
            // Start game:
            game_start();

            // Destroy:
            if (banner_x_current == banner_x_target && zone_x_current == zone_x_target) {
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
/// Retry

// Don't bother if the stage is paused:
if (game_paused(ctrl_pause) && pause_ignore == false) exit;

if (transition_type == TRANS_RETRY) {
    // Background scroll:
    background_x_scroll += background_x_scroll_speed;

    if (player_exists(0) != noone) {
        // Run:
        if (room_kickoff == KICKOFF_RUN && room_run_end_x != -1 && transition_state >= 4) {
            // Reset:
            if ((global.checkpoint_x != -1 && global.checkpoint_y != -1) || player_exists(0).x >= room_run_end_x) {
                room_run_end_x = -1;
            }
            
            // Run:
            else {
                with (player_exists(0)) {
                    g_speed                             = top_speed;
                    input_player[INP_RIGHT, CHECK_HELD] = true;
                }
            }
        }
        
        // Skip:
        if (transition_state < 2 && input_check(INP_ANY, CHECK_PRESSED)) {
            transition_state = 2;
        }
    } else {
        room_run_end_x = -1;
    }

    // Retry target:
    if (transition_state >= 2) {
        retry_x_target = -retry_width - zone_x_factor;
    } else {
        retry_x_target = (global.display_width / 2) - 3;
    }
    
    // Retry position:
    if (retry_x_current != retry_x_target) {
        retry_x_speed    = ceil(abs(retry_x_current - retry_x_target) / zone_x_factor);
        retry_x_current -= retry_x_speed;
        
        if (retry_x_current <= retry_x_target && sign(retry_x_current) == sign(retry_x_target)) {
            retry_x_speed   = 0;
            retry_x_current = retry_x_target;
        }
    }
    
    // Check text & background:
    if (background_y_current == background_y_target && retry_x_current == retry_x_target) {
        if (transition_state == 0 || transition_state == 2) {
            transition_state += 1;
            transition_alarm  = 30 + (30 * (transition_state == 0));
        }
    }
    
    switch (transition_state) {
        // 3 - Room change:
        case 3:
            if (transition_alarm <= 0) {
                if (debug == false) {
                    room_goto(transition_room);
                }
    
                transition_state = 4;
            }
            break;
        
        // 4 - Kickoff end:
        case 4:
            if (debug == true || room_kickoff != KICKOFF_RUN || (room_kickoff == KICKOFF_RUN && room_run_end_x == -1)) {
                transition_state = 5;
            }
            break;
        
        // 5 - Retry end:
        case 5:
            // Start game:
            game_start();

            if (background_y_current == background_y_target) {
                instance_destroy();
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
    draw_text(view_xview[view_current] + zone_x_current, view_yview[view_current] + 87, room_zone);

    // Act:
    if (room_act != 0) draw_sprite(spr_title_card_acts, room_act, view_xview[view_current] + zone_x_current + 5, view_yview[view_current] + 128);

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
    draw_text(view_xview[view_current] + retry_x_current, view_yview[view_current] + global.display_height / 2, retry_text);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
