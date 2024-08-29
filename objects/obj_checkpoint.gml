#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Initialization

event_inherited();

// Timeline initialization:
ctl_initialize(ctl_checkpoint_inactive);

// Hurtbox:
set_hurtbox(13, 22, 14, 16);

// Reaction:
reaction_index = player_reaction_checkpoint;

// Checkpoint variables:
checkpoint_active = false;

// Activate:
if (global.checkpoint_x == x && global.checkpoint_y == y) {
    global.game_time  = global.checkpoint_time;
    checkpoint_active = true;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

if (checkpoint_active == true) {
    if (ctl_index != ctl_checkpoint_active) {
        timeline_set(ctl_checkpoint_active);
    }
} else {
    if (ctl_index != ctl_checkpoint_inactive) {
        timeline_set(ctl_checkpoint_inactive);
    }
}

// Execute timeline:
if (ctl_index != noone) {
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
