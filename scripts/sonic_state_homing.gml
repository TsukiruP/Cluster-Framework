/// sonic_state_homing(phase)
/* In the middle of a jump, press A button to perform the Homing Attack. Remember to aim toward the enemy! */

switch (argument0)
{
    case STATE_START:
        var homing_angle;

        homing_angle = direction_to_object(homing_handle);
        x_speed = lengthdir_x(homing_speed, homing_angle);
        y_speed = lengthdir_y(homing_speed, homing_angle);
        player_reset_air();
        player_set_animation("spin");
        audio_play_sfx("snd_air_dash", true);
        break;

    case STATE_STEP:
        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;
        if (!instance_exists(homing_handle)) return player_set_state(player_state_jump, false);
        break;

    case STATE_FINISH:
        break;
}
