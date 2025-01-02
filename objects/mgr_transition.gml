#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// Flags:
preview = false;
pause_ignore = false;
load_skip = false;

// Transition variables:
transition_id = TRANS_FADE;
transition_state = 0;
transition_alarm = 0;
transition_time = 0;
transition_room = room;
transition_run = -1;

// Handles:
fade_handle = noone;
player_handle = noone;

// Curtain variables:
curtain_time = 0;
curtain_duration = 20;

curtain_y = 0;
curtain_scroll = 0;
curtain_scroll_speed = 1;

// Banner variables:
banner_time = 0;
banner_duration = 20;

banner_x = 0;
banner_scroll = 0;
banner_scroll_speed = 1;

// Zone variables:
zone_time = 0;
zone_duration = 30;

zone_x = 0;
zone_width = -1;
zone_spacing = 9;

// Loading variables:
switch (game_save_get("player0"))
{
    // Sonic:
    default:
        character_index = spr_sonic_run_4;
        character_y_offset = -7;
}

character_x_current = -sprite_get_width(character_index);
character_x_target = screen_get_width() - 27;
character_x_speed = 0;
character_x_factor = 12;

character_alpha = 1;
stars_y = screen_get_height() - 16;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

// Alarm:
if (transition_alarm > 0)
{
    transition_alarm -= 1;
}

if (preview == true && transition_alarm == 0)
{
    if (transition_state == 1)
    {
        text_set_handle(id);
        text_set_subject("Press " + string_input(INP_CONFIRM) + " to end the preview.");
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

// Curtain:
if ((transition_id == TRANS_MENU && transition_state < 2) || (transition_id == TRANS_CARD && transition_state < 4) || (transition_id == TRANS_RETRY && transition_state < 5))
{
    curtain_time = approach(curtain_time, curtain_duration, 1);
}
else
{
    curtain_time = approach(curtain_time, 0, 1);
}

// Banner:
if (transition_id == TRANS_CARD && transition_state < 4 && curtain_time == curtain_duration)
{
    banner_time = approach(banner_time, banner_duration, 1);
}
else
{
    banner_time = approach(banner_time, 0, 1);
}

// Zone:
if (transition_id == TRANS_CARD && (transition_state >= 4 || curtain_time == curtain_duration) || transition_id == TRANS_RETRY)
{
    zone_time = approach(zone_time, zone_duration, 1);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Start

// Exit if the stage is paused or ID isn't correct:
if ((game_ispaused(mnu_pause) && pause_ignore == false) || (transition_id != TRANS_CARD && transition_id != TRANS_RETRY))
{
    exit;
}

if (instance_exists(stage_get_player(0)))
{
    // Run:
    if (game_room_get_start() == START_RUN && transition_state >= 4 && transition_run != -1)
    {
        // Reset run:
        if ((transition_id == TRANS_RETRY && (game_checkpoint_get_x() != -1 && game_checkpoint_get_y() != -1)) || stage_get_player(0).x >= game_room_get_run())
        {
            transition_run = -1;
        }
        else
        {
            with (obj_player)
            {
                x_speed = top_speed;
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
/// Curtain

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

if (transition_id != TRANS_RETRY)
{
    curtain_y = lerp(-15, screen_get_height() + 15, smoothstep(0, curtain_duration, curtain_time));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

// Exit if ID isn't correct:
if (transition_id != TRANS_FADE)
{
    exit;
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (!instance_exists(fade_handle))
        {
            fade_handle = fade_create();
            fade_handle.persistent = true;
        }

        if (fade_handle.fade_alpha >= 1)
        {
            stage_set_time_allow(false);
            transition_state = 1;
            transition_alarm = 60;
        }
        break;
    
    // 1 - Change room:
    case 1:
        if (transition_alarm == 0)
        {
            if (preview == false)
            {
                game_checkpoint_set(true);
                room_goto(transition_room);
                transition_state = 2;
            }
            else
            {
                event_user(0);
            }
        }
        break;
    
    // 2 - Reverse:
    case 2:
        fade_reverse(fade_handle);
        transition_state = 3;
        break;

    // 3 - End:
    case 3:
        stage_start();

        if (!instance_exists(fade_handle))
        {
            instance_destroy();
        }
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

// Exit if the stage is paused or ID isn't correct:
if ((game_ispaused(mnu_pause) && pause_ignore == false) || transition_id != TRANS_MENU)
{
    exit;
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (curtain_y == screen_get_height() + 15)
        {
            transition_state = 1;
            transition_alarm = 60;
        }
        break;
    
    // 1 - Change room:
    case 1:
        if (transition_alarm == 0)
        {
            if (preview == false)
            {
                game_checkpoint_set(true);
                room_goto(transition_room);
                transition_state = 2;
            }
            else
            {
                event_user(0);
            }
        }
        break;
    
    // 2 - End:
    case 2:
        if (curtain_y == -15)
        {
            instance_destroy();
        }
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card

// Exit if the stage is paused or ID isn't correct:
if ((game_ispaused(mnu_pause) && pause_ignore == false) || transition_id != TRANS_CARD)
{
    exit;
}

// Skip:
if (game_room_get_start() == START_READY && transition_state >= 4 && instance_exists(stage_get_player(0)))
{
    if (input_get_check(INP_ANY, CHECK_PRESSED) && !input_get_check(INP_START, CHECK_PRESSED))
    {
        transition_state = 5;

        // Skip ready animation:
        if (stage_get_player(0).animation_current == "ready")
        {
            with (obj_player)
            {
                player_set_animation("stand");
            }
        }
    }
}

// Banner:
banner_x = lerp(-sprite_get_width(spr_title_card_banner), 0, smoothstep(0, banner_duration, banner_time));
banner_scroll += banner_scroll_speed;
banner_scroll = banner_scroll mod sprite_get_height(spr_title_card_banner);

// Zone:
if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = string_width(game_room_get_zone(transition_room)) + zone_spacing;
}

if (transition_state >= 4)
{
    zone_x = ease_in_out_back(zone_time, 40, screen_get_width() + zone_spacing, zone_duration);
}
else
{
    zone_x = ease_in_out_back(zone_time, -zone_width, 40 + zone_width, zone_duration);
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (banner_time == banner_duration && zone_time == zone_duration)
        {
            stage_set_time_allow(false);
            transition_state = 1;
            transition_alarm = 30;
        }
        break;
    
    // 1 - Wait:
    case 1:
        if (transition_alarm == 0)
        {
            if (preview == false)
            {
                transition_state = 2;
                transition_alarm = 60;
                
                // Skip:
                if (load_skip == true)
                {
                    transition_alarm = 0;
                }
            }
            else
            {
                event_user(0);
            }
        }
        break;
    
    // 2 - Loading:
    case 2:
        if (transition_alarm == 0)
        {
            game_checkpoint_set(true);
            room_goto(transition_room);
            transition_state = 3;
            transition_alarm = 90;
        }
        break;
    
    // 3 - Reset:
    case 3:
        if (transition_alarm == 0)
        {
            transition_state = 4;
            zone_time = 0;
        }
        break;
    
    // 4 - Reverse:
    case 4:
        if ((game_room_get_start() != START_RUN || transition_run != -1) && preview == false && instance_exists(stage_get_player(0)))
        {
            // Ready:
            if (game_room_get_start() == START_READY)
            {
                // Time it with the curtain:
                if (curtain_y <= floor(stage_get_player(0).y + stage_get_player(0).y_radius - view_yview[view_current]))
                {
                    with (obj_player)
                    {
                        if (animation_current != "ready" && animation_previous != "ready")
                        {
                            player_set_animation("ready");
                        }
                    }
                }
            }

            // Unlock player:
            else if (game_room_get_start() != START_IDLE && game_room_get_start() != START_RUN)
            {
                with (obj_player)
                {
                    input_lock = false;
                }
            }

            // Move to next state:
            if (game_room_get_start() == START_IDLE || (game_room_get_start() == START_READY && stage_get_player(0).animation_previous == "ready"))
            {
                transition_state = 5;
            }
        }
        else
        {
            transition_state = 5;
        }
        break;

    // 5 - End:
    case 5:
        stage_start();
        
        // Destroy:
        if (curtain_time == 0 && banner_time == 0)
        {
            stage_set_time_allow(true);
            instance_destroy();
        }
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Retry

// Exit if the stage is paused or ID isn't correct:
if ((game_ispaused(mnu_pause) && pause_ignore == false) || transition_id != TRANS_RETRY)
{
    exit;
}

// Skip:
if (transition_state < 2 && instance_exists(stage_get_player(0)) && input_get_check(INP_ANY, CHECK_PRESSED))
{
    transition_state = 2;
}

// Scroll:
curtain_scroll += curtain_scroll_speed;
curtain_scroll = curtain_scroll mod sprite_get_width(spr_transition_curtain);

// Curtain:
if (transition_state >= 3 && transition_state <= 4)
{
    curtain_y = lerp(32, screen_get_height() / 2 + 15, smoothstep(0, curtain_duration, curtain_time));
}
else if (transition_state >= 5)
{
    curtain_y = lerp(-15, screen_get_height() / 2 + 15, smoothstep(0, curtain_duration, curtain_time));
}
else
{
    curtain_y = lerp(-15, 32, smoothstep(0, curtain_duration, curtain_time));
}

// Zone:
if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = floor((string_width("Try Again") + zone_spacing) / 2);
}

if (transition_state > 2)
{
    zone_x = screen_get_width() - ease_in_out_back(zone_time, screen_get_width() / 2, screen_get_width() + zone_width, zone_duration);
}
else
{
    zone_x = screen_get_width() - ease_in_out_back(zone_time, -zone_width, screen_get_width() / 2 + zone_width, zone_duration);
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (curtain_time == curtain_duration)
        {
            transition_state = 1;
            transition_alarm = 60;
        }
        break;
    
    // 1 - Standing by:
    case 1:
        if (transition_alarm == 0)
        {
            if (preview == false)
            {
                transition_state = 2;
            }
            else
            {
                event_user(0);
            }
        }
        break;
    
    // 2 - Reset progress:
    case 2:
        transition_state = 3;
        curtain_time = 0;
        zone_time = 0;
        break;
    
    // 3 - Close:
    case 3:
        if (curtain_time == curtain_duration && zone_time == zone_duration)
        {
            transition_state = 4;
            transition_alarm = 30;
        }
        break;
    
    // 4 - Room change:
    case 4:
        if (transition_alarm == 0)
        {
            if (preview == false)
            {
                room_goto(transition_room);
            }
            
            transition_state = 5;
        }
        break;
    
    // 5 - Reverse:
    case 5:
        if (curtain_time == 0)
        {
            if (game_room_get_start() != START_RUN || (game_room_get_start() == START_RUN && transition_run == -1) || preview == true)
            {
                transition_state = 6;
            }
        }
        break;
    
    // 6 - End:
    case 6:
        stage_start();
        instance_destroy();
        break;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room Initialization

// Pause ignore:
pause_ignore = false;

// Play music:
audio_bgm_play(game_room_get_music());

// Create background:
if (game_room_get_background() != -1)
{
    instance_create(0, 0, game_room_get_background());
}

// Create water:
if (game_room_get_water() != -1)
{
    instance_create(0, game_room_get_water(), obj_water_surface);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Preview

if (!text_get_clear() && text_get_handle() == id && input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    text_set_clear();
    transition_state = pick(transition_id, 2, 2, 3, 2);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

// Exit if ID isn't correct:
if (transition_id != TRANS_MENU)
{
    exit;
}

// Curtain:
draw_sprite(spr_transition_curtain, 0, view_xview[view_current], view_yview[view_current] + curtain_y);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card

// Exit if ID isn't correct:
if (transition_id != TRANS_CARD)
{
    exit;
}

// Curtain:
draw_sprite(spr_transition_curtain, 0, view_xview[view_current], view_yview[view_current] + curtain_y);

// Banner:
draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_x, view_yview[view_current] + banner_scroll);

// Zone:
draw_set_font(global.font_title_card);
draw_set_valign(fa_bottom);
draw_text(view_xview[view_current] + zone_x, view_yview[view_current] + 126, game_room_get_zone(transition_room));

// Act:
if (game_room_get_act(transition_room) != 0)
{
    draw_sprite(spr_title_card_acts, game_room_get_act(transition_room), view_xview[view_current] + zone_x + 5, view_yview[view_current] + 128);
}

// Loading:
if (load_skip == false && transition_state == 2)
{
    draw_sprite(spr_title_card_load, transition_alarm div 22, view_xview[view_current] + 4, view_yview[view_current] + screen_get_height() - 12);
}

/*
// Character:
draw_sprite_ext(spr_title_card_stars, sync_rate(transition_time, 4, sprite_get_number(spr_title_card_stars)), view_xview[view_current] + character_x, view_yview[view_current] + character_y, 1, 1, 0, c_white, character_alpha);

d3d_set_fog(true, c_white, 0, 0);
draw_sprite_ext(character_index, sync_rate(transition_time, 4, sprite_get_number(character_index)), view_xview[view_current] + character_x, view_yview[view_current] + character_y + character_offset, 1, 1, 0, c_white, character_alpha);
d3d_set_fog(false, c_black, 0, 0);
*/

// Reset:
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Retry

// Exit if ID isn't correct:
if (transition_id != TRANS_RETRY)
{
    exit;
}

// Curtain:
draw_sprite_tiled_horizontal(spr_transition_curtain, 1, view_xview[view_current] + curtain_scroll, view_yview[view_current] + curtain_y);
draw_sprite_tiled_horizontal_yscale(spr_transition_curtain, 1, view_xview[view_current] - 16 - curtain_scroll - 1, view_yview[view_current] + screen_get_height() - curtain_y, -1);

// Zone:
draw_set_font(global.font_title_card);
draw_set2(fa_center, fa_middle);
draw_text(view_xview[view_current] + zone_x, view_yview[view_current] + screen_get_height() / 2, "Try Again");

// Reset:
draw_reset();
