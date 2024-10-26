/// sonic_trait_reticle()
//

// Don't reset during the homing attack:
if (state_current == sonic_state_homing)
{
    exit;
}

var homing_handle_temp, homing_allow;

// Reset homing handle:
homing_handle_temp = homing_handle;
homing_handle = noone;

// Set homing allow:
switch (state_current)
{
    case player_state_idle:
    case player_state_turn:
    case player_state_run:
    case player_state_air:
    case player_state_jump:
    case player_state_look:
    case player_state_crouch:
    case player_state_brake:
        homing_allow = true;
        break;
    
    default:
        homing_allow = false;
}

// Exit if homing isn't allowed or spring alarm is set:
if (homing_allow == false || spring_alarm != 0)
{
    exit;
}

// Set homing handle:
if (input_player[INP_ALT, CHECK_HELD] == false)
{
    if ((global.skill_sonic[SONIC_HOMING] >= HOMING_ADVENTURE && on_ground == false) || global.skill_sonic[SONIC_HOMING] == HOMING_FRONTIERS)
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
                    
                    // Play sfx:
                    if (homing_handle != homing_handle_temp)
                    {
                        sfx_play("snd_reticle");
                    }
                    break;
                }
            }
        }
    }
}
