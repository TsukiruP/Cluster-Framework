/// game_save_set_skill(index, skill, value)
/* Sets a skill in a skill map. */

with (ctrl_game)
{
    var skill_map;

    skill_map = game_save_get_skill_map(argument0);
    ds_map_set(skill_map, argument1, argument2);
}
