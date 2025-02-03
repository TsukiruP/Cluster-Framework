/// player_reaction_waterfall(obj, hitbox)
/* Really stupid commitment to game accuracy. */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION) waterfall_draw = true;
