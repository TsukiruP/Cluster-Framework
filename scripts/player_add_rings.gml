/// player_add_rings(val)
/// @desc Adds value to stage rings and refills energy.
/// @param {int} val
/// @returns {void}

var _val; _val = argument0;

stage_add_rings(_val);
with (obj_player) clock_up_energy = min(clock_up_energy + _val, clock_up_max_energy);