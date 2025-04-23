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

        if (player_routine_jump()) return true;
        if (animation_trigger) return player_set_state(player_state_idle);
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
