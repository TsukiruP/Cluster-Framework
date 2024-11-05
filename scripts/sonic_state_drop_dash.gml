/// sonic_state_drop_dash(phase)
// Originally this had the same caption as brake. Unsure how that happened.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Alarm:
        drop_dash_alarm = 20;
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
        if (on_ground == true)
        {
            if (drop_dash_alarm == 0)
            {
                var drop_dash_speed, drop_dash_max_speed;

                // Face properly:
                if (input_x_direction != 0 && image_xscale != input_x_direction)
                {
                    image_xscale = input_x_direction;
                }

                // Drop Dash speed:
                drop_dash_speed = 8;
                drop_dash_max_speed = 12;

                if (x_speed == 0 || sign(x_speed) == input_x_direction)
                {
                    drop_dash_speed = min(drop_dash_speed + abs(x_speed / 4), drop_dash_max_speed);
                }
                else if (relative_angle != 0)
                {
                    drop_dash_speed = min(drop_dash_speed + abs(x_speed / 2), drop_dash_max_speed);
                }

                // Set speed:
                x_speed = drop_dash_speed * image_xscale;

                // Play sfx:
                sfx_play("snd_spin_dash_release", true);

                // Stop sfx:
                sfx_stop("snd_drop_dash");

                // Create dust:
                with (effect_create(ctl_drop_dash, x, y + y_radius))
                {
                    image_xscale = other.image_xscale;
                }

                return player_set_state(player_state_roll);
            }
            else
            {
                if (player_routine_land())
                {
                    return true;
                }
            }
        }

        // Release:
        if (input_player[INP_JUMP, CHECK_HELD] == true)
        {
            if (drop_dash_alarm > 0)
            {
                drop_dash_alarm -= 1;

                if (drop_dash_alarm == 0)
                {
                    // Set animation:
                    player_set_animation("spin");

                    // Play sfx:
                    sfx_play("snd_drop_dash", true);
                }
            }
        }
        else
        {
            if (drop_dash_alarm == 0)
            {
                // Set animation:
                animation_skip = true;

                // Set state:
                player_set_state(player_state_jump, false);
            }
            else
            {
                // Set state:
                player_set_state(state_previous, false)
            }
        }

        // Skill:
        if (global.skill_sonic[SONIC_SLAM] == SKILL_BOUND_ATTACK && drop_dash_alarm == 0 && input_player[INP_DOWN, CHECK_HELD] == true && input_player[INP_AUX, CHECK_PRESSED] == true)
        {
            if (y_speed < bound_speed)
            {
                // Set speed:
                y_speed = bound_speed;

                // Play sfx:
                sfx_play("snd_bound", true);
            }
        }
        else
        {
            if (player_routine_skill())
            {
                return true;
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
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
