/// player_reaction_waterfall(obj, collision)
//

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Activate hint:
if (collision & COLL_HURT_RADIUS)
{
    waterfall_draw = true;
}
