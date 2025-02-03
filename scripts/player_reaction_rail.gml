/// player_reaction_rail(obj, hitbox, side)
/* Playing SA2 is habit forming, don't turn off! */

var reaction_handle, hitbox, side;

reaction_handle = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_SOLID) && side == ANGLE_DOWN)
{
    player_set_state(player_state_rail);
    if (reaction_handle != ground_id) player_set_ground(reaction_handle);
}
