/// game_save_write_skill(index)
/* Writes a skill map to the save map/ */

with (ctrl_game)
{
    var skill_map, skill_string;

    skill_map = game_save_get_skill_map(argument0);
    skill_string = pick(argument0, "sonic_skill");

    game_set_save(skill_string, ds_map_write(skill_map));
}
