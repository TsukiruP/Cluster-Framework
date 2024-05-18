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

// Water surface expects:
if (instance_exists(obj_water_surface)) {
    if (water_surface == true) {
        // Create step/run splash:
        if (ground == true && abs(g_speed) > 0) {
            if (water_splash_alarm > 0) {
                water_splash_alarm -= 1;

                if (water_splash_alarm == 0) {
                    if (abs(g_speed) >= 4.50) {
                        effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, animation_direction);
                        water_splash_alarm = 7;
                    } else {
                        effect_create(ctl_splash_step, floor(x), obj_water_surface.y, depth, animation_direction);
                        water_splash_alarm = 14;
                    }
                }
            }
        }

        // Create jump splash:
        if (ground == false && sign(y_speed) == -1) {
            effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, animation_direction);
        }
    } else {
        water_splash_alarm = 14;
    }

    // Water surface:
    if (floor(y) + main_bottom + 1 == obj_water_surface.y) {
        water_surface = true;
    } else {
        water_surface = false;
    }
}
