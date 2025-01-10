/// player_state_death(phase)
/* One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.
Sets the player's depth to be really high (but still below the water). */

switch (argument0)
{
    case STATE_START:
        if (clock_up_state != 0)
        {
            classic_trait_clock_up(true);
        }
        
        depth = -10000;
        x_speed = 0;
        death_alarm = 128;
        player_reset_air();
        player_reset_status();
        player_set_animation("death");
        break;

    case STATE_STEP:
        x += y_speed * dsin(gravity_direction);
        y += y_speed * dcos(gravity_direction);

        // Gravity:
        y_speed += gravity_force;

        if (death_alarm > 0)
        {
            death_alarm -= 1;

            if (death_alarm == 64)
            {
                if (input_cpu == false)
                {
                    if (!instance_exists(death_handle))
                    {
                        death_handle = transition_create(room, TRANS_RETRY);
                    }
                }
                else
                {
                    player_cpu_respawn(0);
                }
            }
        }
        break;

    case STATE_FINISH:
        if (instance_exists(death_handle))
        {
            with (death_handle)
            {
                instance_destroy();
            }

            death_handle = 0;
        }
        break;
}
