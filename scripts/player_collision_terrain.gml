/// player_collision_terrain()
/*
// Exit if ground collision is disabled:
if (ground_collision_allow == false) {
    exit;
}

// Left wall collision:
while (player_terrain_point(-wall_left, wall_height)) {
    x += y_direction;
    y -= x_direction;
}

// Right wall collision:
while (player_terrain_point(wall_right, wall_height)) {
    x -= y_direction;
    y += x_direction;
}

if (on_obstacle == false) {
    // Landing:
    if (ground == false && y_speed > 0) {
        if (player_terrain_line(-main_left_rel, main_bottom, true) || player_terrain_line(main_right_rel, main_bottom, true)) {
            ground  = true;
            landed  = true;
            g_speed = x_speed;
            player_set_angle();

            // Landing speed (20 to 90 degrees):
            if (ground_angle >= 24 && ground_angle <= 90) {
                if (ground_angle >= 45) {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed * -1;
                    } else {
                        g_speed = x_speed;
                    }
                } else {
                    if (abs(x_speed) <= abs(y_speed / 2)) {
                        g_speed = (y_speed / 2) * -1;
                    } else {
                        g_speed = x_speed;
                    }
                }
            } else if (ground_angle >= 270 && ground_angle <= 336) {
                if (ground_angle <= 315) {
                    if (abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed;
                    } else {
                        g_speed = x_speed;
                    }
                } else {
                    if (abs(x_speed) <= abs(y_speed / 2)) {
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
        if (on_edge == true) {
            detach_distance = 1;
        } else {
            detach_distance = 16;
        }

        // Detach:
        if (detach_allow == true && roll_forced == false && !player_terrain_line(-main_left_rel, main_bottom + detach_distance, true) && !player_terrain_line(main_right_rel, main_bottom + detach_distance, true)) {
            ground = false;
        }

        // Move down slopes:
        if (on_edge == false && (player_terrain_line(-main_left_rel, main_bottom + 16, true) || player_terrain_line(main_right_rel, main_bottom + 16, true))) {
            while (!player_terrain_line(main_right_rel, main_bottom, true) && !player_terrain_line(-main_left_rel, main_bottom, true)) {
                x += x_direction;
                y += y_direction;
            }
        }

        // Move up slopes:
        while (player_terrain_line(-main_left_rel, main_bottom, true) || player_terrain_line(main_right_rel, main_bottom, true)) {
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
            if (ground == false && ceiling_allow == true && y_speed < -2.5 && (player_terrain_point(-main_left_rel, -main_top) || player_terrain_point(main_right_rel, -main_top))) {
                ceiling_landing = 1;
            }

            if (ceiling_landing == 1) {
                var angle_temp;

                // Set temp ground_angle:
                if (player_terrain_point(-main_left_rel, -main_top)) {
                    angle_temp = player_get_angle(floor(x) - main_left_rel, floor(y) - main_top, 2);
                } else {
                    angle_temp = player_get_angle(floor(x) + main_right_rel, floor(y) - main_top, 2);
                }

                if (angle_temp >= 90 && angle_temp <= 180 - 45 || (angle_temp >= 180 + 45 && angle_temp <= 270)) {
                    ground_angle    = angle_temp;
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
                input_lock_alarm   = 2;

                player_set_state(player_state_run);
            }
        }

        if (mode == 0) {
            while (player_terrain_line(-main_left_rel, -main_top) || player_terrain_line(main_right_rel, -main_top)) {
                y += 1;

                // Stop y speed:
                if (y_speed < 0) y_speed = 0;
            }
        }
    }
}
