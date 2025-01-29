/// player_reaction_rail(obj, interaction, side)
/* Playing SA2 is habit forming, don't turn off! */

var reaction_handle, interaction, side;

reaction_handle = argument0;
interaction = argument1;
side = argument2;

if ((interaction & INTERACT_SOLID) && side == ANGLE_DOWN)
{
    player_set_state(player_state_rail);
    if (reaction_handle != ground_id) player_set_ground(reaction_handle);
}
