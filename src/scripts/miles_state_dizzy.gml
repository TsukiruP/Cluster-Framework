/// miles_state_dizzy(phase)
/// @desc My head's spinning!
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("dizzy");
        break;

    case STATE_STEP:
        if (on_ground)
        {
            if (abs(x_speed) > 0) x_speed -= min(abs(x_speed), deceleration) * sign(x_speed);

            if (!player_movement_ground()) return false;

            if (!on_ground)
            {
                player_reset_air_speed();
                return true;
            }
        }
        else
        {
            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;

            player_gravity_force();
        }
        
        if (animation_trigger) return player_set_state(player_state_idle);
        break;

    case STATE_FINISH:
        break;
}
