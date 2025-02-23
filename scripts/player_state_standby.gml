/// player_state_standby(phase)
/* 555-913-2003 */

switch (argument0)
{
    case STATE_START:
        break;

    case STATE_STEP:
        return player_set_state(player_state_idle);
        break;

    case STATE_FINISH:
        break;
}