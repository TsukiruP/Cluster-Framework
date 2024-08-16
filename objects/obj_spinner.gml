#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization
/*
event_inherited();

// Timeline initialization:
ctl_initialize(ctl_spinner);

// Main:
main_left   = 20;
main_right  = 20;
main_top    = 19;
main_bottom = 4;

// Hitbox:
hitbox_left   = 8;
hitbox_right  = 7;
hitbox_top    = 18;
hitbox_bottom = 4;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
/*
// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

event_inherited();

// Timeline speed:
ctl_speed = global.game_speed;

// Execute timeline:
if (ctl_index != noone) {
    ctl_update();
    script_execute(ctl_index);
}
