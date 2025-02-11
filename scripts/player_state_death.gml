/// player_state_death(phase)
/* One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.
Sets the player's depth to be really high (but still below the water). */

switch (argument0)
{
    case STATE_START:
        depth = -10000;
        x_speed = 0;
        death_alarm = 64;
        player_reset_air();
        player_reset_status();
        player_set_animation("death");
        if (clock_up_state != 0) classic_trait_clock_up(true);
        break;

    case STATE_STEP:
        x += dsin(gravity_direction) * y_speed;
        y += dcos(gravity_direction) * y_speed;

        y_speed += gravity_force;

        if (death_alarm > 0)
        {
            death_alarm -= 1;

            if (death_alarm == 0 && !input_cpu && !instance_exists(death_id))
            {
                death_id = transition_create(room, TRANS_RETRY);
            }
        }
        break;

    case STATE_FINISH:
        with (death_id) instance_destroy();
        death_id = noone;
        drown = false;
        break;
}
