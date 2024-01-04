/// player_collision_terrain()

// Exit if ground collision is disabled:
if(ground_collision_allow == false) exit;

// Left wall collision:
while(point_check(-wall_width, wall_height)) {
    x += y_direction;
    y -= x_direction;
}

// Right wall collision:
while(point_check(wall_width, wall_height)) {
    x -= y_direction;
    y += x_direction;
}

if(on_obstacle == false) {
    // Landing:
    if(ground == false && y_speed > 0) {
        if(line_check(-hitbox_width, hitbox_height, true) || line_check(hitbox_width, hitbox_height, true)) {
            ground  = true;
            landed  = true;
            g_speed = x_speed;
            player_detect_angle();

            // Landing speed (From 24 to 90 degrees):
            if(angle >= 24 && angle <= 90) {
                if(angle >= 45) {
                    if(abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed * -1;
                    }
                    else {
                        g_speed = x_speed;
                    }
                }
                else {
                    if(abs(x_speed) <= abs(y_speed)) {
                        g_speed = (y_speed / 2) * -1;
                    }
                    else {
                        g_speed = x_speed;
                    }
                }
            }

            // Landing speed (From 270 to 336 degrees):
            else if(angle >= 270 && angle <= 336) {
                if(angle <= 315) {
                    if(abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed;
                    }
                    else {
                        g_speed = x_speed;
                    }
                }
                else {
                    if(abs(x_speed) <= abs(y_speed)) {
                        g_speed = y_speed / 2;
                    }
                    else {
                        g_speed = x_speed;
                    }
                }
            }
        }
    }

    // Slope collision:
    if(ground == true) {
        var detach_distance;

        // Detach distance:
        if(on_edge == true) detach_distance = 1;
        else detach_distance = 16;

        // Detach:
        if(detach_allow == true && roll_forced == false && !line_check(-hitbox_width, hitbox_height + detach_distance, true) && !line_check(hitbox_width, hitbox_height + detach_distance, true)) {
            ground = false;
        }

        // Move down slopes:
        if(on_edge == false && (line_check(-hitbox_width, hitbox_height + 16, true) || line_check(hitbox_width, hitbox_height + 16, true))) {
            while(!line_check(hitbox_width, hitbox_height, true) && !line_check(-hitbox_width, hitbox_height, true)) {
                x += x_direction;
                y += y_direction;
            }
        }

        // Move up slopes:
        while(line_check(-hitbox_width, hitbox_height, true) || line_check(hitbox_width, hitbox_height, true)) {
            x -= x_direction;
            y -= y_direction;
        }
    }

    // Angle detection:
    player_detect_angle();

    // Ceiling collision:
    if(ground == false)
    {
        if(angle_mode == 0)
        {
            // Start ceiling landing:
            if(ground == false && ceiling_allow == true && y_speed < -2.5 && (point_check(-hitbox_width, -hitbox_height) || point_check(hitbox_width, -hitbox_height))) {
                ceiling_landing = 1;
            }

            if(ceiling_landing == 1) {
                var temp_angle;

                // Set temp angle:
                if(point_check(-hitbox_width, -hitbox_height)) {
                    temp_angle = player_get_angle(floor(x) - hitbox_width, floor(y) - hitbox_height, 2);
                }
                else {
                    temp_angle = player_get_angle(floor(x) + hitbox_width, floor(y) - hitbox_height, 2);
                }

                if(temp_angle >= 90 && temp_angle <= 180 - 45 || (temp_angle >= 180 + 45 && temp_angle <= 270)) {
                    angle           = temp_angle;
                    ceiling_landing = 2;
                }
                else {
                    angle           = 0;
                    ceiling_landing = 0;
                }
            }

            if (ceiling_landing == 2) {
                if(angle < 180) {
                    x_speed = -y_speed;
                }
                else {
                    x_speed = y_speed;
                }
                ground             = true;
                ceiling_landing    = 0;
                ceiling_lock_alarm = 16;
                state              = ACTION_DEFAULT;
                input_lock_alarm   = 2;

            }
        }

        if(mode == 0) {
            while(line_check(-hitbox_width, -hitbox_height) || line_check(hitbox_width, -hitbox_height)) {
                y += 1;

                // Stop y speed:
                if(y_speed < 0) y_speed = 0;
            }
        }
    }
}
