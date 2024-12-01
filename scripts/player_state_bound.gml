/// player_state_bound()
// Not to be confused with the Bound Attack. Which is to say they're the same thing.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 0;
        y_speed = 8;

        // Set bound:
        jump_bound = BOUND_SHIELD;

        // Set animation:
        player_set_animation("spin");

        // Play sfx:
        audio_play_sfx("snd_shield_bubble_bound", true);

        // Shield:
        if (instance_exists(shield_handle))
        {
            with (shield_handle)
            {
                event_user(0);
            }
        }
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
        if (on_ground == true)
        {
            // Set animation:
            animation_skip = true;

            // Play sfx:
            audio_play_sfx("snd_shield_bubble_bound", true);

            // Shield:
            if (instance_exists(shield_handle))
            {
                with (shield_handle)
                {
                    event_user(1);
                }
            }

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
            jump_aux = false;
            jump_bound = BOUND_NONE;

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
}
