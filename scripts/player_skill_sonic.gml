/// player_skill_sonic()

// Slam:
if (game_get_save("sonic_slam") >= SKILL_BOUND_ATTACK && !on_ground && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
{
    switch (game_get_save("sonic_slam"))
    {
        // Bound:
        case SKILL_BOUND_ATTACK:
            return player_set_state(sonic_state_bound);

        // Stomp:
        case SKILL_STOMP:
            return player_set_state(sonic_state_stomp);
    }
}

// Homing attack:
else if ((((game_get_save("sonic_homing") == HOMING_ADVENTURE || game_get_save("sonic_homing") == HOMING_GENERATIONS) && player_get_input(INP_JUMP, CHECK_PRESSED)) ||
    (game_get_save("sonic_homing") >= HOMING_UNLEASHED && player_get_input(INP_AUX, CHECK_PRESSED))) && instance_exists(homing_handle))
{
    return player_set_state(sonic_state_homing);
}

// Ground:
else if (on_ground && player_get_input(INP_AUX, CHECK_PRESSED))
{
    switch (game_get_save("sonic_aux_ground"))
    {
        // Hammer:
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);

        // Skid:
        case SKILL_SKID:
            return player_set_state(sonic_state_skid);

    }
}

// Aerial:
else if (!on_ground)
{
    var skill_key;

    // Skill key:
    skill_key = "";

    // Check Jump:
    if (player_get_input(INP_JUMP, CHECK_PRESSED))
    {
        skill_key = "sonic_jump";
    }

    // Check Auxiliary:
    else if (player_get_input(INP_AUX, CHECK_PRESSED))
    {
        skill_key = "sonic_aux_air";
    }

    if (skill_key != "")
    {
        if (game_get_save(skill_key) <= SKILL_INSTA && status_shield_allow)
        {
            // Elemental shields:
            if (game_get_save("sonic_shield") && status_shield >= SHIELD_BUBBLE)
            {
                return player_routine_shield();
            }

            // Insta-shield:
            else if (game_get_save(skill_key) == SKILL_INSTA)
            {
                player_routine_insta();
                return true;
            }
        }

        // Air Dash:
        else if (game_get_save(skill_key) == SKILL_AIR_DASH && air_dash_allow)
        {
            x_speed += 2.25 * image_xscale;
            y_speed  = 0;
            air_dash_allow = false;
            animation_skip = (animation_current != "spin" && animation_current != "insta");
            player_set_animation("air_dash");
            audio_play_sfx("snd_air_dash", true);
            return player_set_state(player_state_air, false);
        }

        // Jump:
        else if (skill_key == "sonic_jump")
        {
            // Drop Dash:
            if (game_get_save(skill_key) == SKILL_DROP_DASH)
            {
                return player_set_state(sonic_state_drop_dash);
            }
        }
    }
}

// Peel Out:
if (game_get_save("sonic_peel") && x_speed == 0 && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    return player_set_state(sonic_state_peel_out);
}

return false;
