#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

image_speed = 0;
ctl_init();
x_speed = 0;
y_speed = 0;
angle = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause))
{
    exit;
}

if (script_exists(ctl_index))
{
    ctl_update();
    script_execute(ctl_index);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (game_ispaused(mnu_pause))
{
    exit;
}

x += x_speed * dcos(angle);
y += y_speed * -dsin(angle);
