/// player_action_default()
//

// Wait:
if (ground == true && input_lock == false && tag_animations == false && animation_current == "stand") {
    if (animation_alarm > 0) {
        animation_alarm -= 1;

        if (animation_alarm == 0) {
            player_set_animation("wait");
        }
    }
} else if (animation_current != "wait") {
    animation_alarm = 360;
}

// Turn:
if (ground == true && animation_current == "turn" && animation_finished == true) {
    player_set_animation("stand");
}

// Balance:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge = (!player_line_check(main_width, main_height + 16, true) && !player_obstacle_check(-wall_width, 0, wall_width, main_height + 2, true));
    right_edge = (!player_line_check(-main_width, main_height + 16, true) && !player_obstacle_check(wall_width, 0, -wall_width, main_height + 2, true));

    if (ground_angle == gravity_angle) {
        // Classic balance behavior:
        if (character_data == CHAR_CLASSIC) {
            var left_edge_classic, right_edge_classic;

            left_edge_classic = (!player_line_check(main_width / 2, main_height + 16, true) && !player_obstacle_check(-wall_width / 2, 0, wall_width / 2, main_height + 2, true));
            right_edge_classic = (!player_line_check(-main_width / 2, main_height + 16, true) && !player_obstacle_check(wall_width / 2, 0, -wall_width / 2, main_height + 2, true));

            balance_direction = (left_edge - right_edge) + (left_edge_classic - right_edge_classic);
        }

        // Advance balance behavior:
        else {
            balance_direction = (left_edge - right_edge);
        }
    }

    // Reset balance direction:
    else {
        balance_direction = 0;
    }
}

// Push:
if ((player_point_check((wall_width + 1) * animation_direction, wall_height) && abs(g_speed) <= acceleration + 0.5) ||
    (player_obstacle_check((wall_width + 1 * animation_direction), main_height, (wall_width + 1 * animation_direction), main_height) && abs(g_speed) <= acceleration)) {
    if (ground == true && input_direction != 0 && animation_direction == input_direction) push_animation = true;
    else push_animation = false;
}

// Crouch:
if (ctl_position(0) && animation_current == "crouch" && animation_trigger == true) {
    player_set_animation("stand");
}

// Hurt:
if (ground == true && action_state == ACTION_HURT) {
    action_state = ACTION_DEFAULT;
    g_speed      = 0;
}
