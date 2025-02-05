#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Platform Initialization

event_inherited();
collision = false;
switch_id = noone;
switch_active = false;
switch_time = 0;
sequence_init();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Active

if (game_ispaused(mnu_pause)) exit;

with (switch_id)
{
    other.switch_active = active;
    other.switch_time = target_time;
}

var time_difference;

time_difference = switch_time - game_get_time();

if (switch_active && time_difference)
{
    image_alpha = pick(time_difference < 30, 1, time_sync(time_difference, 2, 2));

    if (sequence_index != sequence_switch_platform)
    {
        life_time = 0;
        sequence_set(sequence_switch_platform);
    }

    if (collision) event_inherited();
}
else
{
    if (collision != false) collision = false;
    if (script_exists(sequence_index)) sequence_set(noone);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
else
{
    if (x != xstart) x = xstart;
    if (y != ystart) y = ystart;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

event_inherited();

//field switch_id: instance
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Initialization

with (switch_id) image_offset = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Platform

if (switch_active) draw_self_floored();
