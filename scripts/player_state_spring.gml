/// player_state_spring(phase)
// Falling with style.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Reset air:
        player_reset_air();

        // Reset skill:
        player_reset_skill();

        // Set animation:
        player_animation_spring();
        break;

    // Step:
    case STATE_STEP:
        if (spring_alarm == 0)
        {
            // Input:
            if (input_x_direction != 0)
            {
                image_xscale = input_x_direction;

                if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
                {
                    x_speed += (acceleration * 2) * input_x_direction;

                    if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction)
                    {
                        x_speed = top_speed * input_x_direction;
                    }
                }
            }
        }

        // Movement:
        if (!player_movement_air())
        {
            return false;
        }

        // Land:
        if (player_routine_land())
        {
            return false;
        }

        // Spring:
        if (spring_alarm > 0)
        {
            return false;
        }

        // Skill:
        if (player_routine_skill())
        {
            return false;
        }

        // Air friction:
        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0)
        {
            x_speed *= air_friction;
        }

        // Gravity:
        if (y_allow == true)
        {
            y_speed += gravity_force;
        }

        // Set animation:
        player_animation_spring();
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
