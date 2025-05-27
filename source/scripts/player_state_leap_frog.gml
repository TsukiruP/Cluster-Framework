/// player_state_leap_frog(phase)
/// @desc This was weirdly complicated to think about.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_set_animation("leap_frog");
        break;

    case STATE_STEP:
        if (animation_current == "leap_frog")
        {
            if (!player_movement_ground()) return false;

            if (animation_trigger)
            {
                x += 5 * image_xscale;
                y -= 5;
                x_speed = 2 * image_xscale;
                y_speed = -10;
                player_reset_air();
                player_set_animation("leap_flight");
            }
        }
        else
        {
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

            if (y_speed > 0) player_set_animation("leap_fall");
            else player_set_animation("leap_flight");
        }
        break;

    case STATE_FINISH:
        break;
}
