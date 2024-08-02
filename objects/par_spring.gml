#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();

// Depth:
depth = 10;

// Image speed:
image_speed = 0;

// Timeline initialization:
if (!object_is_ancestor(self.object_index, par_dash_ring)) {
    ctl_initialize(ctl_spring);
}

// Spring variables:
spring_strength = 8;
spring_angle    = 0;
spring_active   = false;
spring_sfx      = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// SFX

if (spring_sfx > 0) {
    spring_sfx -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Exit if the game is paused or the object is a dash/rainbow ring:
if (game_ispaused(ctrl_pause)|| object_is_ancestor(self.object_index, par_dash_ring)) {
    exit;
}

// Execute script:
if (spring_active == true) {
    ctl_update();
    script_execute(ctl_index);
}

// Reset frame:
if (spring_active == false) {
    timeline_set(ctl_spring);
    image_index = 0;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spring

// Spring:
draw_self();

// Collision:
event_inherited();
