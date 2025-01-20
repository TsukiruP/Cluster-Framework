/// sonic_trait_reticle()
/* Resets the homing handle and sets it when in the proper states. */

if (state_current == sonic_state_homing)
{
    exit;
}

var homing_handle_temp, homing_allow;

homing_handle_temp = homing_handle;
homing_handle = noone;

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

if (!homing_allow || spring_alarm != 0 || !input_allow || (input_cpu && input_cpu_gamepad_alarm == 0))
{
    exit;
}

if (!player_get_input(INP_ALT, CHECK_HELD))
{
    if ((game_get_save("sonic_homing") >= HOMING_ADVENTURE && !on_ground) || game_get_save("sonic_homing") == HOMING_FRONTIERS)
    {
        var i, homing_candidate, homing_fail, homing_solid;

        for (i = 0; i <= 2; i += 1)
        {
            homing_candidate = instance_nearest_dir_x(x, y, par_target, image_xscale, homing_range, i + 1);

            if (instance_exists(homing_candidate))
            {
                // Continue if the candidate isn't targetable:
                if (!homing_candidate.targetable)
                {
                    continue;
                }

                // Fail when interacting with solids:
                homing_fail = false;
                homing_solid = collision_line(x, y, homing_candidate.x, homing_candidate.y, par_terrain, true, true);

                if (instance_exists(homing_solid))
                {
                    if ((y < homing_candidate.y && homing_solid.semisolid) || homing_solid.layer == -1 || layer == homing_solid.layer)
                    {
                        homing_fail = true;
                    }
                }

                if (!homing_fail)
                {
                    homing_handle = homing_candidate;
                    
                    if (homing_handle != homing_handle_temp)
                    {
                        audio_play_sfx("snd_reticle", true);
                    }
                    break;
                }
            }
        }
    }
}
