/// player_state_jump(phase)
// A jump to the sky turns to a rider kick.

switch (argument0)
{
    // Start:
    case STATE_START:
        var g_speed, leap_force;

        // Set speed:
        g_speed = x_speed;
        x_speed = dcos(relative_angle) * g_speed;
        y_speed = -(dsin(relative_angle) * g_speed);

        // Air force:
        leap_force = jump_force;

        if (bound_state == 1)
        {
            leap_force = 7.5;
        }

        // Jump:
        x_speed -= leap_force * dsin(relative_angle);
        y_speed -= leap_force * dcos(relative_angle);

        // Reset air:
        player_reset_air();
        break;

    // Step:
    case STATE_STEP:
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

        // Movement:
        if (!player_movement_air())
        {
            exit;
        }

        // Land:
        if (player_routine_land())
        {
            return true;
        }

        // Variable jump:
        if (jump_cap == true)
        {
            var input_held;

            input_held = input_player[INP_JUMP, CHECK_HELD];

            if (jump_aux == true)
            {
                input_held = input_player[INP_AUX, CHECK_HELD];
            }

            if (y_speed < jump_release && input_held == false)
            {
                y_speed = jump_release;
            }
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

        // Skill:
        if (player_routine_skill())
        {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Reset jump:
        jump_cap = true;
        jump_aux = false;
        jump_uncurl = 0;

        // Reset bound:
        if (state_current != player_state_bound)
        {
            bound_state = 0;

            // Reset shield:
            if (instance_exists(shield_handle))
            {
                with (shield_handle)
                {
                    if (ctl_index == ctl_shield_bubble_bound)
                    {
                        shield_reset = true;
                    }
                }
            }
        }
        break;
}
