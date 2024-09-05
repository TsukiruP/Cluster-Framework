#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

// Image speed:
image_speed = 0;

// Timeline:
ctl_initialize();

// Effect variables:
e_speed = 0;
angle   = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

// Execute timeline:
if (ctl_index != noone) {
    ctl_update();
    script_execute(ctl_index);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

x += e_speed *  dcos(angle);
y += e_speed * -dsin(angle);
