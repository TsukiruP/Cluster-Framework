/// player_state_idle(phase)
// Standing here, I realize...

switch (argument0)
{
    // Start:
    case STATE_START:
        // Wait alarm:
        wait_alarm = 360;

        // Set animation:
        if (player_get_cliff() == 0)
        {
            if (animation_current != "stand" && animation_current != "wait" && animation_current != "ready" && animation_current != "land" &&
                animation_current != "look_end" && animation_current != "crouch_end" &&
                animation_current != "look" && animation_current != "omochao" && animation_current != "omochao_end")
            {
                player_set_animation("stand");
            }
        }
        else
        {
            if (image_xscale == cliff_direction)
            {
                player_set_animation("cliff_front");
            }
            else
            {
                player_set_animation("cliff_back");
            }
        }
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground())
        {
            return false;
        }

        // Hint:
        if (hint_allow == false)
        {
            return false;
        }

        // Fall:
        if (on_ground == false)
        {
            return player_set_state(player_state_air);
        }

        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315)
        {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270)
            {
                return player_set_state(player_state_air);
            }

            // Deploy input lock:
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        // Turn:
        if (game_get_config("advance_turn") && input_x_direction != 0 && image_xscale != input_x_direction)
        {
            return player_set_state(player_state_turn);
        }

        // Run:
        if (x_speed != 0 || input_x_direction != 0)
        {
            return player_set_state(player_state_run);
        }

        // Look:
        if (cliff_direction == 0)
        {
            switch (input_y_direction)
            {
                // Look:
                case -1:
                    if (animation_current != "look_end")
                    {
                        return player_set_state(player_state_look);
                    }
                    break;

                // Crouch:
                case 1:
                    if (animation_current != "crouch_end")
                    {
                        return player_set_state(player_state_crouch);
                    }
                    break;
            }
        }

        // Skill:
        if (player_routine_skill())
        {
            return false;
        }

        // Jump:
        if (player_routine_jump())
        {
            return false;
        }

        // Wait:
        if (!game_ispaused(mgr_text) && on_ground == true && input_lock == false && animation_current == "stand")
        {
            if (wait_alarm > 0)
            {
                wait_alarm -= 1;

                if (wait_alarm == 0)
                {
                    player_set_animation("wait");
                }
            }
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
