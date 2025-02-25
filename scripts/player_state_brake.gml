/// player_state_brake(phase)
/// @desc Try to outrun this demon to get left in the dust.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        if ((!game_get_config("advance_brake") || character_index == CHAR_CLASSIC) && x_speed != 0) image_xscale = sign(x_speed);
        if (abs(x_speed) >= 6.00) player_set_animation("brake_fast");
        else player_set_animation("brake");
        break;

    case STATE_STEP:
        if (input_x_direction != 0)
        {
            if (sign(x_speed) != input_x_direction)
            {
                if (input_lock_alarm == 0)
                {
                    x_speed += deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction)
                    {
                        x_speed = deceleration * input_x_direction;

                        if (game_get_config("advance_turn") && character_index != CHAR_CLASSIC && sign(image_xscale) != sign(x_speed))
                        {
                            player_set_animation("turn_brake");
                            return player_set_state(player_state_turn);
                        }

                        return player_set_state(player_state_run);
                    }
                }
            }
            else return player_set_state(player_state_run);
        }
        else
        {
            if (game_get_config("advance_brake") && character_index != CHAR_CLASSIC) return player_set_state(player_state_run);
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

        if (x_speed != 0) player_brake_dust();
        break;

    case STATE_FINISH:
        break;
}
