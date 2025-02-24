/// player_state_standby(phase)
/// @desc 555-913-2003
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        break;

    case STATE_STEP:
        return player_set_state(player_state_idle);
        break;

    case STATE_FINISH:
        break;
}