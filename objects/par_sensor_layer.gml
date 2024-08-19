#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sensor Initialization

event_inherited();

// Hurtbox:
set_hurtbox(8, 8, 7, 7, 8, 8);

// Collision layer:
collision_layer = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sensor

// Exit if not in debug mode:
if (global.game_debug == false) {
    exit;
}

// Sensor:
draw_self();

// Collision:
event_inherited();
