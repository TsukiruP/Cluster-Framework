#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
image_index = 5;
collision = false;
active = false;
switch_id = noone;
switch_active = false;
switch_time = 0;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

with (switch_id)
{
    other.switch_active = active;
    other.switch_time = target_time;
}

var time_difference;

time_difference = switch_time - game_get_time();
switch_active = (switch_active && time_difference);

if (switch_active)
{
    if (sequence_index == sequence_switch_spring_vertical_lock) sequence_set(sequence_switch_spring_vertical_unlock);
}
else
{
    if (sequence_index != sequence_switch_spring_vertical_lock) sequence_set(sequence_switch_spring_vertical_lock);
}

if (sequence_index != sequence_switch_spring_vertical || (active && sequence_index == sequence_switch_spring_vertical))
{
    if (script_exists(sequence_index))
    {
        sequence_update();
        script_execute(sequence_index);
    }
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
/// Spring Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_spring_horizontal;
        angle = ANGLE_RIGHT;
        hitbox_set_hurtbox(16, 5, 4, 5);
        sequence_init(sequence_spring_horizontal);
        break;

    case 2:
        sprite_index = spr_spring_diagonal;
        angle = ANGLE_RIGHT_UP;
        hitbox_set_hurtbox(6, 2, 4, 8);
        sequence_init(sequence_spring_diagonal);
        break;

    default:
        sprite_index = spr_switch_spring_vertical;
        angle = ANGLE_UP;
        hitbox_set_hurtbox(7, 0, 7, 12, 0, 3);
        sequence_init(sequence_switch_spring_vertical);
}

if (sign(image_xscale) == -1) angle = 180 - angle;
if (sign(image_yscale) == -1) angle = 360 - angle;
