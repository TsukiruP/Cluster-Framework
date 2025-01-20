/// player_state_spring(phase)
/* Falling with style.
Very similar to the airborne state, except this has checks for the spring alarm for inputs and has a different animation script.  */

switch (argument0)
{
    case STATE_START:
        player_reset_air();
        player_reset_skill();
        player_animation_spring();
        break;

    case STATE_STEP:
        if (spring_alarm == 0)
        {
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

        if (!player_movement_air())
        {
            return false;
        }

        if (player_routine_land())
        {
            return true;
        }

        if (spring_alarm > 0)
        {
            return false;
        }

        if (player_routine_skill())
        {
            return true;
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0)
        {
            x_speed *= air_friction;
        }

        if (y_allow)
        {
            y_speed += gravity_force;
        }

        player_animation_spring();
        break;

    case STATE_FINISH:
        break;
}
