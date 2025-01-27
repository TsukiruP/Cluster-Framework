/// player_reaction_waterfall(obj, interaction)
/* Really stupid commitment to game accuracy. */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if (interaction & INTERACT_MUTUAL) waterfall_draw = true;
