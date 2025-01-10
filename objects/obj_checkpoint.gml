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

ctl_init(ctl_checkpoint_inactive);
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
    if (ctl_index != ctl_checkpoint_active)
    {
        ctl_set(ctl_checkpoint_active);
    }
}
else
{
    if (ctl_index != ctl_checkpoint_inactive)
    {
        ctl_set(ctl_checkpoint_inactive);
    }
}

if (script_exists(ctl_index))
{
    ctl_update();
    script_execute(ctl_index);
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
