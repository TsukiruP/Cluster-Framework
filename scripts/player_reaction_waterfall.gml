/// player_reaction_waterfall(obj, collision)
/* Really stupid commitment to game accuracy. */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    waterfall_draw = true;
}
