#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Initialization

event_inherited();
reaction_index = player_reaction_checkpoint;
active = (game_get_checkpoint_x() == x && game_get_checkpoint_y() == y);
hitbox_set_hurtbox(13, 22, 14, 16);
sequence_init();
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
    if (sequence_index != sequence_checkpoint_active) sequence_set(sequence_checkpoint_active);
}
else if (sequence_index != sequence_checkpoint_inactive) sequence_set(sequence_checkpoint_inactive);

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
