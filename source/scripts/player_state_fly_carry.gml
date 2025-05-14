/// player_state_fly_carry(phase)
/// @desc
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_set_animation("fly_carry");
        break;

    case STATE_STEP:
        var fly_inst; fly_inst = stage_get_player(pick(player_index, 1, 0));

        if (!player_movement_air())
        {
            fly_inst.fly_carry_alarm = 30;
            return false;
        }

        if (player_routine_land())
        {
           fly_inst.fly_carry_alarm = 30;
           return true;
        }

        if (pick(mask_direction mod 180 == 0, floor(y) != floor(fly_inst.y), floor(x) != floor(fly_inst.x)) || fly_inst.state_current != miles_state_fly)
        {
            fly_inst.fly_carry_alarm = 30;
            return player_set_state(player_state_air);
        }

        if ((!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0)) && player_get_input(INP_DOWN, CHECK_HELD))
        {
            if (player_routine_jump())
            {
                y_speed = pick(underwater, -4, -2);
                return true;
            }
        }
        break;

    case STATE_FINISH:
        break;
}
