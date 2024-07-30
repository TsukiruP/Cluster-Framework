#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Initialization

event_inherited();

// Image speed:
image_speed = 0;

// Timeline initialization:
ctl_initialize(ctl_checkpoint_inactive);

// Checkpoint variables:
checkpoint_active = false;
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

// Size:
event_inherited();
