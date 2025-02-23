/// player_reaction_spike(obj, hitbox, side)
/* Not the wisp. */

var reaction_inst, hitbox, side;

reaction_inst = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_COLLISION) && side == reaction_inst.angle) player_set_damage(reaction_inst);
