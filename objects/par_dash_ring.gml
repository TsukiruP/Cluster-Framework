#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

event_inherited();

// Image index:
image_index = 1;

// Overlay:
with (instance_create(x, y, obj_dash_ring_overlay)) {
    sprite_index = other.sprite_index;
}
