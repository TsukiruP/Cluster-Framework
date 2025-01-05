/// player_reaction_sensor_layer(obj, collision)
// Like an onion.

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Set layer:
if (collision && COLL_HURT_RADIUS and point_in_rectangle(x, y, reaction_handle.bbox_left, reaction_handle.bbox_top, reaction_handle.bbox_right, reaction_handle.bbox_bottom))
{
    layer = reaction_handle.layer;
}
