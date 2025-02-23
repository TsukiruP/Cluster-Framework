/// sonic_state_homing(phase)
/* In the middle of a jump, press A button to perform the Homing Attack. Remember to aim toward the enemy! */

switch (argument0)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        homing_alarm = 180;
        player_reset_air();
        player_set_animation("roll");
        audio_play_sfx("snd_air_dash", true);
        break;

    case STATE_STEP:
        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;

        if (homing_alarm == 0 || !instance_exists(homing_inst)) return player_set_state(player_state_jump, false);
        else
        {
            var homing_angle;

            homing_angle = angle_wrap(direction_to_object(homing_inst) - gravity_direction);
            x_speed = lengthdir_x(homing_speed, homing_angle);
            y_speed = lengthdir_y(homing_speed, homing_angle);
            homing_alarm -= 1;
        }
        break;

    case STATE_FINISH:
        break;
}
