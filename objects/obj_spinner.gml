#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

event_inherited();

// Timeline initialization:
ctl_initialize(ctl_spinner);
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

// Execute timeline:
if (ctl_index != noone) {
    script_execute(ctl_index);
}
