/// player_state_air(phase)
/// @desc Falling with style.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_reset_air_speed();
        player_animation_air();
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
        if (player_routine_land()) return true;
        if (player_routine_skill()) return true;

        player_air_friction();
        player_gravity_force();
        player_animation_air();
        break;

    case STATE_FINISH:
        break;
}
