/// sonic_state_peel_out(phase)
/* I'm (peeling) outta here! */

switch (argument0)
{
    case STATE_START:
        peel_out_alarm = 30;
        player_set_animation("peel_out");
        audio_play_sfx("snd_peel_out_charge", true);
        break;

    case STATE_STEP:
        if (!player_movement_ground())
        {
            return false;
        }
        
        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315)
        {
            if (relative_angle >= 90 && relative_angle <= 270)
            {
                return player_set_state(player_state_air);
            }
            
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }
        
        if (!player_get_input(INP_UP, CHECK_HELD))
        {
            if (peel_out_alarm == 0)
            {
                // Set speed:
                x_speed = 12 * image_xscale;
                
                if (input_cpu == false)
                {
                    camera_set_lag(16);
                }
                
                x_speed = 12 * image_xscale;
                peel_out = true;
                audio_play_sfx("snd_peel_out_release", true);
                audio_stop_sfx("snd_peel_out_charge")
            }
            
            return player_set_state(player_state_run);
        }
        
        if (peel_out_alarm > 0)
        {
            peel_out_alarm -= 1;
        }
        break;

    case STATE_FINISH:
        break;
}
