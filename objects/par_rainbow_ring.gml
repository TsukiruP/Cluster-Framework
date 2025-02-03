#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rainbow Ring Initialization

event_inherited();

// Rainbow score:
rainbow_score = true;

// Overlay:
with (instance_create(x, y, obj_rainbow_ring_overlay)) {
    sprite_index   = other.sprite_index;
    rainbow_id = other.id;
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

image_index = ((floor(global.object_time) div 4) mod 6) + 1;
