/// sonic_state_drop_dash(phase)
/* Originally this had the same caption as brake. Unsure how that happened.
Based off the SonicForGMS implementation. */

switch (argument0)
{
    case STATE_START:
        drop_dash_alarm = 20;
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
            if (drop_dash_alarm == 0)
            {
                var drop_dash_max_speed, drop_dash_speed;

                if (input_x_direction != 0 && image_xscale != input_x_direction) image_xscale = input_x_direction;

                drop_dash_max_speed = 12;
                drop_dash_speed = 8;

                if (x_speed == 0 || sign(x_speed) == input_x_direction) drop_dash_speed = min(drop_dash_speed + abs(x_speed / 4), drop_dash_max_speed);
                else if (relative_angle != 0) drop_dash_speed = min(drop_dash_speed + abs(x_speed / 2), drop_dash_max_speed);

                x_speed = drop_dash_speed * image_xscale;
                audio_play_sfx("snd_spin_dash_release", true);
                audio_stop_sfx("snd_drop_dash");
                with (effect_create(sequence_drop_dash, x, y + y_radius)) image_xscale = other.image_xscale;
                return player_set_state(player_state_roll);
            }
            else
            {
                if (player_routine_land()) return true;
            }
        }

        if (player_get_input(INP_JUMP, CHECK_HELD))
        {
            if (drop_dash_alarm > 0)
            {
                drop_dash_alarm -= 1;

                if (drop_dash_alarm == 0)
                {
                    player_set_animation("spin");
                    audio_play_sfx("snd_drop_dash", true);
                }
            }
        }
        else
        {
            if (drop_dash_alarm == 0)
            {
                animation_skip = true;
                return player_set_state(player_state_jump, false);
            }
            else return player_set_state(state_previous, false)
        }

        // Bound:
        if (game_get_save("sonic_slam") == SKILL_BOUND_ATTACK && drop_dash_alarm == 0 && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
        {
            if (y_speed < bound_speed)
            {
                y_speed = bound_speed;
                audio_play_sfx("snd_bound", true);
            }
        }
        else
        {
            if (player_routine_skill()) return true;
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        if (y_allow) y_speed += gravity_force;
        break;

    case STATE_FINISH:
        break;
}
