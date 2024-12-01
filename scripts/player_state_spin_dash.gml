/// player_state_spin_dash(phase)
// Charge and Up.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Charge:
        spin_dash_charge = 0;

        // Set animation:
        player_set_animation("spin_dash");

        // Play SFX:
        audio_sfx_play("snd_spin_dash_charge", true);

        // Create dust:
        with (instance_create(x, y, eff_spin_dash))
        {
            player_handle = other.id;
        }
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground())
        {
            return false;
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
                // Deploy input lock:
                input_lock_alarm = 30;

                // Play SFX:
                audio_sfx_play("snd_roll", true);

                return player_set_state(player_state_roll);
            }
        }

        // Release:
        if (!player_get_input(INP_DOWN, CHECK_HELD))
        {
            // Set speed:
            x_speed = (8 + (spin_dash_charge div 2)) * image_xscale;

            // Camera lag:
            if (input_cpu == false)
            {
                mgr_camera.camera_lag_alarm = 16;
            }

            // Play SFX:
            audio_sfx_play("snd_spin_dash_release", true);

            // Stop SFX:
            audio_sfx_stop("snd_spin_dash_charge");

            return player_set_state(player_state_roll);
        }

        // Charge:
        if (player_get_input(INP_JUMP, CHECK_PRESSED))
        {
            var sfx_spin_dash;

            spin_dash_charge = min(spin_dash_charge + 2, 8);

            // Set animation:
            player_set_animation("spin_charge");

            // Play SFX:
            sfx_spin_dash = audio_sfx_play("snd_spin_dash_charge", true);
            audio_pitch(sfx_spin_dash, 1 + spin_dash_charge * 0.0625);
        }

        // Atrophy:
        if (spin_dash_charge > 0)
        {
            spin_dash_charge *= 0.96875;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
