#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// Image speed:
image_speed = 0;

// Flags:
debug        = false;
pause_ignore = false;

// Transition variables:
transition_type  = TRANS_FADE;
transition_state = 0;
transition_alarm = 0;
transition_timer = 0;
transition_room  = room;

// Fade handle:
fade_handle = noone;

// Player handle:
player_handle = noone;

// Background variables:
background_y_current      = -15;
background_y_target       =  global.display_height + 15;
background_y_speed        =  0;
background_y_factor       =  5;

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

// Loading variables:
switch (player_get_character(0)) {
    // Sonic:
    default:
        character_index    =  spr_sonic_run_4;
        character_y_offset = -7;
}

character_x_current = -sprite_get_width(character_index);
character_x_target  =  global.display_width - 27;
character_x_speed   =  0;
character_x_factor  =  12;

character_alpha     =  1;
stars_y             =  global.display_height - 16;

// Retry variables:
draw_set_font(global.font_title_card);

retry_text      = "Try Again";
retry_width     = string_width(retry_text);
retry_x_current = global.display_width + retry_width + zone_x_factor;
retry_x_target  = (global.display_width / 2) - 3;
retry_x_speed   = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm & Timer

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause) && pause_ignore == false) {
    exit;
}

// Alarm:
if (transition_alarm > 0) {
    transition_alarm -= 1;

    if (transition_alarm <= 0) {
        if ((transition_type != TRANS_CARD && transition_state == 1) || (transition_type == TRANS_CARD && transition_state == 2)) {
            // Open debug topic:
            if (debug == true) {
                topic_set_message("Debug");
            }

            // Close debug topic:
            if (debug == false || (debug == true && input_get_check(INP_ACCEPT, CHECK_PRESSED))) {
                if (debug == true) {
                    with (ctrl_text) {
                        text_clear = true;
                    }
                }

                // Retry has its own room_goto call:
                if (transition_type != TRANS_RETRY) {
                    checkpoint_set(true);
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
}

// Timer:
if (transition_type == TRANS_CARD) {
    transition_timer += 1;
} else {
    transition_timer = 0;
}

// Alpha:
if (transition_type == TRANS_CARD) {
    if (transition_state >= 3 && character_alpha > 0) {
        character_alpha -= 0.05;
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Background

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause) && pause_ignore == false) {
    exit;
}

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
    var background_y_factor, background_x_distance;

    // Background factor:
    if (transition_type == TRANS_RETRY) {
        background_y_factor = 15;
    } else {
        background_y_factor = 5;
    }

    // Background distance:
    background_x_distance = background_y_target - background_y_current;

    background_y_speed    = ceil(abs(background_x_distance) / background_y_factor);
    background_y_current += background_y_speed * sign(background_x_distance);

    if (background_y_current == background_y_target) {
        background_y_speed = 0;

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
/// Player Start

// Exit if the stage is paused:
if ((game_ispaused(ctrl_pause) && pause_ignore == false) || (transition_type != TRANS_CARD && transition_type != TRANS_RETRY)) {
    exit;
}

if (instance_exists(player_get_instance(0))) {
    // Hide HUD:
    if ((room_start == START_RUN || (room_start == START_READY && transition_type == TRANS_CARD)) && transition_state == 3) {
        if (instance_exists(ctrl_hud)) {
            with (ctrl_hud) {
                hud_hide      = true;
                hud_x_current = hud_x_target;
            }
        }
    }

    // Run start:
    if (room_start == START_RUN && room_run_target != -1 && transition_state >= 4) {
        // Reset target:
        if ((transition_type == TRANS_RETRY && (global.checkpoint_x != -1 && global.checkpoint_y != -1)) || player_get_instance(0).x >= room_run_target) {
            room_run_target = -1;
        }

        // Run:
        else {
            with (obj_player) {
                x_speed                             = top_speed;
                input_player[INP_RIGHT, CHECK_HELD] = true;
            }
        }
    }
}
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
            // Start stage:
            stage_start();

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

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause) && pause_ignore == false) {
    exit;
}

if (transition_type == TRANS_CARD) {
    // Banner scroll:
    banner_y_scroll += banner_y_scroll_speed;
    banner_y_scroll  = banner_y_scroll mod (sprite_get_height(spr_title_card_banner));

    // Skip:
    if (room_start == START_READY && transition_state >= 4 && transition_state != 6 && instance_exists(player_get_instance(0))) {
        if (input_get_check(INP_ANY, CHECK_PRESSED) && !input_get_check(INP_START, CHECK_PRESSED)) {
            transition_state = 5;

            // Skip ready animation:
            if (player_get_instance(0).animation_current == "ready") {
                with (obj_player) {
                    player_set_animation("stand");
                }
            }
        }
    }

    // Banner & zone target:
    if (transition_state >= 4) {
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
        }
    }

    // Character position:
    if (character_x_current != character_x_target) {
        character_x_speed    = ceil((character_x_target - character_x_current) / character_x_factor);
        character_x_current += character_x_speed;

        if (character_x_current >= character_x_target) {
            character_x_speed   = 0;
            character_x_current = character_x_target;

            transition_alarm = 45;
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

        // 1 - Room change:
        case 1:
            // Move to room change:
            if (transition_alarm == 0 && banner_x_current == banner_x_target && zone_x_current == zone_x_target && character_x_current == character_x_target) {
                global.time_allow = false;

                transition_state  = 2;
                transition_alarm  = 120;
            }
            break;

        // 3 - Standing by:
        case 3:
            if (transition_alarm <= 0) {
                transition_state = 4;
            }
            break;

        // 4 - Opener start:
        case 4:
            if (debug == false && (room_start != START_RUN || room_run_target != -1) && instance_exists(player_get_instance(0)) ) {
                // Ready:
                if (room_start == START_READY) {
                    // Time it with the background:
                    if (background_y_current <= floor(player_get_instance(0).y + player_get_instance(0).y_radius - view_yview[view_current])) {
                        with (obj_player) {
                            if (animation_current != "ready" && animation_previous != "ready") {
                                player_set_animation("ready");
                            }
                        }
                    }
                }

                // Free player:
                else if (room_start != START_IDLE && room_start != START_RUN) {
                    with (obj_player) {
                        input_lock = false;
                    }
                }

                // Move to next state:
                if (room_start == START_IDLE || (room_start == START_READY && player_get_instance(0).animation_previous == "ready")) {
                    transition_state = 5;
                }
            }

            // Skip opener end, since there's no player:
            else {
                transition_state = 5;
            }
            break;

        // 5 - Title card end:
        case 5:
            // Start stage:
            stage_start();

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

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause) && pause_ignore == false) {
    exit;
}

if (transition_type == TRANS_RETRY) {
    // Background scroll:
    background_x_scroll += background_x_scroll_speed;
    background_x_scroll  = background_x_scroll mod sprite_get_width(spr_transition_background);

    // Skip:
    if (transition_state < 2 && instance_exists(player_get_instance(0)) && input_get_check(INP_ANY, CHECK_PRESSED)) {
        transition_state = 2;
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

        // 4 - Opener end:
        case 4:
            if (debug == true || room_start != START_RUN || (room_start == START_RUN && room_run_target == -1)) {
                transition_state = 5;
            }
            break;

        // 5 - Retry end:
        case 5:
            // Start stage:
            stage_start();

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
if (sound_kind_get_volume(3) != global.audio_bgm / 100) {
    sound_kind_volume(3, global.audio_bgm / 100);
}

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
if (room_background != -1) {
    instance_create(0, 0, room_background);
}

// Create water:
if (room_water_level != -1) {
    instance_create(0, room_water_level, obj_water_surface);
}
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
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card Transition

if (transition_type == TRANS_CARD) {
    var transition_character;

    // Font:
    draw_set_font(global.font_title_card);

    // Background:
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_y_current);

    // Bar:
    draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_x_current, view_yview[view_current] + banner_y_scroll);

    // Zone:
    draw_set_valign(fa_bottom);
    draw_text(view_xview[view_current] + zone_x_current, view_yview[view_current] + 126, room_zone);

    // Act:
    if (room_act != 0) {
        draw_sprite(spr_title_card_acts, room_act, view_xview[view_current] + zone_x_current + 5, view_yview[view_current] + 128);
    }

    // Loading:
    if (transition_state == 2) {
        draw_sprite(spr_title_card_load, 0, view_xview[view_current] + 4, view_yview[view_current] + global.display_height - 12);
    }

    // Stars:
    draw_sprite_ext(spr_title_card_stars, sync_rate(transition_timer, 4, sprite_get_number(spr_title_card_stars)), view_xview[view_current] + character_x_current, view_yview[view_current] + stars_y, 1, 1, 0, c_white, character_alpha);

    // Character:
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(character_index, sync_rate(transition_timer, 4, sprite_get_number(character_index)), view_xview[view_current] + character_x_current, view_yview[view_current] + stars_y + character_y_offset, 1, 1, 0, c_white, character_alpha);
    d3d_set_fog(false, c_black, 0, 0);

    // Reset:
    draw_reset();
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
    draw_set2(fa_center, fa_middle);

    // Background:
    draw_sprite_tiled_horizontal(spr_transition_background, 1, view_xview[view_current] + background_x_scroll, view_yview[view_current] + background_y_current);
    draw_sprite_tiled_horizontal_yscale(spr_transition_background, 1, view_xview[view_current] - 16 - background_x_scroll - 1, view_yview[view_current] + global.display_height - background_y_current, -1);

    // Try again:
    draw_text(view_xview[view_current] + retry_x_current, view_yview[view_current] + global.display_height / 2, retry_text);

    // Reset:
    draw_reset();
}
