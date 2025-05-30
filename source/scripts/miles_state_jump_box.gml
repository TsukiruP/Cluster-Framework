/// miles_state_jump_box(phase)
/// @desc Also called a plyo box.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        player_set_animation("jump_box");
        break;

    case STATE_STEP:
        if (!player_movement_ground() || !hint_allow) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        if (animation_trigger) return player_set_state(player_state_idle);
        break;

    case STATE_FINISH:
        break;
}
