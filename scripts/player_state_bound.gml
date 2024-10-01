/// player_state_bound()
// No bracelet required!

switch (argument0)
{
    // Start:
    case STATE_START:
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
            exit;
        }

        // Land:
        if (on_ground == true)
        {
            // Set state:
            animation_skip = true;
            player_set_state(player_state_jump, true);

            // Play sound:
            sound_play_single("snd_shield_bubble_bound");

            // Shield:
            if (instance_exists(shield_handle))
            {
                with (shield_handle)
                {
                    event_user(1);
                }
            }

            return true;
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
}
