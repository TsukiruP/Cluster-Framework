/// player_state_spin_dash(phase)
/// @desc Charge and Up.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        spin_dash_charge = 0;
        player_set_animation("spin_dash");
        audio_play_sfx("snd_spin_dash_charge", true);
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_roll);

        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            audio_play_sfx("snd_roll", true);
            return player_set_state(player_state_run);
        }

        if (!player_get_input(INP_DOWN, CHECK_HELD))
        {
            x_speed = (8 + (spin_dash_charge div 2)) * image_xscale;
            audio_play_sfx("snd_spin_dash_release", true);
            audio_stop_sfx("snd_spin_dash_charge");
            if (!input_cpu) camera_set_lag(16);
            return player_set_state(player_state_roll);
        }

        if (player_get_input(INP_JUMP, CHECK_PRESSED))
        {
            spin_dash_charge = min(spin_dash_charge + 2, 8);
            player_set_animation("spin_charge");
            audio_play_sfx("snd_spin_dash_charge", true, 1 + spin_dash_charge * 0.0625);
        }

        if (spin_dash_charge > 0) spin_dash_charge *= 0.96875;
        break;

    case STATE_FINISH:
        break;
}