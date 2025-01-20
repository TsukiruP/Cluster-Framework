/// player_state_hammer()
/* Gigant hammer. */

switch (argument0)
{
    case STATE_START:
        x_speed = 0;
        player_set_animation("hammer");
        break;

    case STATE_STEP:
        if (!player_movement_ground())
        {
            return false;
        }

        if (!on_ground)
        {
            return player_set_state(player_state_air);
        }

        if (animation_finished)
        {
            return player_set_state(player_state_idle);
        }

        if (player_routine_jump())
        {
            return true;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
