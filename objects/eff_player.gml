#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Effect Initialization

// Image speed:
image_speed = 0;

// Player handle:
player_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attach to Player

if (instance_exists(player_handle)) {
    x = floor(player_handle.x);
    y = floor(player_handle.y);
} else {
    instance_destroy();
}
