/// player_reaction_spike(obj, hitbox, side)
/* Not the wisp. */

var reaction_id, hitbox, side;

reaction_id = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_COLLISION) && side == reaction_id.angle) player_set_damage(reaction_id);
