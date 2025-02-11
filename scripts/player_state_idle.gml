/// player_state_idle(phase)
/* Standing here, I realize... */

switch (argument0)
{
    case STATE_START:
        wait_alarm = 360;

        if (player_get_cliff() == 0)
        {
            if (animation_current != "wait" && animation_current != "standby" && animation_current != "land" &&
                animation_current != "look" && animation_current != "look_end" && animation_current != "crouch_end" &&
                animation_current != "omochao" && animation_current != "omochao_end")
            {
                player_set_animation("stand");
            }
        }
        else
        {
            if (sign(image_xscale) == cliff_direction) player_set_animation("cliff_front");
            else player_set_animation("cliff_back");
        }
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

        if ((game_get_config("advance_turn") && character_index != CHAR_CLASSIC) && input_x_direction != 0 && sign(image_xscale) != input_x_direction)
        {
            return player_set_state(player_state_turn);
        }

        if (x_speed != 0 || input_x_direction != 0) return player_set_state(player_state_run);

        if (cliff_direction == 0)
        {
            switch (input_y_direction)
            {
                case -1:
                    if (animation_current != "look_end") return player_set_state(player_state_look);
                    break;

                case 1:
                    if (animation_current != "crouch_end") return player_set_state(player_state_crouch);
                    break;
            }
        }

        if (player_routine_skill()) return true;
        if (player_routine_jump()) return true;

        if (!game_ispaused(ctrl_text) && on_ground && input_allow && animation_current == "stand")
        {
            if (wait_alarm > 0)
            {
                wait_alarm -= 1;
                if (wait_alarm == 0) player_set_animation("wait");
            }
        }
        break;

    case STATE_FINISH:
        break;
}
