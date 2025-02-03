/// game_save_read_skill(id)
/* Copies a skill map. */

with (ctrl_game)
{
    var skill_map, skill_string;

    skill_map = game_save_get_skill_map(argument0);
    skill_string = game_get_save(pick(argument0, "sonic_skill"));

    ds_map_read(skill_map, skill_string);
}
