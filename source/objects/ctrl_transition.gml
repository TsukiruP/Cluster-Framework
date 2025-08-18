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

transition_index = TRANS_FADE;
transition_state = 0;
transition_alarm = 0;
transition_room = room;
transition_run = -1;

curtain_max_frame = 20;
curtain_frame = 0;
curtain_y = 0;
curtain_scroll = 0;
curtain_scroll_speed = 1;

banner_max_frame = 20;
banner_frame = 0;
banner_x = 0;
banner_scroll = 0;
banner_scroll_speed = 1;

zone_max_frame = 30;
zone_frame = 0;
zone_width = -1;
zone_padding = 0;
zone_x = 0;

fade_inst = noone;
player_inst = noone;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused(mnu_pause) && !pause_ignore) exit;

if (transition_alarm > 0) transition_alarm -= 1;

if (text_get_inst() != id && preview && transition_state == 1 && transition_alarm == 0)
{
    text_set_inst(id);
    text_set_subject(string_input(INP_CONFIRM) + " - End Preview");
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Frames

if (game_ispaused(mnu_pause) && !pause_ignore) exit;

if ((transition_index == TRANS_MENU && transition_state < 2) || (transition_index == TRANS_CARD && transition_state < 4) || (transition_index == TRANS_RETRY && transition_state < 5)) curtain_frame = approach(curtain_frame, curtain_max_frame, 1);
else curtain_frame = approach(curtain_frame, 0, 1);

if (transition_index == TRANS_CARD && transition_state < 4 && curtain_frame == curtain_max_frame) banner_frame = approach(banner_frame, banner_max_frame, 1);
else banner_frame = approach(banner_frame, 0, 1);

if ((transition_index == TRANS_CARD && ((transition_state < 4 && curtain_frame == curtain_max_frame) || (transition_state > 3))) || transition_index == TRANS_RETRY) zone_frame = approach(zone_frame, zone_max_frame, 1);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run

if ((game_ispaused(mnu_pause) && !pause_ignore) || (transition_index != TRANS_CARD && transition_index != TRANS_RETRY) || !instance_exists(stage_get_player(0))) exit;

if (((transition_index == TRANS_CARD && transition_state > 3) || (transition_index == TRANS_RETRY && transition_state > 4)) && game_room_get_start() == START_RUN && transition_run != -1)
{
    if ((transition_index == TRANS_RETRY && game_checkpoint_isset()) || stage_get_player(0).x >= game_room_get_run()) transition_run = -1;
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

if (game_ispaused(mnu_pause) && !pause_ignore) exit;

if (transition_index != TRANS_RETRY) curtain_y = lerp(-15, screen_get_height() + 15, smoothstep(0, curtain_max_frame, curtain_frame));
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

if (transition_index != TRANS_FADE) exit;

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (!instance_exists(fade_inst))
        {
            fade_inst = fade_create();
            fade_inst.persistent = true;
        }

        if (fade_inst.fade_alpha >= 1)
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
            if (!preview)
            {
                game_checkpoint_set(true);
                room_goto(transition_room);
                transition_state = 2;
            }
            else event_user(0);
        }
        break;

    // 2 - Reverse:
    case 2:
        fade_reverse(fade_inst);
        transition_state = 3;
        break;

    // 3 - End:
    case 3:
        stage_start();
        if (!instance_exists(fade_inst)) instance_destroy();
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

if ((game_ispaused(mnu_pause) && !pause_ignore) || transition_index != TRANS_MENU) exit;

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
            if (!preview)
            {
                game_checkpoint_set(true);
                room_goto(transition_room);
                transition_state = 2;
            }
            else event_user(0);
        }
        break;

    // 2 - End:
    case 2:
        if (curtain_y == -15) instance_destroy();
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card

if ((game_ispaused(mnu_pause) && !pause_ignore) || transition_index != TRANS_CARD) exit;

if (game_room_get_start() == START_STANDBY && transition_state > 3 && instance_exists(stage_get_player(0)))
{
    if (input_get_check(INP_ANY, CHECK_PRESSED) && !input_get_check(INP_START, CHECK_PRESSED))
    {
        transition_state = 5;

        if (stage_get_player(0).animation_current == "standby")
        {
            with (obj_player) player_set_state(player_state_idle);
        }
    }
}

banner_x = lerp(-sprite_get_width(spr_title_card_banner), 0, smoothstep(0, banner_max_frame, banner_frame));
banner_scroll += banner_scroll_speed;
banner_scroll = banner_scroll mod sprite_get_height(spr_title_card_banner);

if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = string_width(game_room_get_zone(transition_room)) + zone_padding;
}

if (transition_state > 3) zone_x = ease_in_out_back(zone_frame, 40, screen_get_width() + zone_padding, zone_max_frame);
else zone_x = ease_in_out_back(zone_frame, -zone_width, 40 + zone_padding, zone_max_frame);

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (banner_frame == banner_max_frame && zone_frame == zone_max_frame)
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
            if (!preview)
            {
                transition_state = 2;
                transition_alarm = 60;

                if (load_skip)
                {
                    transition_alarm = 0;
                }
            }
            else event_user(0);
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
            zone_frame = 0;
        }
        break;

    // 4 - Reverse:
    case 4:
        var transition_next; transition_next = (preview || game_room_get_start() == START_IDLE || !instance_exists(obj_player));

        switch (game_room_get_start())
        {
            case START_STANDBY:
                with (obj_player)
                {
                    if (other.curtain_y <= floor(y - y_radius) - view_yview[view_current] && animation_previous != "standby") player_set_animation("standby");
                    if (player_index == 0 && animation_previous == "standby") transition_next = true;
                }
                break;

            case START_RUN:
                if (transition_run == -1) transition_next = true;
                break;
        }

        if (transition_next) transition_state = 5;
        break;

    // 5 - End:
    case 5:
        stage_start();

        if (curtain_frame == 0 && banner_frame == 0 && zone_frame == zone_max_frame)
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

if ((game_ispaused(mnu_pause) && !pause_ignore) || transition_index != TRANS_RETRY) exit;

if (transition_state < 2 && instance_exists(stage_get_player(0)) && input_get_check(INP_ANY, CHECK_PRESSED)) transition_state = 2;

curtain_scroll += curtain_scroll_speed;
curtain_scroll = curtain_scroll mod sprite_get_width(spr_transition_curtain);

if (transition_state > 2 && transition_state < 5) curtain_y = lerp(32, screen_get_height() / 2 + 15, smoothstep(0, curtain_max_frame, curtain_frame));
else if (transition_state > 4) curtain_y = lerp(-15, screen_get_height() / 2 + 15, smoothstep(0, curtain_max_frame, curtain_frame));
else curtain_y = lerp(-15, 32, smoothstep(0, curtain_max_frame, curtain_frame));

if (zone_width == -1)
{
    draw_set_font(global.font_title_card);
    zone_width = floor((string_width("Try Again") + zone_padding) / 2);
}

if (transition_state > 2) zone_x = screen_get_width() - ease_in_out_back(zone_frame, screen_get_width() / 2, screen_get_width() + zone_width, zone_max_frame);
else zone_x = screen_get_width() - ease_in_out_back(zone_frame, -zone_width, screen_get_width() / 2 + zone_width, zone_max_frame);

switch (transition_state)
{
    // 0 - Start:
    case 0:
        if (curtain_frame == curtain_max_frame)
        {
            transition_state = 1;
            transition_alarm = 60;
        }
        break;

    // 1 - Standing by:
    case 1:
        if (transition_alarm == 0)
        {
            if (!preview) transition_state = 2;
            else event_user(0);
        }
        break;

    // 2 - Reset progress:
    case 2:
        transition_state = 3;
        curtain_frame = 0;
        zone_frame = 0;
        break;

    // 3 - Close:
    case 3:
        if (curtain_frame == curtain_max_frame && zone_frame == zone_max_frame)
        {
            transition_state = 4;
            transition_alarm = 30;
        }
        break;

    // 4 - Room change:
    case 4:
        if (transition_alarm == 0)
        {
            if (!preview) room_goto(transition_room);
            transition_state = 5;
        }
        break;

    // 5 - Reverse:
    case 5:
        if (curtain_frame == 0)
        {
            if (game_room_get_start() != START_RUN || (game_room_get_start() == START_RUN && transition_run == -1) || preview) transition_state = 6;
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
audio_play_bgm(game_room_get_music());
if (object_exists(game_room_get_background())) instance_create_single(0, 0, game_room_get_background());

if (game_room_get_water() != -1)
{
    with (instance_create(0, game_room_get_water(), obj_water_mask))
    {
        image_xscale = room_width div sprite_width;
        image_yscale = (room_height - y) div sprite_height;
    }
}

if (transition_index != TRANS_RETRY && instance_exists(stage_get_player(0)))
{
    save_set("stage", room);
    save_auto();
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Preview

if (!text_get_clear())
{
    if (text_get_inst() == id && input_get_check(INP_CONFIRM, CHECK_PRESSED)) text_set_clear();
}
else
{
    transition_state = pick(transition_index, 2, 2, 3, 2);
    transition_alarm = 0;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

if (transition_index != TRANS_MENU) exit;

// Curtain:
draw_sprite(spr_transition_curtain, 0, view_xview[view_current], view_yview[view_current] + curtain_y);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card

if (transition_index != TRANS_CARD) exit;

// Curtain:
draw_sprite(spr_transition_curtain, 0, view_xview[view_current], view_yview[view_current] + curtain_y);

// Banner:
draw_sprite_tiled_extra(spr_title_card_banner, 0, view_xview[view_current] + banner_x, view_yview[view_current] + banner_scroll, 1, 1, 0, c_white, 1, 1, 0);

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
if (!load_skip && transition_state == 2)
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

if (transition_index != TRANS_RETRY) exit;

// Curtain:
draw_sprite_tiled_extra(spr_transition_curtain, 1, view_xview[view_current] + curtain_scroll, view_yview[view_current] + curtain_y - sprite_get_height(spr_transition_curtain), 1, 1, 0, c_white, 1, 0, 1);
draw_sprite_tiled_extra(spr_transition_curtain, 1, view_xview[view_current] - 16 - curtain_scroll - 1, view_yview[view_current] + screen_get_height() - curtain_y + sprite_get_height(spr_transition_curtain), 1, -1, 0, c_white, 1, 0, 1);

// Zone:
draw_set_font(global.font_title_card);
draw_set2(fa_center, fa_middle);
draw_text(view_xview[view_current] + zone_x, view_yview[view_current] + screen_get_height() / 2, "Try Again");
draw_reset();
