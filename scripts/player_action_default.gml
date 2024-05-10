/// player_action_default()
//

// Turn:
if (ground == true && animation_current == "turn" && animation_finished == true) {
    player_set_animation("stand");
}

// Balance:
if (ground == true) {
    var left_edge, right_edge;

    // Edges:
    left_edge = (!player_line_check(main_right * animation_direction, main_bottom + 16, true) && !player_obstacle_check(-wall_left * animation_direction, 0, wall_right * animation_direction, main_bottom + 2, true));
    right_edge = (!player_line_check(-main_left * animation_direction, main_bottom + 16, true) && !player_obstacle_check(wall_right * animation_direction, 0, -wall_left * animation_direction, main_bottom + 2, true));

    if (ground_angle == gravity_angle) {
        // Classic balance behavior:
        if (character_data == CHAR_CLASSIC) {
            var left_edge_classic, right_edge_classic;

            left_edge_classic = (!player_line_check((main_right * animation_direction) / 2, main_bottom + 16, true) && !player_obstacle_check((-wall_left * animation_direction) / 2, 0, (wall_right * animation_direction) / 2, main_bottom + 2, true));
            right_edge_classic = (!player_line_check((-main_left * animation_direction) / 2, main_bottom + 16, true) && !player_obstacle_check((wall_right * animation_direction) / 2, 0, (-wall_left * animation_direction) / 2, main_bottom + 2, true));

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

/*
// Push:
if ((player_point_check((wall_width + 1) * animation_direction, wall_height) && abs(g_speed) <= acceleration + 0.5) ||
    (player_obstacle_check((wall_width + 1 * animation_direction), main_top, (wall_width + 1 * animation_direction), main_bottom) && abs(g_speed) <= acceleration)) {
    if (ground == true && input_direction != 0 && animation_direction == input_direction) push_animation = true;
    else push_animation = false;
}
*/

// Hurt:
if (ground == true && action_state == ACTION_HURT) {
    action_state = ACTION_DEFAULT;
    g_speed      = 0;
}

// Invincibility:
if (invincibility_type == 1 && invincibility_alarm == -1) {
    if (ground == true || action_state != ACTION_HURT) invincibility_alarm = 120;
}
