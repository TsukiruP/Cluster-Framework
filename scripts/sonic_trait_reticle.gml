/// sonic_trait_reticle()
/// @desc Resets the homing instance and sets it in specific states.
/// @returns {void}

if (state_current == sonic_state_homing) exit;

var homing_inst_temp; homing_inst_temp = homing_inst;

homing_inst = noone;

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

if (!homing_allow || spring_alarm != 0 || !input_allow || (input_cpu && input_cpu_gamepad_alarm == 0)) exit;

var skill_index; skill_index = game_save_get_skill(character_index, "homing");

if (!player_get_input(INP_ALT, CHECK_HELD))
{
    if ((skill_index >= HOMING_ADVENTURE && !on_ground) || skill_index == HOMING_FRONTIERS)
    {
        for ({var i; i = 0}; i <= 2; i += 1)
        {
            var homing_candidate; homing_candidate = noone;

            if (mask_direction mod 180 == 0) homing_candidate = instance_nearest_dir_x(x, y, par_target, dcos(mask_direction) * image_xscale, homing_range, i + 1);
            else homing_candidate = instance_nearest_dir_y(x, y, par_target, dsin(mask_direction) * image_xscale, homing_range, i + 1);

            if (instance_exists(homing_candidate))
            {
                if (!homing_candidate.collision || !homing_candidate.targetable || distance_to_object(homing_candidate) > homing_range) continue;

                var homing_angle1; homing_angle1 = mask_direction;
                var homing_angle2; homing_angle2 = direction_to_object(homing_candidate);

                if (sign(image_xscale) == -1) homing_angle1 = angle_wrap(homing_angle1 + 180);
                if (abs(angle_difference(homing_angle1, homing_angle2)) > 45) continue;

                // Fail when interacting with solids:
                var homing_fail; homing_fail = false;
                var homing_solid; homing_solid = collision_line(x, y, homing_candidate.x, homing_candidate.y, par_solid, true, true);

                if (instance_exists(homing_solid))
                {
                    homing_fail = (homing_solid.collision && ((y < homing_candidate.y && homing_solid.semisolid) || homing_solid.layer == -1 || layer == homing_solid.layer));
                }

                if (!homing_fail)
                {
                    homing_inst = homing_candidate;
                    if (homing_inst != homing_inst_temp) audio_play_sfx("snd_reticle", true);
                    break;
                }
            }
        }
    }
}
