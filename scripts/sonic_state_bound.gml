/// sonic_state_bound()
/// @desc Sonic's Bound Jump.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        jump_cap = false;
        jump_bound = BOUND_SONIC;
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
            bound_count = min(bound_count_temp + 1, 2);
            animation_skip = true;
            audio_play_sfx("snd_bound_land", true);
            return player_set_state(player_state_jump, true);
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        y_speed += gravity_force;

        if (y_speed > 0 && animation_time mod 2 == 0) effect_create(x, y, seq_bound_jump, 10);
        break;

    case STATE_FINISH:
        if (state_current != player_state_jump) jump_bound = BOUND_NONE;
        break;
}
