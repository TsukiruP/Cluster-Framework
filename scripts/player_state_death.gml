/// player_state_death(phase)
/// @desc One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        depth = -10000;
        x_speed = 0;
        death_alarm = 64;
        boost_mode = false;
        player_reset_air();
        player_reset_status();
        player_set_animation("death");
        if (clock_up_state != 0) classic_trait_clock_up(true);
        break;

    case STATE_STEP:
        x += dsin(gravity_direction) * y_speed;
        y += dcos(gravity_direction) * y_speed;

        y_speed += gravity_force_temp;

        if (death_alarm > 0)
        {
            death_alarm -= 1;

            if (death_alarm == 0 && !input_cpu && !instance_exists(death_inst))
            {
                death_inst = transition_create(room, TRANS_RETRY);
            }
        }
        break;

    case STATE_FINISH:
        with (death_inst) instance_destroy();
        death_inst = noone;
        drown = false;
        break;
}
