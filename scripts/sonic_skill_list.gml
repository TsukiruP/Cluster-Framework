/// sonic_skill_list(id)
//

var skill_id;

skill_id = argument0;

// Ground skill:
if (skill_id == SONIC_AUX_G)
{
    switch (global.sonic_skill[skill_id])
    {
        // Slide:
        case 1:
            return player_set_state(sonic_state_skid);
            break;

        // Hammer;
        case 2:
            return player_set_state(player_state_hammer);
            break;

    }
}

// Air skills:
else
{
    if (global.sonic_skill[skill_id] <= 1 && status_shield_allow == true)
    {
        // Elemental shields:
        if (global.sonic_skill[SONIC_SHIELD] == true && status_shield >= SHIELD_BUBBLE)
        {
            return player_routine_shield();
        }

        // Insta-shield:
        else if (global.sonic_skill[skill_id] == 1)
        {
            // Set state:
            player_set_state(player_state_jump, false);
            jump_cap = false;

            status_shield_allow = false;
            status_insta_alarm = 8;

            // Set animation:
            player_set_animation("insta");

            // Play sound:
            sound_play("snd_shield_insta");

            // Shield:
            with (instance_create(x, y, eff_player))
            {
                ctl_initialize(ctl_shield_insta);

                depth = other.depth;
                image_xscale = other.image_xscale;
                image_angle = gravity_angle(other);
                player_handle = other.id;
            }

            return true;
        }
    }

    // Air Dash:
    else if (global.sonic_skill[skill_id] == 2 && air_dash_allow == true)
    {
        // Set speed:
        x_speed += 2.25 * image_xscale;
        y_speed  = 0;

        // Set animation:
        animation_skip = (animation_current != "spin" && animation_current != "insta");
        player_set_animation("air_dash");
        air_dash_allow = false;

        return player_set_state(player_state_air, false);
    }
}

// No skill takes place:
return false;
