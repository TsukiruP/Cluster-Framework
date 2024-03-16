/// player_action_balance()
// Hanging on the edge of tomorrow!
/*
// Balance direction:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge = (!line_check(main_width, main_height + 16, true) && !obstacle_check(-wall_width, 0, wall_width, main_height + 2, true));
    right_edge = (!line_check(-main_width, main_height + 16, true) && !obstacle_check(wall_width, 0, -wall_width, main_height + 2, true));

    balance_direction = (left_edge - right_edge);
}


// Trigger balance:
if (ground == true && ground_angle == gravity_angle && x_speed == 0 && balance_direction != 0 && tag_animations == false) {
    if (action_state == ACTION_DEFAULT) action_state = ACTION_BALANCE;
}
else {
    if (action_state == ACTION_BALANCE) action_state = ACTION_DEFAULT;
}


// Balance direction:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge  = (player_collision_left_edge(x, y, 8) && !player_collision_right_edge(x, y, 352));
    right_edge = (!player_collision_left_edge(x, y, 8) && player_collision_right_edge(x, y, 352));

    if (character_data == CHAR_CLASSIC) {
        var left_edge_classic, right_edge_classic;

        // Classic edges:
        left_edge_classic  = (player_collision_left_edge(x, y, 16) && !player_collision_right_edge(x, y, 344));
        right_edge_classic = (!player_collision_left_edge(x, y, 16) && player_collision_right_edge(x, y, 344));

        balance_direction   = (left_edge - right_edge) + (left_edge_classic - right_edge_classic);
    }

    else {
        balance_direction = (left_edge - right_edge);
    }
}

// Trigger balance:
if (ground == true && angle == gravity_angle && x_speed == 0 && balance_direction != 0 && tag_animations == false) {
    if (action_state == ACTION_DEFAULT) {
        action_state = ACTION_BALANCE;

        if (character_data = CHAR_CLASSIC) animation_direction = sign(balance_direction);
    }
}

// Cancel balance:
else {
    if (action_state == ACTION_BALANCE) action_state = ACTION_DEFAULT;
}
