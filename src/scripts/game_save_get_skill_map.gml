/// save_get_skill_map(character)
/// @desc Returns a skill map.
/// @param {int} character
/// @returns {ds_map}

var _character; _character = argument0;

with (ctrl_game) return pick(_character, sonic_map);
