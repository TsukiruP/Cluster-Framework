/// player_reaction_sensor_layer(obj, interaction)
/* Like an onion. */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if (interaction & INTERACT_MUTUAL) // && point_in_rectangle(x, y, reaction_handle.bbox_left, reaction_handle.bbox_top, reaction_handle.bbox_right, reaction_handle.bbox_bottom))
{
    layer = reaction_handle.layer;
}
