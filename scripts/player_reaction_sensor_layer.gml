/// player_reaction_sensor_layer(obj, collision)
// Like an onion.

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Set layer:
if (collision && COLL_HURT_RADIUS)
{
    layer = reaction_handle.layer;
}
