/// player_state_bound()
/* Not to be confused with the Bound Attack. A common mistake.
This is the bound of the bubble shield. */

switch (argument0)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 8;
        jump_bound = BOUND_SHIELD;
        player_set_animation("spin");
        audio_play_sfx("snd_shield_bubble_bound", true);
        with (shield_handle) event_user(0);
        break;

    case STATE_STEP:
        if (input_x_direction != 0)
        {
            image_xscale = input_x_direction;

            if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
            {
                x_speed += (acceleration * 2) * input_x_direction;
                if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) x_speed = top_speed * input_x_direction;
            }
        }

        if (!player_movement_air()) return false;

        if (on_ground)
        {
            animation_skip = true;
            audio_play_sfx("snd_shield_bubble_bound", true);
            with (shield_handle) event_user(1);
            return player_set_state(player_state_jump, true);
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        y_speed += gravity_force;
        break;

    case STATE_FINISH:
        if (state_current != player_state_jump)
        {
            jump_aux = false;
            jump_bound = BOUND_NONE;
            with (shield_handle) shield_reset = true;
        }
        break;
}
