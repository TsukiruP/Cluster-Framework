/// player_add_rings(val)
/* Adds value to stage rings and refill energy. */

stage_add_rings(argument0);
with (obj_player) clock_up_energy = min(clock_up_energy + argument0, clock_up_max_energy);
