/// player_wall_stop()

// Obstacle collision:
var obstacle;

obstacle = player_obstacle_check(wall_left + 1, main_top, wall_right + 1, main_bottom);

if (obstacle != false) {
    if (y + main_bottom + yprevious - y >= obstacle.bbox_top) {
        if ((((g_speed < 0 && ground) || (x_speed < 0 && !ground)) && player_obstacle_check(0, main_top, wall_right + 1, main_bottom) && (x + wall_right) + xprevious - x <= obstacle.bbox_left) ||
            (((g_speed > 0 && ground) || (x_speed > 0 && !ground)) && player_obstacle_check(wall_left + 1, main_top, 0, main_bottom) && (x - wall_left) + xprevious - x >= obstacle.bbox_right)) {
            if (ground == true) g_speed = 0;
            x_speed = 0;
            // [PLACEHOLDER] Glide speed.
        }
    }
}

// Terrain:
if (input_lock_alarm == 0) {
    // Wall collision:
    if ((((g_speed < 0 && ground) || (x_speed < 0 && !ground)) && player_terrain_point(-wall_left - 1, wall_height)) ||
        (((g_speed > 0 && ground) || (x_speed > 0 && !ground)) && player_terrain_point(wall_right +  1, wall_height))) {
        if (ground == true) g_speed = 0;
        x_speed = 0;
    }
}
