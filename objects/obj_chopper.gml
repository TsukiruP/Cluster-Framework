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
sequence_init(sequence_chopper_move);
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

if (sequence_index == sequence_chopper_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right) sequence_set(sequence_chopper_move_turn);
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
draw_rectangle(floor(x) - Field("border_left", 0), floor(y), floor(x) + Field("border_right", 0), floor(y) + 96 * image_yscale, true);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Buzzer

draw_self_floored();
if (game_get_debug())
{
    draw_set_color(c_red);
    draw_rectangle(floor(xstart) - border_left, floor(ystart), floor(xstart) + border_right, floor(ystart) + 96 * image_yscale, true);
    draw_reset();
}
