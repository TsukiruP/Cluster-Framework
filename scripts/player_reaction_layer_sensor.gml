/// player_reaction_layer_sensor(obj, hitbox)
/* Like an onion. */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION) // && point_in_rectangle(x, y, reaction_inst.bbox_left, reaction_inst.bbox_top, reaction_inst.bbox_right, reaction_inst.bbox_bottom))
{
    layer = reaction_inst.layer;
}
