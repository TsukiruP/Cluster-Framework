/// sonic_state_homing(phase)
// In the middle of a jump, press A button to perform the Homing Attack. Remember to aim toward the enemy!

switch (argument0)
{
    // Start:
    case STATE_START:
        var homing_angle;

        // Set speed:
        homing_angle = direction_to_object(homing_handle);

        x_speed = lengthdir_x(homing_speed, homing_angle);
        y_speed = lengthdir_y(homing_speed, homing_angle);

        // Reset air:
        player_reset_air();

        // Set animation:
        player_set_animation("spin");

        // Play sound:
        audio_play_sfx("snd_air_dash", true);
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_air())
        {
            exit;
        }

        // Land:
        if (player_routine_land())
        {
            return true;
        }

        // Reset:
        if (!instance_exists(homing_handle))
        {
            player_set_state(player_state_jump, false);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
