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
        jump_cap    = true;
        jump_aux    = false;
        jump_uncurl = 0;

        // Reset bound:
        if (state_target != player_state_bound)
        {
            bound_state = 0;

            // Reset shield:
            if (instance_exists(shield_handle))
            {
                with (shield_handle)
                {
                    shield_reset = true;
                }
            }
        }
        break;

    // Animate:
    case STATE_ANIMATE:
        switch (status_shield)
        {
            // Bubble shield:
            case SHIELD_BUBBLE:
                // Set timeline:
                if (instance_exists(shield_handle))
                {
                    with (shield_handle)
                    {
                        event_user(1);
                    }
                }
                break;

            // Fire dash:
            case SHIELD_FIRE:
                // Camera lag:
                ctrl_camera.camera_lag_alarm = 16;

                // Set timeline:
                if (instance_exists(shield_handle))
                {
                    with (shield_handle)
                    {
                        event_user(0);
                    }
                }
                break;

            // Lightning jump:
            case SHIELD_LIGHTNING:
                // Sparks:
                for (i = 0; i < 4; i += 1)
                {
                    var spark_handle;

                    spark_handle         = instance_create(floor(x), floor(y), eff_basic);
                    spark_handle.e_speed = 2;

                    with (spark_handle)
                    {
                        ctl_initialize(ctl_shield_lightning_spark);
                    }

                    switch (i)
                    {
                        case 0:
                            spark_handle.angle = ANGLE_LEFT_UP;
                            break;

                        case 1:
                            spark_handle.angle = ANGLE_RIGHT_UP;
                            break;

                        case 2:
                            spark_handle.angle = ANGLE_LEFT_DOWN;
                            break;

                        case 3:
                            spark_handle.angle = ANGLE_RIGHT_DOWN;
                            break;
                    }
                }
                break;

            // Insta-shield:
            default:
                with (instance_create(x, y, eff_player))
                {
                    ctl_initialize(ctl_shield_insta);

                    depth         = other.depth;
                    image_xscale  = other.image_xscale;
                    image_angle   = gravity_angle(other);
                    player_handle = other.id;
                }
        }
        break;
}
