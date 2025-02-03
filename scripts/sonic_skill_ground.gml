/// sonic_skill_ground()
/* Returns whether a ground skill has been called. */

if (on_ground && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_id;

    skill_id = game_save_get_skill(character_id, "ground");

    switch (skill_id)
    {
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);

        case SKILL_SKID:
            return player_set_state(sonic_state_skid);

    }
}

return false;
