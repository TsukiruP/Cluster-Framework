/// game_save_get_skill(character, skill)
/// @desc Returns the value corresponding to the skill key.
/// @param {int} character
/// @param {string} skill
/// @returns {int | bool}

var _character; _character = argument0;
var _skill; _skill = argument1;

with (ctrl_game)
{
    var skill_map; skill_map = game_save_get_skill_map(_character);

    return ds_map_get(skill_map, _skill);
}
