/// player_reaction_layer_sensor(obj, hitbox)
/* Like an onion. */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION) // && point_in_rectangle(x, y, reaction_id.bbox_left, reaction_id.bbox_top, reaction_id.bbox_right, reaction_id.bbox_bottom))
{
    layer = reaction_id.layer;
}
