#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

event_inherited();
hurtbox_set(20, 19, 20, 4);
hitbox_set(8, 18, 7, 4);
sequence_init(sequence_spinner);
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

event_inherited();

sequence_speed = game_get_speed();

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
