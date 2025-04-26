#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gun Hunter Initialization

event_inherited();
explosion_y_offset = 24;
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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused()) exit;

if ((sequence_index == seq_gun_hunter_move || sequence_index == seq_gun_hunter_scan) && hunter_alarm > 0) hunter_alarm = roundto_step(hunter_alarm, -sequence_speed);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

// Move:
if (sequence_index == seq_gun_hunter_move)
{
    x += sequence_speed * image_xscale;

    if (enemy_get_border_hor())
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

// Scan:
else if (sequence_index == seq_gun_hunter_scan)
{
    if (scan_count >= 2)
    {
        scan_allow = false;
        scan_count = 0;
        sequence_set(seq_gun_hunter_move);
    }
}

// Initiate shoot:
if ((sequence_index == seq_gun_hunter_move || sequence_index == seq_gun_hunter_scan) && hunter_alarm == 0)
{
    var player_inst; player_inst = enemy_get_player_front(hunter_range, true);

    if (instance_exists(player_inst))
    {
        hunter_alarm = 60;
        sequence_set(seq_gun_hunter_shoot);
    }
}

sequence_execute();

// Create bullet:
if (sequence_index == seq_gun_hunter_shoot)
{
    if (sequence_position(12)) hunter_sfx = audio_play_sfx("snd_gun_hunter_aim");

    if (sequence_position(44) || sequence_position(48) || sequence_position(52))
    {
        bullet_create(x + (42 * image_xscale), y - (8 * image_yscale), seq_gun_hunter_bullet, 5 * image_xscale, 0);
        audio_stop_sfx(hunter_sfx);
        audio_play_sfx("snd_gun_hunter_shoot", true);
    }
}
