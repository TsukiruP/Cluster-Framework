/// save_get(key)
/// @desc Returns the value corresponding to the save key.
/// @param {string} key
/// @returns {any}

var _key; _key = argument0;

with (ctrl_save) return ds_map_get(save_map, _key);