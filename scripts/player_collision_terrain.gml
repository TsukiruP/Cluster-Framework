/// player_collision_terrain()

// Exit if ground collision is disabled:
if (ground_collision_allow == false) exit;

// Left wall collision:
while (player_point_check(-wall_left * animation_direction, wall_height)) {
    x += (y_direction * animation_direction);
    y -= (x_direction * animation_direction);
}

// Right wall collision:
while (player_point_check(wall_right * animation_direction, wall_height)) {
    x -= (y_direction * animation_direction);
    y += (x_direction * animation_direction);
}

if (on_obstacle == false) {
    // Landing:
    if (ground == false && y_speed > 0) {
        if (player_line_check(-main_left * animation_direction, main_bottom, true) || player_line_check(main_right * animation_direction, main_bottom, true)) {
            ground  = true;
            landed  = true;
            g_speed = x_speed;
            player_set_angle();

            // Landing speed (From 24 to 90 degrees):
            if (ground_angle >= 24 && ground_angle <= 90) {
                if (ground_angle >= 45) {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed * -1;
                    } else {
                        g_speed = x_speed;
                    }
                } else {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = (y_speed / 2) * -1;
                    } else {
                        g_speed = x_speed;
                    }
                }
            }

            // Landing speed (From 270 to 336 degrees):
            else if (ground_angle >= 270 && ground_angle <= 336) {
                if (ground_angle <= 315) {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed;
                    } else {
                        g_speed = x_speed;
                    }
                } else {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed / 2;
                    } else {
                        g_speed = x_speed;
                    }
                }
            }
        }
    }

    // Slope collision:
    if (ground == true) {
        var detach_distance;

        // Detach distance:
        if (on_edge == true) detach_distance = 1;
        else detach_distance = 16;

        // Detach:
        if (detach_allow == true && roll_forced == false && !player_line_check(-main_left * animation_direction, main_bottom + detach_distance, true) && !player_line_check(main_right * animation_direction, main_bottom + detach_distance, true)) {
            ground = false;
        }

        // Move down slopes:
        if (on_edge == false && (player_line_check(-main_left * animation_direction, main_bottom + 16, true) || player_line_check(main_right * animation_direction, main_bottom + 16, true))) {
            while(!player_line_check(main_right * animation_direction, main_bottom, true) && !player_line_check(-main_left * animation_direction, main_bottom, true)) {
                x += x_direction;
                y += y_direction;
            }
        }

        // Move up slopes:
        while (player_line_check(-main_left * animation_direction, main_bottom, true) || player_line_check(main_right * animation_direction, main_bottom, true)) {
            x -= x_direction;
            y -= y_direction;
        }
    }

    // Ground angle detection:
    player_set_angle();

    // Ceiling collision:
    if (ground == false)
    {
        if (angle_mode == 0)
        {
            // Start ceiling landing:
            if (ground == false && ceiling_allow == true && y_speed < -2.5 && (player_point_check(-main_left * animation_direction, -main_top) || player_point_check(main_right * animation_direction, -main_top))) {
                ceiling_landing = 1;
            }

            if (ceiling_landing == 1) {
                var temp_angle;

                // Set temp ground_angle:
                if (player_point_check(-main_left * animation_direction, -main_top)) {
                    temp_angle = player_get_angle(floor(x) - main_left * animation_direction, floor(y) - main_top, 2);
                } else {
                    temp_angle = player_get_angle(floor(x) + main_right * animation_direction, floor(y) - main_top, 2);
                }

                if (temp_angle >= 90 && temp_angle <= 180 - 45 || (temp_angle >= 180 + 45 && temp_angle <= 270)) {
                    ground_angle    = temp_angle;
                    ceiling_landing = 2;
                } else {
                    ground_angle           = 0;
                    ceiling_landing = 0;
                }
            }

            if (ceiling_landing == 2) {
                if (ground_angle < 180) {
                    x_speed = -y_speed;
                } else {
                    x_speed = y_speed;
                }

                ground             = true;
                ceiling_landing    = 0;
                ceiling_lock_alarm = 16;
                state              = ACTION_DEFAULT;
                input_lock_alarm   = 2;

            }
        }

        if (mode == 0) {
            while (player_line_check(-main_left * animation_direction, -main_top) || player_line_check(main_right * animation_direction, -main_top)) {
                y += 1;

                // Stop y speed:
                if (y_speed < 0) y_speed = 0;
            }
        }
    }
}
