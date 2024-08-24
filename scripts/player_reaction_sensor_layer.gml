/// player_reaction_sensor_layer(obj, collision)
// Like an onion.

var layer_handle, collision;

layer_handle = argument0;
collision    = argument1;

// Set layer:
if (collision && COLL_HURT_RADIUS) {
    collision_layer = layer_handle.collision_layer;
}
