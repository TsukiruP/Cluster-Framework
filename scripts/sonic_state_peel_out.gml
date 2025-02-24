/// sonic_state_peel_out(phase)
/// @desc I'm (peeling) outta here!
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        peel_out_alarm = 30;
        player_set_animation("peel_out");
        audio_play_sfx("snd_peel_out_charge", true);
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        
        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }
        
        if (!player_get_input(INP_UP, CHECK_HELD))
        {
            if (peel_out_alarm == 0)
            {
                x_speed = 12 * image_xscale;
                peel_out = true;
                audio_play_sfx("snd_peel_out_release", true);
                audio_stop_sfx("snd_peel_out_charge")
                if (!input_cpu) camera_set_lag(16);
            }
            
            return player_set_state(player_state_run);
        }
        
        if (peel_out_alarm > 0) peel_out_alarm -= 1;
        break;

    case STATE_FINISH:
        break;
}