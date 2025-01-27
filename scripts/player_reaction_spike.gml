/// player_reaction_spike(obj, interaction, side)
/* Not the wisp. */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;
side = argument2;

if (interaction & INTERACT_MUTUAL)
{
    if (side == reaction_handle.angle) player_set_damage(reaction_handle);
}
