#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Initialization

event_inherited();

hurtbox_set(13, 22, 14, 16);
reaction_index = player_reaction_checkpoint;

sequence_init(sequence_checkpoint_inactive);
active = false;

if (game_get_checkpoint_x() == x && game_get_checkpoint_y() == y)
{
    active = true;
}
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

if (active == true)
{
    if (sequence_index != sequence_checkpoint_active)
    {
        sequence_set(sequence_checkpoint_active);
    }
}
else
{
    if (sequence_index != sequence_checkpoint_inactive)
    {
        sequence_set(sequence_checkpoint_inactive);
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Checkpoint

draw_self();
event_inherited();
