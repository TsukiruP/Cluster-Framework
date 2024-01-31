/// player_action_push()
// Sisyphus Adventure 3.

/*
if (ground == true && input_direction != 0 && animation_direction == input_direction &&
    ((point_check((wall_width + 1) * animation_direction, wall_height) && abs(g_speed) <= acceleration + 0.5) ||
    (obstacle_check((wall_width + 1 * animation_direction), main_height, (wall_width + 1 * animation_direction), main_height) && abs(g_speed) <= acceleration))) {
    if (action_state == ACTION_DEFAULT) action_state = ACTION_PUSH;
}
else {
    if (action_state == ACTION_PUSH) action_state = ACTION_DEFAULT;
}
