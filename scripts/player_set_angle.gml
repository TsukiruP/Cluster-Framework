/// player_set_angle()

// Exit if ground collision is disabled:
if (ground_collision_allow == false) exit;

var new_angle, pos_x, pos_y;

// Initialize new angle:
new_angle = 0;

// Reset edge flag:
on_edge = false;

// Ground:
if (ground == true) {
    // New angle:
    if (on_edge == false && on_obstacle == false) {
        // Get new angle from left sensor:
        if (player_line_check(-main_left * animation_direction, main_bottom + 1, true) && !player_line_check(main_right * animation_direction, main_bottom + 1, true)) {
            pos_x = floor(x) - main_left * animation_direction * abs(y_direction);
            pos_y = floor(y) + main_left * animation_direction * x_direction;

            // Return new angle:
            new_angle = player_get_angle(pos_x, pos_y, mode);
        }

        // Get new angle from right sensor:
        if (!player_line_check(-main_left * animation_direction, main_bottom + 1, true) && player_line_check(main_right * animation_direction, main_bottom + 1, true)) {
            pos_x = floor(x) + main_right * animation_direction * abs(y_direction);
            pos_y = floor(y) - main_right * animation_direction * x_direction;

            // Return new angle:
            new_angle = player_get_angle(pos_x, pos_y, mode);
        }

        // Force angle to the proper mode if on flat terrain:
        if (player_line_check(-main_left * animation_direction, main_bottom + 1, true) && player_line_check(main_right * animation_direction, main_bottom + 1, true)) {
            new_angle = 90 * mode;
        }
    }
}

// Floor ramp fixes:
if (mode == 0 && landed == false && ground_angle == 0) {
    // Left ramp edge:
    if (!player_line_check(-main_left * animation_direction, main_bottom + 1, true) && player_line_check(main_right * animation_direction, main_bottom + 1, true)) {
        var temp_angle, angle_diff;

        // Temporary angle:
        temp_angle = player_get_angle(x - (wall_left * animation_direction), y + main_bottom, 0);

        // Difference between ground angle and temp angle:
        angle_diff = abs(ground_angle - temp_angle);

        // Check steepness:
        if (angle_diff > 45 && angle_diff <= 270) {
            new_angle = 0;
            on_edge   = true;
        }
    }

    // Right ramp edge:
    if (player_line_check(-main_left * animation_direction, main_bottom + 1, true) && !player_line_check(main_right * animation_direction, main_bottom + 1, true)) {
        var temp_angle, angle_diff;

        // Temporary angle:
        temp_angle = player_get_angle(x + (wall_right * animation_direction), y + main_bottom, 0);

        // Difference between ground angle and temp angle:
        angle_diff = abs(ground_angle - temp_angle);

        // Check steepness:
        if (angle_diff >= 270 && angle_diff < 315) {
            on_edge = true;
        }
    }
}

// Set angle:
ground_angle = new_angle;
