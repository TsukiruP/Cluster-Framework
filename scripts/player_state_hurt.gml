/// player_state_hurt(phase)
// Ouchie ouch ouch.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Clock over:
        if (clock_up_state != 0)
        {
            classic_trait_clock_up(true);
        }

        // Reset air:
        player_reset_air();
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_air())
        {
            exit;
        }

        // Land:
        if (player_routine_land())
        {
            if (global.advance_hurt == false)
            {
                x_speed = 0;
            }

            y_speed = 0;

            return true;
        }

        // Gravity:
        if (y_allow == true)
        {
            y_speed += gravity_force;
        }
        break;

    // Finish:
    case STATE_FINISH:
        // Set invincibility:
        status_invin_alarm = 120;
        break;
}
