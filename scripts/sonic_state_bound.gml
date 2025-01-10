/// sonic_state_bound()
/* No bracelet required!
Similar to the bubble bound but height is based off bounce count rather than holding an input. */

switch (argument0)
{
    case STATE_START:
        if (y_speed < bound_speed)
        {
            y_speed = bound_speed;
        }

        // Set bound:
        jump_cap = false;
        jump_bound = BOUND_SONIC;
        player_set_animation("spin");
        audio_play_sfx("snd_bound", true);
        break;

    case STATE_STEP:
        var bound_count_temp;

        bound_count_temp = bound_count;

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

        if (!player_movement_air())
        {
            return false;
        }

        if (on_ground == true)
        {
            bound_count = min(bound_count_temp + 1, 2);
            animation_skip = true;
            audio_play_sfx("snd_bound_land", true);
            return player_set_state(player_state_jump, true);
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0)
        {
            x_speed *= air_friction;
        }

        if (y_allow == true)
        {
            y_speed += gravity_force;
        }
        break;

    case STATE_FINISH:
        if (state_current != player_state_jump)
        {
            jump_bound = BOUND_NONE;
        }
        break;
}
