/// player_state_hurt(phase)
/// @desc Ouchie ouch ouch.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_reset_air();
        player_set_animation("hurt");
        if (clock_up_state != 0) classic_trait_clock_up(true);
        break;

    case STATE_STEP:
        if (!player_movement_air()) return false;

        if (player_routine_land())
        {
            if (!game_get_config("advance_hurt") || character_index == CHAR_CLASSIC) x_speed = 0;
            y_speed = 0;
            return true;
        }

        y_speed += gravity_force;
        break;

    case STATE_FINISH:
        status_invin_alarm = 120;
        break;
}
