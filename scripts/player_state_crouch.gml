/// player_state_crouch(phase)
// Eyes on the ground.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set animation:
        player_set_animation("crouch");
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground())
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
            else
            {
                // Deploy input lock:
                input_lock_alarm = 30;
                return player_set_state(player_state_run);
            }
        }

        // Slope friction:
        player_slope_friction(slope_friction);

        // Idle:
        if (animation_trigger == true && !player_get_input(INP_DOWN, CHECK_HELD))
        {
            // Set animation:
            player_set_animation("crouch_end");

            return player_set_state(player_state_idle);
        }

        // Skill:
        if (player_routine_skill())
        {
            return false;
        }

        // Spin Dash:
        if (player_get_input(INP_JUMP, CHECK_PRESSED))
        {
            return player_set_state(player_state_spin_dash);
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
