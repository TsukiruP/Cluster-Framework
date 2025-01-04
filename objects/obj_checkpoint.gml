#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Initialization

event_inherited();

// Timeline:
ctl_init(ctl_checkpoint_inactive);

// Hurtbox:
hurtbox_set(13, 22, 14, 16);

// Reaction:
reaction_index = player_reaction_checkpoint;

// Active:
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

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

if (active == true)
{
    if (ctl_index != ctl_checkpoint_active)
    {
        timeline_set(ctl_checkpoint_active);
    }
}
else
{
    if (ctl_index != ctl_checkpoint_inactive)
    {
        timeline_set(ctl_checkpoint_inactive);
    }
}

// Execute timeline:
if (ctl_index != noone)
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

// Checkpoint:
draw_self();

// Collision:
event_inherited();
