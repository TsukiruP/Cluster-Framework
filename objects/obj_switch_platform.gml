#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Platform Initialization

event_inherited();
collision = false;
semisolid = true;
target[0] = xstart;
target[1] = ystart;
life_time = 0;
life_speed = 0;
life_period = 1;
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
    var x_distance, y_distance;

    x_distance = xstart - target[0];
    y_distance = ystart - target[1];

    x = cosine_wave(life_time, life_period, x_distance, xstart - x_distance);
    y = cosine_wave(life_time, life_period, y_distance, ystart - y_distance);
    image_alpha = pick(time_difference < 30, 1, time_sync(time_difference, 2, 2));
    life_time += life_speed * collision;
    if (sequence_index != sequence_switch_platform) sequence_set(sequence_switch_platform);
}
else
{
    if (x != xstart) x = xstart;
    if (y != ystart) y = ystart;
    if (collision != false) collision = false;
    if (life_time != 0) life_time = 0;
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
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field target: xy
//field life_time: number
//field life_speed: number
//field life_period: number
//field switch_id: instance
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Platform

if (switch_active) draw_self_floored();
