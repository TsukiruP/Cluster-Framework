/// player_state_hammer()
/// @desc Gigant hammer.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        player_set_animation("hammer");
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        if (player_routine_jump()) return true;
        if (animation_trigger) return player_set_state(player_state_idle);
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
