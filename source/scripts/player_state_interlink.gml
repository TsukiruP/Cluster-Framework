/// player_state_interlink(phase)
/// @desc Do you have the courage to ride with the devil?
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_set_animation("roll");
        break;

    case STATE_STEP:
        break;

    case STATE_FINISH:
        player_reset_tag();
        break;
}
