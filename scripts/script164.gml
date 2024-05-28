/// player_handle_layer()
// Like an onion.

var low_handle, high_handle, switch_handle;

// Nearest low sensor:
low_handle = instance_nearest(x, y, obj_sensor_layer_low);

if (low_handle == noone) exit;

// Layer Low:
if (player_collision_prop(ring_handle, SIDE_MAIN) != 0) {

}
