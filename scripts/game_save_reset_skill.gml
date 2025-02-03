/// game_save_reset_skill(index)
/* Resets a skill map. */

with (ctrl_game)
{
    var skill_map;

    skill_map = game_save_get_skill_map(argument0);
    ds_map_clear(skill_map);

    switch (argument0)
    {
        case CHAR_SONIC:
            ds_map_add(skill_map, "ground", SKILL_NONE);
            ds_map_add(skill_map, "air_jump", SKILL_NONE);
            ds_map_add(skill_map, "air_aux", SKILL_NONE);
            ds_map_add(skill_map, "slam", SKILL_NONE);
            ds_map_add(skill_map, "peel", false);
            ds_map_add(skill_map, "homing", HOMING_NONE);
            ds_map_add(skill_map, "shield", false);
    }
}
