/// player_state_run(phase)
// Gotta go fast.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Wall push:
        wall_push = false;
        break;

    // Step:
    case STATE_STEP:
        // Input:
        if (input_x_direction != 0)
        {
            // Decelerate:
            if (x_speed != 0 && sign(x_speed) != input_x_direction)
            {
                if (input_lock_alarm == 0)
                {
                    // Turn:
                    if (global.advance_turn == true && abs(x_speed) <= 4 && image_xscale == -input_x_direction)
                    {
                        return player_set_state(player_state_turn);
                    }

                    // Brake:
                    if (abs(x_speed) > 4)
                    {
                        // Play sfx:
                        sfx_play("snd_brake");

                        return player_set_state(player_state_brake);
                    }

                    x_speed += deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction)
                    {
                        x_speed = deceleration * input_x_direction;
                    }
                }
            }

            // Accelerate:
            else
            {
                // Set direction:
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed)
                {
                    x_speed += acceleration * input_x_direction;

                    if (abs(x_speed) > top_speed)
                    {
                        x_speed = top_speed * input_x_direction;
                    }
                }
            }
        }

        // Friction:
        else
        {
            x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);

            // Roll:
            if (abs(x_speed) > 0.5)
            {
                if (input_player[INP_DOWN, CHECK_HELD] == true)
                {
                    // Play sfx:
                    sfx_play("snd_roll", true);

                    return player_set_state(player_state_roll);
                }
            }
        }

        // Movement:
        if (!player_movement_ground())
        {
            exit;
        }

        // Fall:
        if (on_ground == false)
        {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315)
        {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270)
            {
                return player_set_state(player_state_air);
            }
            else
            {
                input_lock_alarm = 30;
            }
        }

        // Slope friction:
        player_slope_friction(slope_friction, acceleration);

        // Idle:
        if (x_speed == 0 && input_x_direction == 0)
        {
            return player_set_state(player_state_idle);
        }

        // Skill:
        if (player_routine_skill())
        {
            return true;
        }

        // Jump:
        if (player_routine_jump())
        {
            return true;
        }

        // Set animation:
        player_animation_run();
        break;

    // Finish:
    case STATE_FINISH:
        input_lock_alarm = 0;
        break;
}
