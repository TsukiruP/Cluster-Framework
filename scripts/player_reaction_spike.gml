/// player_reaction_spike(obj, hitbox, side)
/* Not the wisp. */

var reaction_handle, hitbox, side;

reaction_handle = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_COLLISION) && side == reaction_handle.angle) player_set_damage(reaction_handle);
