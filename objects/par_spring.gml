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
ctl_initialize(ctl_spring);

// Spring variables:
spring_strength    = 10;
spring_angle       = 0;
spring_direction_x = 0;
spring_direction_y = 0;
spring_active      = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the game is paused:
if (game_paused(ctrl_pause)) exit;

if (spring_active == true) {
    script_execute(ctl_index);
} else {
    timeline_set(ctl_index);
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
