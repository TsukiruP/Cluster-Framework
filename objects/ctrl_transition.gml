#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

preview = false;
pause_ignore = false;
load_skip = false;

transition_id = TRANS_FADE;
transition_state = 0;
transition_alarm = 0;
transition_time = 0;
transition_room = room;
transition_run = -1;

fade_handle = noone;
player_handle = noone;

curtain_time = 0;
curtain_max_time = 20;
curtain_y = 0;
curtain_scroll = 0;
curtain_scroll_speed = 1;

banner_time = 0;
banner_max_time = 20;
banner_x = 0;
banner_scroll = 0;
banner_scroll_speed = 1;

zone_time = 0;
zone_max_time = 30;
zone_width = -1;
zone_spacing = 9;
zone_x = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

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

if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

if ((transition_id == TRANS_MENU && transition_state < 2) || (transition_id == TRANS_CARD && transition_state < 4) || (transition_id == TRANS_RETRY && transition_state < 5))
{
    curtain_time = approach(curtain_time, curtain_max_time, 1);
}
else
{
    curtain_time = approach(curtain_time, 0, 1);
}

if (transition_id == TRANS_CARD && transition_state < 4 && curtain_time == curtain_max_time)
{
    banner_time = approach(banner_time, banner_max_time, 1);
}
else
{
    banner_time = approach(banner_time, 0, 1);
}

if ((transition_id == TRANS_CARD && ((transition_state < 4 && curtain_time == curtain_max_time) || (transition_state >= 4))) || transition_id == TRANS_RETRY)
{
    zone_time = approach(zone_time, zone_max_time, 1);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run

if ((game_ispaused(mnu_pause) && pause_ignore == false) || (transition_id != TRANS_CARD && transition_id != TRANS_RETRY) || !instance_exists(stage_get_player(0)))
{
    exit;
}

if (((transition_id == TRANS_CARD && transition_state >= 4) || (transition_id == TRANS_RETRY && transition_state >= 5)) && game_get_room_start() == START_RUN && transition_run != -1)
{
    if ((transition_id == TRANS_RETRY && game_checkpoint_isset()) || stage_get_player(0).x >= game_get_room_run())
    {
        transition_run = -1;
    }
    else
    {
        with (obj_player)
        {
            x_speed = top_speed;
            player_set_state(player_state_run);
            player_set_input(INP_RIGHT, CHECK_HELD, true);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Curtain

if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

if (transition_id != TRANS_RETRY)
{
    curtain_y = lerp(-15, screen_get_height() + 15, smoothstep(0, curtain_max_time, curtain_time));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

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
                game_set_checkpoint(true);
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
                game_set_checkpoint(true);
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

if ((game_ispaused(mnu_pause) && pause_ignore == false) || transition_id != TRANS_CARD)
{
    exit;
}

if (game_get_room_start() == START_STANDBY && transition_state >= 4 && instance_exists(stage_get_player(0)))
{
    if (input_get_check(INP_ANY, CHECK_PRESSED) && !input_get_check(INP_START, CHECK_PRESSED))
    {
        transition_state = 5;

        if (stage_get_player(0).animation_current == "standby")
        {
            with (obj_player)
            {
                player_set_state(player_state_idle);
            }
        }
    }
}

banner_x = lerp(-sprite_get_width(spr_title_card_banner), 0, smoothstep(0, banner_max_time, banner_time));
banner_scroll += banner_scroll_speed;
banner_scroll = banner_scroll mod sprite_get_height(spr_title_card_banner);

if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = string_width(game_get_room_zone(transition_room)) + zone_spacing;
}

if (transition_state >= 4)
{
    zone_x = ease_in_out_back(zone_time, 40, screen_get_width() + zone_spacing, zone_max_time);
}
else
{
    zone_x = ease_in_out_back(zone_time, -zone_width, 40 + zone_width, zone_max_time);
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (banner_time == banner_max_time && zone_time == zone_max_time)
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
            game_set_checkpoint(true);
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
        var transition_next;

        transition_next = (preview == true || game_get_room_start() == START_IDLE || !instance_exists(stage_get_player(0)));

        if (instance_exists(stage_get_player(0)))
        {
            with (stage_get_player(0))
            {
                switch (game_get_room_start())
                {
                    case START_STANDBY:
                        if (other.curtain_y <= floor(y - y_radius) - view_yview[view_current] && animation_previous != "standby")
                        {
                            player_set_animation("standby");
                        }

                        if (animation_previous == "standby")
                        {
                            transition_next = true;
                        }
                        break;

                    case START_RUN:
                        if (other.transition_run == -1)
                        {
                            transition_next = true;
                        }
                        break;
                }
            }
        }

        if (transition_next == true)
        {
            transition_state = 5;
        }
        break;

    // 5 - End:
    case 5:
        stage_start();

        if (curtain_time == 0 && banner_time == 0 && zone_time == zone_max_time)
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

if ((game_ispaused(mnu_pause) && pause_ignore == false) || transition_id != TRANS_RETRY)
{
    exit;
}

if (transition_state < 2 && instance_exists(stage_get_player(0)) && input_get_check(INP_ANY, CHECK_PRESSED))
{
    transition_state = 2;
}

curtain_scroll += curtain_scroll_speed;
curtain_scroll = curtain_scroll mod sprite_get_width(spr_transition_curtain);

if (transition_state >= 3 && transition_state <= 4)
{
    curtain_y = lerp(32, screen_get_height() / 2 + 15, smoothstep(0, curtain_max_time, curtain_time));
}
else if (transition_state >= 5)
{
    curtain_y = lerp(-15, screen_get_height() / 2 + 15, smoothstep(0, curtain_max_time, curtain_time));
}
else
{
    curtain_y = lerp(-15, 32, smoothstep(0, curtain_max_time, curtain_time));
}

if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = floor((string_width("Try Again") + zone_spacing) / 2);
}

if (transition_state > 2)
{
    zone_x = screen_get_width() - ease_in_out_back(zone_time, screen_get_width() / 2, screen_get_width() + zone_width, zone_max_time);
}
else
{
    zone_x = screen_get_width() - ease_in_out_back(zone_time, -zone_width, screen_get_width() / 2 + zone_width, zone_max_time);
}

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (curtain_time == curtain_max_time)
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
        if (curtain_time == curtain_max_time && zone_time == zone_max_time)
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
            if (game_get_room_start() != START_RUN || (game_get_room_start() == START_RUN && transition_run == -1) || preview == true)
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

pause_ignore = false;
audio_play_bgm(game_get_room_music());

if (game_get_room_background() != -1)
{
    instance_create(0, 0, game_get_room_background());
}

if (game_get_room_water() != -1)
{
    instance_create(0, game_get_room_water(), obj_water_surface);
}

if (transition_id != TRANS_RETRY && instance_exists(stage_get_player(0)))
{
    game_set_save("stage", room);
    game_save_auto();
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
draw_text(view_xview[view_current] + zone_x, view_yview[view_current] + 126, game_get_room_zone(transition_room));

// Act:
if (game_get_room_act(transition_room) != 0)
{
    draw_sprite(spr_title_card_acts, game_get_room_act(transition_room), view_xview[view_current] + zone_x + 5, view_yview[view_current] + 128);
}

// Loading:
if (load_skip == false && transition_state == 2)
{
    draw_sprite(spr_title_card_load, transition_alarm div 22, view_xview[view_current] + 4, view_yview[view_current] + screen_get_height() - 12);
}

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Retry

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

draw_reset();
