#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Platform Initialization

event_inherited();
collision = false;
switch_inst = noone;
switch_active = false;
switch_time = 0;
sequence_init(seq_switch_platform);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

switch_exists_ext();

var time_difference; time_difference = switch_time - game_get_time();

switch_active = (switch_active && time_difference);

if (switch_active)
{
    sequence_execute();
    image_alpha = pick(time_difference < 30, 1, mod_time(time_difference, 2, 2));
    if (collision) event_inherited();
}
else
{
    life_time = 0;
    sequence_set(seq_switch_platform);
    if (x != xstart) x = xstart;
    if (y != ystart) y = ystart;
    if (collision != false) collision = false;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

event_inherited();

//field switch_inst: instance
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Platform Initialization

with (switch_inst) image_offset = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Platform

if (switch_active) draw_self_floored();
