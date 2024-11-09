/// sonic_state_peel_out(phase)
// I'm (peeling) outta here!

switch (argument0)
{
    // Start:
    case STATE_START:
        // Alarm:
        peel_out_alarm = 30;
        
        // Set animation:
        player_set_animation("peel_out");
        
        // Play sfx:
        sfx_play("snd_peel_out_charge", true);
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground())
        {
            exit;
        }
        
        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315)
        {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270)
            {
                return player_set_state(player_state_air);
            }
            else
            {
                input_lock_alarm = 30;

                return player_set_state(player_state_run);
            }
        }
        
        // Release:
        if (input_player[INP_UP, CHECK_HELD] == false)
        {
            if (peel_out_alarm == 0)
            {
                // Set speed:
                x_speed = 12 * image_xscale;
                
                // Camera lag:
                if (input_cpu == false)
                {
                    mgr_camera.camera_lag_alarm = 16;
                }
                
                // Peel Out:
                peel_out = true;
                
                // Play sfx:
                sfx_play("snd_peel_out_release", true);
                
                // Stop sfx:
                sfx_stop("snd_peel_out_charge")
            }
            
            return player_set_state(player_state_run);
        }
        
        // Alarm:
        if (peel_out_alarm > 0)
        {
            peel_out_alarm -= 1;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
