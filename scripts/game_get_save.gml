/// game_get_save(key)
/// @desc Returns the value corresponding to the save key.
/// @param {string} key
/// @returns {any}

var _key; _key = argument0;

with (ctrl_game) return ds_map_get(save_map, _key);