/// game_save_write_skill(character)
/// @desc Writes a skill map to the save map.
/// @param {int} character
/// @returns {void}

var _character; _character = argument0;

with (ctrl_game)
{
    var skill_map; skill_map = game_save_get_skill_map(_character);
    var skill_key; skill_key = pick(_character, "sonic_skill");

    game_set_save(skill_key, ds_map_write(skill_map));
}