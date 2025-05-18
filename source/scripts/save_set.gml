/// save_set(key, val)
/// @desc Sets the value of a save key.
/// @param {string} key
/// @param {any} val
/// @returns {void}

var _key; _key = argument0;
var _val; _val = argument1;

with (ctrl_save) ds_map_set(save_map, _key, _val);
