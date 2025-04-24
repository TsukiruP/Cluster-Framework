/// save_set_skill(character, skill, val)
/// @desc Sets the value of a skill key.
/// @param {int} character
/// @param {string} skill
/// @param {any} val
/// @returns {void}

var _character; _character = argument0;
var _skill; _skill = argument1;
var _val; _val = argument2;

with (ctrl_game)
{
    var skill_map; skill_map = save_get_skill_map(_character);

    ds_map_set(skill_map, _skill, _val);
}
