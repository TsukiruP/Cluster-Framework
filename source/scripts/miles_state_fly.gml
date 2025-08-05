/// miles_state_fly(phase)
/// @desc Spin your tails and prepare for a force.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        fly_force = fly_force_temp;
        player_reset_air();
        miles_animation_fly();
        break;

    case STATE_STEP:
        if (input_x_direction != 0)
        {
            if (sign(image_xscale) != input_x_direction && fly_time < fly_max_time) player_set_animation("fly_turn");
            image_xscale = input_x_direction;

            if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
            {
                x_speed += (acceleration * 2) * input_x_direction;
                if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) x_speed = top_speed * input_x_direction;
            }
        }

        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;
        if (miles_skill_air()) return true;

        if (y_speed < fly_threshold || fly_alarm == 0) fly_force = fly_force_temp;

        player_air_friction();
        y_speed += fly_force;
        if (y < 0 && y_speed < 0) y_speed = 0;

        if (fly_time < fly_max_time) fly_time += 1;
        if (fly_alarm > 0) fly_alarm -= 1;
        
        if ((!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0)) && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
        {
            player_set_animation("fly_cancel");
            return player_set_state(player_state_air);
        }

        if (fly_time < fly_max_time)
        {
            if (player_get_input(INP_JUMP, save_get_skill(CHAR_MILES, "fly_controls")))
            {
                fly_force = fly_force_alt;
                fly_alarm = 60;
            }
            
            if (!underwater && fly_hammer) return player_set_state(miles_state_fly_hammer, false);
        }

        miles_animation_fly();
        miles_trait_fly_carry();

        if (!underwater || fly_carry)
        {
            if (fly_time < fly_max_time)
            {
                if (!sound_isplaying("snd_fly"))
                {
                    audio_stop_sfx(fly_sfx);
                    fly_sfx = audio_loop_sfx("snd_fly", true);
                }
            }
            else if (!sound_isplaying("snd_fly_drop"))
            {
                audio_stop_sfx(fly_sfx);
                fly_sfx = audio_loop_sfx("snd_fly_drop", true);
            }
        }
        else audio_stop_sfx(fly_sfx);
        break;

    case STATE_FINISH:
        audio_stop_sfx(fly_sfx);
        break;
}
