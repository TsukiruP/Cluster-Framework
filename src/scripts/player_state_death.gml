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
        player_gravity_force(gravity_force_temp);

        if (drown)
        {
            if (bubble_count < 11)
            {
                if (bubble_alarm > 0) bubble_alarm -= 1;

                if (bubble_alarm == 0)
                {
                    bubble_alarm = irandom_range(1, 8);
                    bubble_count += 1;
                    with (player_bubble_create()) size = choose_weighted(0, 3, 1, 1);
                }
            }
        }

        if (death_alarm > 0)
        {
            death_alarm -= 1;
            if (death_alarm == 0 && !input_cpu && !instance_exists(death_inst)) death_inst = transition_create(room, TRANS_RETRY);
        }
        break;

    case STATE_FINISH:
        with (death_inst) instance_destroy();
        death_inst = noone;
        player_reset_breath();
        break;
}
