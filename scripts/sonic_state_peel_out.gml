/// sonic_state_peel_out(phase)
//

switch (argument0)
{
    // Start:
    case STATE_START:
        // Set animation:
        player_set_animation("peel_out");
        break;

    // Step:
    case STATE_STEP:
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
