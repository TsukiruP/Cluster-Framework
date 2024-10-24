/// player_state_roll(phase)
// Keep rollin', rollin', rollin', rollin'

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        if (x_speed == 0)
        {
            x_speed = 2 * input_x_direction;
        }

        // Set animation:
        player_set_animation("spin");
        break;

    // Step:
    case STATE_STEP:
        // Input:
        if (input_x_direction != 0)
        {
            if (input_lock_alarm == 0)
            {
                if (x_speed != 0 && sign(x_speed) != input_x_direction)
                {
                    x_speed += roll_deceleration * input_x_direction;

                    if (sign(x_speed) == input_x_direction)
                    {
                        x_speed = roll_deceleration * input_x_direction;
                    }
                }
            }
        }

        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

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
        }

        // Slope friction:
        if (sign(dsin(relative_angle)) == sign(x_speed))
        {
            player_slope_friction(roll_friction_up, roll_friction);
        }
        else
        {
            player_slope_friction(roll_friction_down, roll_friction);
        }

        // Jump:
        if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true)
        {
            // Play sound:
            //sound_play_single("snd_jump");

            return player_set_state(player_state_jump);
        }

        // Uncurl:
        if (abs(x_speed) < 0.5 && mask_rotation == gravity_direction)
        {
            return player_set_state(player_state_run);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
