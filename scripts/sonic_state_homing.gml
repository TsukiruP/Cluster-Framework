/// sonic_state_homing(phase)
//

switch (argument0)
{
    // Start:
    case STATE_START:
        var homing_angle;

        // Set speed:
        homing_angle = direction_to_object(homing_handle);

        x_speed = lengthdir_x(homing_speed, homing_angle);
        y_speed = lengthdir_y(homing_speed, homing_angle);

        // Set animation:
        player_set_animation("spin");
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
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
