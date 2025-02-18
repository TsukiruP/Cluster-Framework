/// game_set_save(key, value)
/// @desc Sets the value of a save key.
/// @param {string} key
/// @param {any} value
/// @returns {void}

var _key; _key = argument0;
var _value; _value = argument1;

with (ctrl_game) ds_map_set(save_map, _key, _value);
