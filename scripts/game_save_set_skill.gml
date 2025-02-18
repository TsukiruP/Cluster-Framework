/// game_save_set_skill(character, skill, value)
/// @desc Sets the value of a skill key.
/// @param {int} character
/// @param {string} skill
/// @param {any} value
/// @returns {void}

var _character; _character = argument0;
var _skill; _skill = argument1;
var _value; _value = argument2;

with (ctrl_game)
{
    var skill_map; skill_map = game_save_get_skill_map(_character);

    ds_map_set(skill_map, _skill, _value);
}
