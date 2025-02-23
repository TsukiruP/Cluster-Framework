/// game_set_config(key, val)
/// @desc Sets the value of a config key.
/// @param {string} key
/// @param {any} val
/// @returns {void}

var _key; _key = argument0;
var _val; _val = argument1;

with (ctrl_game) ds_map_set(config_map, _key, _val);