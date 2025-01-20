/// player_state_hurt(phase)
/* Ouchie ouch ouch. */

switch (argument0)
{
    case STATE_START:
        if (clock_up_state != 0)
        {
            classic_trait_clock_up(true);
        }

        player_reset_air();
        player_set_animation("hurt");
        break;

    case STATE_STEP:
        if (!player_movement_air())
        {
            return false;
        }

        if (player_routine_land())
        {
            if (!game_get_config("advance_hurt") || character_id == CHAR_CLASSIC)
            {
                x_speed = 0;
            }

            y_speed = 0;
            return true;
        }

        // Gravity:
        if (y_allow)
        {
            y_speed += gravity_force;
        }
        break;

    case STATE_FINISH:
        status_invin_alarm = 120;
        break;
}
