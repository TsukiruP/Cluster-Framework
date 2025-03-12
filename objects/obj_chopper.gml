#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Chopper Initialization

event_inherited();
border_left = 0;
border_right = 0;
hitbox_set_hurtbox(17, 8, 15, 14);
hitbox_set_attackbox(9, 6, 15, 12);
sequence_init(seq_chopper_move);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (sequence_index == seq_chopper_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right) sequence_set(seq_chopper_move_turn);
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
/// Draw Chopper

draw_self_floored();
draw_enemy_border();
