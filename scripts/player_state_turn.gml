/// player_state_turn(phase)
// Turn around, every now and then I get a little bit lonely...

switch (argument0)
{
    // Start:
    case STATE_START:
        // Flip:
        image_xscale *= -1;

        // Reset speed:
        x_speed = 0;

        // Set animation:
        if (animation_current != "turn" && animation_current != "turn_brake")
        {
            player_set_animation("turn");
        }
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

        // Idle:
        if (animation_finished == true)
        {
            player_set_state(player_state_idle);
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
