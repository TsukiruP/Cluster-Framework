/// player_reaction_layer_sensor(obj, hitbox)
/* Like an onion. */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION) // && point_in_rectangle(x, y, reaction_handle.bbox_left, reaction_handle.bbox_top, reaction_handle.bbox_right, reaction_handle.bbox_bottom))
{
    layer = reaction_handle.layer;
}
