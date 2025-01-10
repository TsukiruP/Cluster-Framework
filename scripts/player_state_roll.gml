/// player_state_roll(phase)
/* Keep rollin', rollin', rollin', rollin' */

switch (argument0)
{
    case STATE_START:
        if (x_speed == 0)
        {
            x_speed = 2 * input_x_direction;
        }

        player_set_animation("spin");
        break;

    case STATE_STEP:
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
        if (input_lock_alarm == 0)
        {
            x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);
        }

        if (!player_movement_ground())
        {
            return false;
        }

        if (on_ground == false)
        {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (abs(x_speed) < slide_threshold && relative_angle >= 45 && relative_angle <= 315)
        {
            if (relative_angle >= 90 && relative_angle <= 270)
            {
                return player_set_state(player_state_air);
            }

            input_lock_alarm = 30;
        }

        // Slope friction:
        var roll_slope_friction;

        roll_slope_friction = roll_friction_down;

        if (sign(dsin(relative_angle)) == sign(x_speed))
        {
            roll_slope_friction = roll_friction_up;
        }

        player_slope_friction(roll_slope_friction);

        if (player_routine_jump())
        {
            return true;
        }

        // Uncurl:
        if (abs(x_speed) < 0.5 && mask_rotation == gravity_direction)
        {
            return player_set_state(player_state_run);
        }
        break;

    case STATE_FINISH:
        break;
}
