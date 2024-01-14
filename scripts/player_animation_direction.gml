/// player_animation_direction()
// Sets the animation direction based on the current action and/or input:

// General:
if ((ground == true && action_state == ACTION_DEFAULT && animation_current != "turn") || action_state == ACTION_ROLL || action_state == ACTION_BREATHE) {
    // Left:
    if ((x_speed <= 0 || g_speed <= 0) && player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    // Right:
    if ((x_speed >= 0 || g_speed >= 0) && player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}

// Airborne:
if ((ground == false && action_state == ACTION_DEFAULT) || action_state == ACTION_JUMP || action_state == ACTION_FLY) {
    // Left:
    if (player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    // Right:
    if (player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}
