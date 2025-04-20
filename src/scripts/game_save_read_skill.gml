/// game_save_read_skill(character)
/// @desc Reads a skill map from the save map.
/// @param {int} character
/// @returns {void}

var _character; _character = argument0;

with (ctrl_game)
{
    var skill_map; skill_map = game_save_get_skill_map(_character);
    var skill_key; skill_key = game_save_get(pick(_character, "sonic_skill"));

    ds_map_read(skill_map, skill_key);
}
