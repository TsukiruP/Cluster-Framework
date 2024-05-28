#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();

// Image speed:
image_speed = 0;

// Timeline initialization:
if (!object_is_ancestor(self.object_index, par_dash_ring) || !object_is_ancestor(self.object_index, par_rainbow_ring)) {
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

// Don't bother if the game is paused or the object is a dash or rainbow ring:
if (game_paused(ctrl_pause)|| object_is_ancestor(self.object_index, par_dash_ring) || object_is_ancestor(self.object_index, par_rainbow_ring)) exit;

if (spring_active == true) {
    script_execute(ctl_index);
}

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

// Size:
event_inherited();
