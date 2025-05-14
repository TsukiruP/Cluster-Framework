/// sonic_state_accel(phase)
/// @desc Start Up.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("spin_dash");
        break;

    case STATE_STEP:
        if (!on_ground)
        {
            if (!player_movement_air()) return false;
            if (player_routine_land()) return true;
        }
        else if (!player_movement_ground()) return false;

        if (animation_time == 9)
        {
            player_set_state(pick(on_ground, player_state_jump, player_state_idle));
            if (!on_ground) y_speed = 0;
            return true;
        }
        break;

    case STATE_FINISH:
        break;
}
