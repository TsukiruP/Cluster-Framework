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
switch_inst = noone;
switch_active = false;
switch_time = 0;
sequence_array[0, false] = seq_switch_spring_vertical_lock;
sequence_array[0, true] = seq_switch_spring_vertical_unlock;
sequence_array[1, false] = seq_switch_spring_horizontal_lock;
sequence_array[1, true] = seq_switch_spring_horizontal_unlock;
sequence_array[2, false] = seq_switch_spring_diagonal_lock;
sequence_array[2, true] = seq_switch_spring_diagonal_unlock;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

with (switch_inst)
{
    other.switch_active = !collision;
    other.switch_time = target_time;
}

var time_difference; time_difference = switch_time - game_get_time();

switch_active = (switch_active && time_difference);

var spring_sequence; spring_sequence = sequence_array[variant, switch_active];

if (switch_active)
{
    if (sequence_index == sequence_array[variant, false])
    {
        active = false;
        sequence_set(spring_sequence);
    }
}
else if (sequence_index != spring_sequence) sequence_set(spring_sequence);

if (sequence_index == spring_sequence || (active && sequence_index != spring_sequence))
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

//field switch_inst: instance

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
        sequence_init(seq_switch_spring_horizontal);
        break;

    case 2:
        sprite_index = spr_switch_spring_diagonal;
        angle = ANGLE_RIGHT_UP;
        sequence_init(seq_switch_spring_diagonal);
        break;

    default:
        sprite_index = spr_switch_spring_vertical;
        angle = ANGLE_UP;
        sequence_init(seq_switch_spring_vertical);
}

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);
with (switch_inst) image_offset = 5;
