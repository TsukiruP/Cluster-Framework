/// player_action_default()
//

// Balance:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge = (!line_check(main_width, main_height + 16, true) && !obstacle_check(-wall_width, 0, wall_width, main_height + 2, true));
    right_edge = (!line_check(-main_width, main_height + 16, true) && !obstacle_check(wall_width, 0, -wall_width, main_height + 2, true));

    if (ground_angle == gravity_angle) balance_direction = (left_edge - right_edge);
    else balance_direction = 0;
}

// Push:
if ((point_check((wall_width + 1) * animation_direction, wall_height) && abs(g_speed) <= acceleration + 0.5) ||
    (obstacle_check((wall_width + 1 * animation_direction), main_height, (wall_width + 1 * animation_direction), main_height) && abs(g_speed) <= acceleration)) {
    if (ground == true && input_direction != 0 && animation_direction == input_direction) push_animation = true;
    else push_animation = false;
}
