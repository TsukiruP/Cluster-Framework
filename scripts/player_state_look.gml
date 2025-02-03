/// player_state_look(phase)
/* Eyes on the sky. */

switch (argument0)
{
    case STATE_START:
        player_set_animation("look");
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

        if (animation_trigger && !player_get_input(INP_UP, CHECK_HELD))
        {
            player_set_animation("look_end");
            return player_set_state(player_state_idle);
        }

        if (player_routine_skill()) return true;
        if (player_routine_jump()) return true;
        break;

    case STATE_FINISH:
        break;
}
