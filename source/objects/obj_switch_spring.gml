#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Spring Initialization

event_inherited();
collision = false;
active = false;
switch_inst = noone;
switch_active = false;
switch_time = 0;
spring_index[0] = seq_switch_spring_vert_lock;
spring_index[1] = seq_switch_spring_vert_unlock;
sequence_init();
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

var spring_sequence; spring_sequence = spring_index[switch_active];

if (switch_active)
{
    if (sequence_index == spring_index[false])
    {
        active = false;
        sequence_set(spring_sequence);
    }
}
else if (sequence_index != spring_sequence) sequence_set(spring_sequence);

if (sequence_index == spring_sequence || (active && sequence_index != spring_sequence)) sequence_execute();
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
sprite_index = Sprite(pick(preview_angle / 45, "spr_switch_spring_hor", "spr_switch_spring_diag", "spr_switch_spring_vert"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Spring Initialization

switch (angle)
{
    case ANGLE_RIGHT:
        sprite_index = spr_switch_spring_hor;
        spring_index[0] = seq_switch_spring_hor_lock;
        spring_index[1] = seq_switch_spring_hor_unlock;
        break;

    case ANGLE_RIGHT_UP:
        sprite_index = spr_switch_spring_diag;
        spring_index[0] = seq_switch_spring_diag_lock;
        spring_index[1] = seq_switch_spring_diag_unlock;
        break;

    default:
        sprite_index = spr_switch_spring_vert;
        spring_index[0] = seq_switch_spring_vert_lock;
        spring_index[1] = seq_switch_spring_vert_unlock;
}

with (switch_inst) image_offset = 5;
