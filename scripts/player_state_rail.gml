/// player_state_rail(phase)
/// @desc COMING TO YOUR HOME
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("rail");
        audio_play_sfx("snd_rail");
        break;

    case STATE_STEP:
        image_xscale = esign(x_speed, image_xscale);
        if (x_speed == 0) x_speed = image_xscale;

        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (instance_exists(ground_inst))
        {
            if (!object_is_ancestor(ground_inst.object_index, par_rail)) return player_set_state(player_state_run);
        }

        if (relative_angle >= 45 && relative_angle <= 315) input_lock_alarm = 30;
        if (angle_wrap(relative_angle + 135) <= 270) x_speed -= dsin(relative_angle * 5) / 32;

        if (player_routine_jump()) return true;

        if (animation_time mod 8 == 0)
        {
            var sine; sine = dsin(mask_rotation);
            var csine; csine = dcos(mask_rotation);

            with (effect_create(x - (csine * x_radius * image_xscale) + (sine * y_radius), y + (sine * x_radius * image_xscale) + (csine * y_radius), sequence_rail_spark, depth, image_xscale))
            {
                image_angle = other.mask_rotation;
            }
        }
        break;

    case STATE_FINISH:
        break;
}
