/// player_state_run(phase)
/// @desc Gotta go fast!
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        break;

    case STATE_STEP:
        if (input_x_direction != 0)
        {
            if (x_speed != 0 && sign(x_speed) != input_x_direction)
            {
                if (input_lock_alarm == 0)
                {
                    if ((game_config_get("advance_turn") && character_index != CHAR_CLASSIC) && sign(image_xscale) == -input_x_direction && abs(x_speed) <= 4)
                    {
                        return player_set_state(player_state_turn);
                    }

                    if (abs(x_speed) > 4)
                    {
                        audio_play_sfx("snd_brake", true);
                        return player_set_state(player_state_brake);
                    }

                    x_speed += deceleration * input_x_direction;
                    if (sign(x_speed) == input_x_direction) x_speed = deceleration * input_x_direction;
                }
            }
            else
            {
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed)
                {
                    x_speed += acceleration * input_x_direction;
                    if (abs(x_speed) > top_speed) x_speed = top_speed * input_x_direction;
                }
            }
        }
        else if (input_lock_alarm == 0)
        {
            x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
            if (player_routine_roll()) return true;
        }

        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (abs(x_speed) < slide_threshold)
        {
            if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
            else if (relative_angle >= 45 && relative_angle <= 315) input_lock_alarm = 30;
        }

        player_slope_friction(slope_friction);

        if (x_speed == 0 && input_x_direction == 0) return player_set_state(player_state_idle);
        if (player_routine_skill()) return true;
        if (player_routine_jump()) return true;

        if (abs(x_speed) < 10 && peel_out) peel_out = false;
        player_animation_run();
        break;

    case STATE_FINISH:
        input_lock_alarm = 0;
        break;
}
