/// sonic_state_bound()
// No bracelet required!

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        if (y_speed < bound_speed)
        {
            y_speed = bound_speed;
        }

        // Set bound:
        jump_cap = false;
        jump_bound = BOUND_SONIC;

        // Set animation:
        player_set_animation("spin");

        // Play sfx:
        audio_play_sfx("snd_bound", true);
        break;

    // Step:
    case STATE_STEP:
        var bound_count_temp;

        // Store bound count:
        bound_count_temp = bound_count;

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
            // Bound count:
            bound_count = min(bound_count_temp + 1, 2);

            // Set animation:
            animation_skip = true;

            // Play sfx:
            audio_play_sfx("snd_bound_land", true);

            return player_set_state(player_state_jump, true);
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
        // Reset bound:
        if (state_current != player_state_jump)
        {
            jump_bound = BOUND_NONE;
        }
        break;
}
