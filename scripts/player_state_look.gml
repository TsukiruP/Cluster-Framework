/// player_state_look(phase)
// Eyes on the sky.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set animation:
        player_set_animation("look");
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

            // Deploy input lock:
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }

        // Slope friction:
        player_slope_friction(slope_friction);

        // Idle:
        if (animation_trigger == true && !player_get_input(INP_UP, CHECK_HELD))
        {
            // Set animation:
            player_set_animation("look_end");
            return player_set_state(player_state_idle);
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
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
