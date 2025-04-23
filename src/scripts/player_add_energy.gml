/// player_add_energy(val)
/// @desc Adds the value to energy.
/// @param {int} val
/// @returns {void}

var _val; _val = argument0;

energy = min(energy + _val, max_energy);
