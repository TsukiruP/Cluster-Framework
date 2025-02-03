/// player_reaction_rail(obj, hitbox, side)
/* Playing SA2 is habit forming, don't turn off! */

var reaction_id, hitbox, side;

reaction_id = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_SOLID) && side == ANGLE_UP)
{
    player_set_state(player_state_rail);
    if (reaction_id != ground_id) player_set_ground(reaction_id);
}
