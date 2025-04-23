/// sonic_state_bound()
/// @desc Sonic's Bound Jump.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("roll");
        audio_play_sfx("snd_bound", true);
        if (y_speed < bound_speed) y_speed = bound_speed;
        break;

    case STATE_STEP:
        var bound_count_temp; bound_count_temp = bound_count;

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
            jump_cap = false;
            jump_bound = BOUND_SONIC;
            jump_uncurl = UNCURL_BOUND;
            bound_count = min(bound_count_temp + 1, 2);
            animation_skip = true;
            audio_play_sfx("snd_bound_land", true);
            return player_set_state(player_state_jump);
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        player_gravity_force();

        sonic_bound_create();
        break;

    case STATE_FINISH:
        break;
}
