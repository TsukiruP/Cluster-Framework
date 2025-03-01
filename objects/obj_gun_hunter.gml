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
scan_allow = false;
scan_count = 0;
hitbox_set_hurtbox(16, 10, 22, 22);
hitbox_set_attackbox(8, 10, 7, 17);
sequence_init(sequence_gun_hunter_move);
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

if (sequence_index == sequence_gun_hunter_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right)
    {
        scan_allow = choose(false, true);
        sequence_set(sequence_gun_hunter_turn);
    }
    else if (scan_allow)
    {
        var scan_x; scan_x = irandom_range(xstart - border_left, xstart + border_right);

        if (floor(x) == scan_x) sequence_set(sequence_gun_hunter_scan);
    }
}
else if (sequence_index == sequence_gun_hunter_scan)
{
    if (scan_count >= 3)
    {
        scan_allow = false;
        scan_count = 0;
        sequence_set(sequence_gun_hunter_move);
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
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
