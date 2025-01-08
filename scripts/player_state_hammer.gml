/// player_state_hammer()
// Gigant hammer.

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set speed:
        x_speed = 0;

        // Set animation:
        player_set_animation("hammer");
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

        // Idle:
        if (animation_finished == true)
        {
            return player_set_state(player_state_idle);
        }

        // Jump:
        if (player_routine_jump())
        {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
