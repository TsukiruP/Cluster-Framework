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
sequence_array[0, false] = sequence_switch_spring_vertical_lock;
sequence_array[0, true] = sequence_switch_spring_vertical_unlock;
sequence_array[1, false] = sequence_switch_spring_horizontal_lock;
sequence_array[1, true] = sequence_switch_spring_horizontal_unlock;
sequence_array[2, false] = sequence_switch_spring_diagonal_lock;
sequence_array[2, true] = sequence_switch_spring_diagonal_unlock;
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
    other.switch_active = !collision;
    other.switch_time = target_time;
}

var time_difference, spring_index;

time_difference = switch_time - game_get_time();
switch_active = (switch_active && time_difference);
spring_index = sequence_array[variant, switch_active];

if (switch_active)
{
    if (sequence_index == sequence_array[variant, false])
    {
        active = false;
        sequence_set(spring_index);
    }
}
else if (sequence_index != spring_index) sequence_set(spring_index);

if (sequence_index == spring_index || (active && sequence_index != spring_index))
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

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_switch_spring_vertical", "spr_switch_spring_horizontal", "spr_switch_spring_diagonal"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_switch_spring_horizontal;
        angle = ANGLE_RIGHT;
        sequence_init(sequence_switch_spring_horizontal);
        break;

    case 2:
        sprite_index = spr_switch_spring_diagonal;
        angle = ANGLE_RIGHT_UP;
        sequence_init(sequence_switch_spring_diagonal);
        break;

    default:
        sprite_index = spr_switch_spring_vertical;
        angle = ANGLE_UP;
        sequence_init(sequence_switch_spring_vertical);
}

if (sign(image_xscale) == -1) angle = 180 - angle;
if (sign(image_yscale) == -1) angle = 360 - angle;
