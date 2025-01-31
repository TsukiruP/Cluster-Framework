/// player_reaction_waterfall(obj, hitbox)
/* Really stupid commitment to game accuracy. */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION) waterfall_draw = true;
