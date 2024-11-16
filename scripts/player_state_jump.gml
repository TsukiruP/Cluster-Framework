/// player_state_jump(phase)
// A jump to the sky turns to a rider kick.

switch (argument0)
{
    // Start:
    case STATE_START:
        var g_speed, leap_force;

        // Air force:
        leap_force = jump_force;

        // Bound force:
        switch (jump_bound)
        {
            // Bubble bound:
            case BOUND_SHIELD:
                leap_force = 7.5;
                break;

            // Sonic bound:
            case BOUND_SONIC:
                leap_force = 6 + bound_count;
                break;
        }

        // Leap:
        g_speed = x_speed;
        x_speed = (dcos(relative_angle) * g_speed) - (leap_force * dsin(relative_angle));
        y_speed = -(dsin(relative_angle) * g_speed) - (leap_force * dcos(relative_angle));

        // Reset air:
        player_reset_air();

        // Set animation:
        player_set_animation("spin");
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
            return false;
        }

        // Land:
        if (player_routine_land())
        {
            return false;
        }

        // Variable jump:
        if (jump_cap == true)
        {
            var input_held;

            // Held input:
            input_held = player_get_input(INP_JUMP, CHECK_HELD);

            if (jump_aux == true)
            {
                input_held = player_get_input(INP_AUX, CHECK_HELD);
            }

            if (y_speed < jump_release && input_held == false)
            {
                y_speed = jump_release;
            }
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

        // Uncurl:
        if (y_speed >= 0)
        {
            switch (jump_uncurl)
            {
                // Blockade:
                case UNCURL_BLOCKADE:
                    animation_skip = (animation_current != "spring_fall");
                    player_set_animation("spring_fall");
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Reset jump:
        jump_cap = true;
        jump_aux = false;
        jump_uncurl = UNCURL_DEFAULT;

        // Reset bound:
        if (state_current != player_state_bound)
        {
            jump_bound = BOUND_SHIELD;

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
