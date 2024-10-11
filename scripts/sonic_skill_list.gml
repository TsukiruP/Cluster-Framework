/// sonic_skill_list(id)
// Manages all of Sonic's actions.

var homing_handle_temp;

// Reset homing:
homing_handle_temp = homing_handle;
homing_handle = noone;

// Disable homing:
if (input_player[INP_ALT, CHECK_HELD] == false)
{
    if ((global.skill_sonic[SONIC_HOMING_STYLE] >= HOMING_ADVENTURE && on_ground == false) || global.skill_sonic[SONIC_HOMING_STYLE] == HOMING_FRONTIERS)
    {
        var homing_candidate, homing_fail, homing_solid;
        
        for (i = 0; i <= 2; i += 1)
        {
            homing_candidate = instance_nearest_dir_x(x, y, par_target, image_xscale, homing_range, i + 1);
            
            if (instance_exists(homing_candidate))
            {
                // Continue if the candidate isn't targetable:
                if (homing_candidate.targetable == false)
                {
                    continue;
                }

                // Fail when interacting with solids:
                homing_fail = false;
                homing_solid = collision_line(x, y, homing_candidate.x, homing_candidate.y, par_terrain, true, true);

                if (instance_exists(homing_solid))
                {
                    if ((y < homing_candidate.y && homing_solid.semisolid) || homing_solid.collision_layer == -1 || collision_layer == homing_solid.collision_layer)
                    {
                        homing_fail = true;
                    }
                }

                // Set homing handle:
                if (homing_fail == false)
                {
                    homing_handle = homing_candidate;
                    break;
                }
            }
        }
    }
}

// Homing attack:
if (((global.skill_sonic[SONIC_HOMING_STYLE] == HOMING_ADVENTURE && input_player[INP_JUMP, CHECK_PRESSED] == true) || (global.skill_sonic[SONIC_HOMING_STYLE] >= HOMING_UNLEASHED && input_player[INP_AUX, CHECK_PRESSED] == true)) &&
    instance_exists(homing_handle))
{
    return player_set_state(sonic_state_homing);
}

// Ground skill:
else if (on_ground == true && input_player[INP_AUX, CHECK_PRESSED] == true)
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
