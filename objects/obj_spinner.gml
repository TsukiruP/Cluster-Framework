#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

event_inherited();

// Timeline:
ctl_initialize(ctl_spinner);

// Hurtbox:
set_hurtbox(20, 19, 20, 4);

// Hitbox:
set_hitbox(8, 18, 7, 4);
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

event_inherited();

// Timeline speed:
ctl_speed = global.game_speed;

// Execute timeline:
if (ctl_index != noone) {
    ctl_update();
    script_execute(ctl_index);
}
