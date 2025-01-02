/// player_state_run(phase)
// Gotta go fast!

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
                    if (game_config_get("advance_turn") && abs(x_speed) <= 4 && image_xscale == -input_x_direction)
                    {
                        return player_set_state(player_state_turn);
                    }

                    // Brake:
                    if (abs(x_speed) > 4)
                    {
                        // Play sound:
                        audio_play_sfx("snd_brake");
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
        else if (input_lock_alarm == 0)
        {
            x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);

            // Roll:
            if (player_routine_roll())
            {
                return false;
            }
        }

        // Movement:
        if (!player_movement_ground())
        {
            return false;
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

            // Deploy input lock:
            input_lock_alarm = 30;
        }

        // Slope friction:
        player_slope_friction(slope_friction);

        // Idle:
        if (x_speed == 0 && input_x_direction == 0)
        {
            return player_set_state(player_state_idle);
        }

        // Skill:
        if (player_routine_skill())
        {
            return false;
        }

        // Jump:
        if (player_routine_jump())
        {
            return false;
        }

        // Set animation:
        player_animation_run();
        break;

    // Finish:
    case STATE_FINISH:
        input_lock_alarm = 0;
        break;
}
