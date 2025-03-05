#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gun Hunter Initialization

event_inherited();
explosion_y_offset = 24;
border_left = 0;
border_right = 0;
hunter_range = 128;
hunter_alarm = 0;
hunter_sfx = noone;
scan_allow = false;
scan_count = 0;
sequence_init(seq_gun_hunter_move);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop Sound

audio_stop_sfx(hunter_sfx);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

event_inherited();

sequence_speed = game_get_speed();

if (sequence_index == seq_gun_hunter_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right)
    {
        scan_allow = choose(false, true);
        sequence_set(seq_gun_hunter_turn);
    }
    else if (scan_allow)
    {
        var scan_x; scan_x = irandom_range(xstart - border_left, xstart + border_right);

        if (floor(x) == scan_x) sequence_set(seq_gun_hunter_scan);
    }
}
else if (sequence_index == seq_gun_hunter_scan)
{
    if (scan_count >= 2)
    {
        scan_allow = false;
        scan_count = 0;
        sequence_set(seq_gun_hunter_move);
    }
}

if (sequence_index == seq_gun_hunter_move || sequence_index == seq_gun_hunter_scan)
{
    var player_inst; player_inst = noone;

    if (hunter_alarm > 0) hunter_alarm -= 1;
    else player_inst = enemy_get_player(hunter_range, true);

    if (hunter_alarm == 0 && instance_exists(player_inst))
    {
        hunter_alarm = 60;
        sequence_set(seq_gun_hunter_shoot);
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

if (sequence_index == seq_gun_hunter_shoot)
{
    if (sequence_position(12)) hunter_sfx = audio_play_sfx("snd_gun_hunter_aim");

    if (sequence_position(44) || sequence_position(48) || sequence_position(52))
    {
        audio_stop_sfx(hunter_sfx);
        audio_play_sfx("snd_gun_hunter_shoot", true);
        with (bullet_create(x + (42 * image_xscale), y - (8 * image_yscale), seq_gun_hunter_bullet, 2 * image_xscale, 0)) image_xscale = other.image_xscale;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field border_left: number
//field border_right: number

/*preview
draw_set_color(c_red);
draw_rectangle(floor(x) - Field("border_left", 0), floor(y) - 8, floor(x) + Field("border_right", 0), floor(y) + 15, true);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Gun Hunter

draw_self_floored();
draw_enemy_border();
