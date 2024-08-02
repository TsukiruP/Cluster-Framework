#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

event_inherited();

// Depth:
depth = 10;

// Image index:
image_index = 1;

// Rainbow variables:
rainbow_ring  = false;
rainbow_index = spr_rainbow_ring_left;
rainbow_score = true;

// Overlay:
with (instance_create(x, y, obj_dash_ring_overlay)) {
    overlay_handle = other.id;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

if (rainbow_ring == true) {
    sprite_index = rainbow_index;
    image_index  = sync_rate(global.object_time, 4, 6) + 1;
}
