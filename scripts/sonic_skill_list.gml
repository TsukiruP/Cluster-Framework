/// sonic_skill_list(id)
// Manages all of Sonic's actions.

// Homing target:
var _dummy;

_dummy = instance_nearest_dir_x(x, y, obj_item_box, image_xscale);


// Homing attack:
/*
if ((global.skill_sonic[SONIC_HOMING] == HOMING_AUX && global.skill_sonic[SONIC_HOMING_F] == true && on_ground == true && input_player[INP_AUX, CHECK_PRESSED] == true) ||
    (on_ground == false && ((global.skill_sonic[SONIC_HOMING] == HOMING_JUMP && input_player[INP_AUX, CHECK_PRESSED] == true) || (global.skill_sonic[SONIC_HOMING] == HOMING_AUX && input_player[INP_AUX, CHECK_PRESSED] == true))))
{
}

// Ground skill:
else*/ if (on_ground == true && input_player[INP_AUX, CHECK_PRESSED] == true)
{
    switch (global.skill_sonic[SONIC_AUX_G])
    {
        // Hammer;
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
    var skill_id;

    // Skill id:
    skill_id = -1;

    // Check Jump skill:
    if (input_player[INP_JUMP, CHECK_PRESSED] == true)
    {
        skill_id = SONIC_JUMP;
    }

    // Check Aux skill:
    else if (input_player[INP_AUX, CHECK_PRESSED] == true)
    {
        skill_id = SONIC_AUX_A;
    }

    if (skill_id != -1)
    {
        if (global.skill_sonic[skill_id] <= SKILL_INSTA && status_shield_allow == true)
        {
            // Elemental shields:
            if (global.skill_sonic[SONIC_SHIELD] == true && status_shield >= SHIELD_BUBBLE)
            {
                return player_routine_shield();
            }

            // Insta-shield:
            else if (global.skill_sonic[skill_id] == SKILL_INSTA)
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
        else if (global.skill_sonic[skill_id] == SKILL_AIR_DASH && air_dash_allow == true)
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
}

// No skill takes place:
return false;
