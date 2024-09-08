#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Overlay Initialization

// Image speed:
image_speed = 0;

// Overlay handle:
overlay_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Set sprite:
if (instance_exists(overlay_handle)) {
    if (overlay_handle.rainbow_ring == true) {
        sprite_index = overlay_handle.rainbow_index;
        image_index  = overlay_handle.image_index + 6;
    } else {
        sprite_index = overlay_handle.sprite_index;
        image_index  = 2;
    }
}
