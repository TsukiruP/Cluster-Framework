/// player_state_trick(phase)
/// @desc
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_animation_trick();
        audio_play_sfx("snd_trick", true);
        break;

    case STATE_STEP:
        if (!trick_windup)
        {
            if (input_x_direction != 0 && (!(character_index == CHAR_KNUX && trick_index == TRICK_UP) || y_speed > 0))
            {
                if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
                {
                    x_speed += (acceleration * 2) * input_x_direction;
                    if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) x_speed = top_speed * input_x_direction;
                }
            }
        }

        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;
        if (player_routine_skill()) return true;

        if (trick_windup && animation_trigger)
        {
            trick_windup = false;
            player_set_trick_speed();
        }
        else if (!trick_windup)
        {
            if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
            if (character_index == CHAR_MILES && (trick_index == TRICK_FRONT || trick_index == TRICK_BACK))
            {
                var trick_force; trick_force = pick(underwater, gravity_force, gravity_force_underwater);

                if (y_speed < 0) trick_force /= 2;
                y_speed += trick_force;
            }
            else player_gravity_force();
        }

        player_animation_trick();
        break;

    case STATE_FINISH:
        break;
}
