/// game_save_reset_skill(character)
/// @desc Resets a skill map.
/// @param {int} character
/// @returns {void}

var _character; _character = argument0;

with (ctrl_game)
{
    var skill_map; skill_map = game_save_get_skill_map(_character);

    ds_map_clear(skill_map);

    switch (_character)
    {
        case CHAR_SONIC:
            ds_map_set(skill_map, "ground", SKILL_NONE);
            ds_map_set(skill_map, "air_jump", SKILL_NONE);
            ds_map_set(skill_map, "air_aux", SKILL_NONE);
            ds_map_set(skill_map, "slam", SKILL_NONE);
            ds_map_set(skill_map, "peel", false);
            ds_map_set(skill_map, "homing", HOMING_NONE);
            ds_map_set(skill_map, "shield", false);
    }
}