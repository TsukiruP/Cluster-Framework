/// player_state_crouch(phase)
/// @desc Eyes on the ground.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        player_set_animation("crouch");
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        player_slope_friction(slope_friction);
        if (x_speed != 0 || input_x_direction != 0) return player_set_state(player_state_run);
        if (player_routine_skill()) return true;
        if (tag_leader_state != STATE_FINISH && player_get_input(INP_JUMP, CHECK_PRESSED)) return player_set_state(player_state_spin_dash);

        if (animation_trigger && !player_get_input(INP_DOWN, CHECK_HELD))
        {
            player_set_animation("crouch_end");
            return player_set_state(player_state_idle);
        }
        break;

    case STATE_FINISH:
        break;
}
