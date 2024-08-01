/// player_handle_layer()
// Like an onion.

var sensor_handle;

// Nearest sensor:
sensor_handle = instance_nearest(x, y, par_sensor_layer);

// Exit if there's no nearest handle:
if (sensor_handle == noone) {
    exit;
}

// Change layer:
if (player_collision_prop(sensor_handle, SIDE_MAIN)) {
    layer = sensor_handle.layer;
}
