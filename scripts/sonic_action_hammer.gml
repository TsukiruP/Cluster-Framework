/// sonic_action_hammer()

if (ground == true && action_state == ACTION_DEFAULT && player_input[INP_SPECIAL, CHECK_PRESSED]) {
    g_speed      = 0;
    action_state = ACTION_ATTACK;

    player_set_animation("hammer");
}

if (action_state == ACTION_ATTACK) {
    if (animation_finished == true) action_state = ACTION_DEFAULT;
}
