/// sonic_skill_list(id)
// Manages all of Sonic's actions.

// Slam skill:
if (game_save_get("sonic_slam") >= SKILL_BOUND_ATTACK && on_ground == false && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
{
    switch (game_save_get("sonic_slam"))
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
else if ((((game_save_get("sonic_homing") == HOMING_ADVENTURE || game_save_get("sonic_homing") == HOMING_GENERATIONS) && player_get_input(INP_JUMP, CHECK_PRESSED)) ||
    (game_save_get("sonic_homing") >= HOMING_UNLEASHED && player_get_input(INP_AUX, CHECK_PRESSED))) && instance_exists(homing_handle))
{
    return player_set_state(sonic_state_homing);
}

// Ground skill:
else if (on_ground == true && player_get_input(INP_AUX, CHECK_PRESSED))
{
    switch (game_save_get("sonic_aux_ground"))
    {
        // Hammer:
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);

        // Skid:
        case SKILL_SKID:
            return player_set_state(sonic_state_skid);

    }
}

// Aerial skill:
else if (on_ground == false)
{
    var skill_key;

    // Skill ID:
    skill_key = "";

    // Check Jump skill:
    if (player_get_input(INP_JUMP, CHECK_PRESSED))
    {
        skill_key = "sonic_jump";
    }

    // Check Aux skill:
    else if (player_get_input(INP_AUX, CHECK_PRESSED))
    {
        skill_key = "sonic_aux_air";
    }

    if (skill_key != "")
    {
        if (game_save_get(skill_key) <= SKILL_INSTA && status_shield_allow == true)
        {
            // Elemental shields:
            if (game_save_get("sonic_shield") == true && status_shield >= SHIELD_BUBBLE)
            {
                return player_routine_shield();
            }

            // Insta-shield:
            else if (game_save_get(skill_key) == SKILL_INSTA)
            {
                // Set state:
                player_set_state(player_state_jump, false);
                jump_cap = false;

                status_shield_allow = false;
                status_insta_alarm = 8;

                // Set animation:
                player_set_animation("insta");

                // Play sound:
                audio_sfx_play("snd_shield_insta", true);

                // Create shield:
                with (instance_create(x, y, eff_player))
                {
                    ctl_init(ctl_shield_insta);

                    depth = other.depth;
                    image_xscale = other.image_xscale;
                    image_angle = other.gravity_direction;
                    player_handle = other.id;
                }

                return true;
            }
        }

        // Air Dash:
        else if (game_save_get(skill_key) == SKILL_AIR_DASH && air_dash_allow == true)
        {
            // Set speed:
            x_speed += 2.25 * image_xscale;
            y_speed  = 0;

            // Set animation:
            animation_skip = (animation_current != "spin" && animation_current != "insta");
            player_set_animation("air_dash");
            air_dash_allow = false;
            
            // Play sound:
            audio_sfx_play("snd_air_dash", true);

            return player_set_state(player_state_air, false);
        }
        
        // Jump Skills:
        else if (skill_key == "sonic_jump")
        {
            return player_set_state(sonic_state_drop_dash);
        }
    }
}

// Super Peel Out:
if (game_save_get("sonic_peel") == true && x_speed == 0 && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    return player_set_state(sonic_state_peel_out);
}

// No skill takes place:
return false;
