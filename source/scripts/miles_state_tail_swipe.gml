/// miles_state_tail_swipe(phase)
/// @desc Sonic Fandom wiki is wrong about how this move works.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("tail_swipe");
        audio_play_sfx("snd_tail_swipe", true);
        break;

    case STATE_STEP:
        if (on_ground)
        {
            x_speed -= min(abs(x_speed), deceleration / 2) * sign(x_speed);
            if (!player_movement_ground()) return false;

            if (!on_ground)
            {
                player_reset_air_speed();
                return true;
            }

            if (relative_angle >= 45 && relative_angle <= 315) return player_set_state(player_state_run);
        }
        else
        {
            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;

            player_gravity_force();
        }

        if (animation_trigger)
        {
            if (on_ground)
            {
                if (x_speed != 0) return player_set_state(player_state_run);
                else return player_set_state(player_state_idle);
            }
            else
            {
                player_reset_air();
                animation_skip = true;
                player_set_animation("spring_fall");
                return player_set_state(player_state_air, false);
            }
        }
        break;

    case STATE_FINISH:
        break;
}
