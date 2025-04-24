/// config_get(key)
/// @desc Returns the value corresponding to the config key.
/// @param {string} key
/// @returns {any}

var _key; _key = argument0;

with (ctrl_game) return ds_map_get(config_map, _key);
