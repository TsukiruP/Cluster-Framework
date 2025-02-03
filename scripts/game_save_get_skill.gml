/// game_save_get_skill(index, skill)
/* Returns a skill from a skill map. */

with (ctrl_game)
{
    var skill_map;

    skill_map = game_save_get_skill_map(argument0);
    return ds_map_get(skill_map, argument1);
}
