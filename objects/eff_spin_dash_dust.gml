#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spin Dash Effect Initialization

image_speed   = 0;
player_handle = noone;
timeline_set(tml_spin_dash_dust);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attach to Player

if (instance_exists(player_handle)) {
    if (player_handle.action_state == ACTION_SPIN_DASH) {
        x = floor(player_handle.x);
        y = floor(player_handle.y);
    } else {
        instance_destroy();
    }
} else {
    instance_destroy();
}
