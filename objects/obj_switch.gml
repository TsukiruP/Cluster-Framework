#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Initialization

event_inherited();
reaction_index = player_reaction_switch;
active = false;
duration = 0;
target_time = 0;
on_index = sequence_switch_vertical_on;
off_index = sequence_switch_vertical_off;
hitbox_set_hurtbox(9, 6, 9, 7, 0, 8);
sequence_init(sequence_switch_vertical_on);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (game_get_time() >= target_time && active && sequence_index != off_index) sequence_set(off_index);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

if (active)
{
    sequence_update();
    script_execute(sequence_index);
}

if (image_index != 0 && !active)
{
    image_index = 0;
    sequence_set(on_index);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field duration: number
