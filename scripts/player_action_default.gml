/// player_action_default()
//

// Balance direction:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge = (!line_check(main_width, main_height + 16, true) && !obstacle_check(-wall_width, 0, wall_width, main_height + 2, true));
    right_edge = (!line_check(-main_width, main_height + 16, true) && !obstacle_check(wall_width, 0, -wall_width, main_height + 2, true));

    if (ground_angle == gravity_angle) balance_direction = (left_edge - right_edge);
    else balance_direction = 0;
}
