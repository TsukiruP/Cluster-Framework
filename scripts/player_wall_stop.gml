/// player_wall_stop()

// Obstacle collision:
var obstacle;

obstacle = obstacle_check(wall_width + 1, hitbox_height, wall_width + 1, hitbox_height);

if(obstacle != false) {
    if(y + hitbox_height + yprevious - y >= obstacle.bbox_top) {
        if((((g_speed < 0 && ground) || (x_speed < 0 && !ground)) && obstacle_check(0, hitbox_height, wall_width + 1, hitbox_height) && x + wall_width + xprevious - x <= obstacle.bbox_left) ||
            (((g_speed > 0 && ground) || (x_speed > 0 && !ground)) && obstacle_check(wall_width + 1, hitbox_height, 0, hitbox_height) && x - wall_width + xprevious - x >= obstacle.bbox_right)) {
            if(ground == true) g_speed = 0;
            x_speed = 0;
            // [PLACEHOLDER] Glide speed.
        }
    }
}

// Terrain:
if(input_lock_alarm == 0) {
    // Wall collision:
    if((((g_speed < 0 && ground) || (x_speed < 0 && !ground)) && point_check(-wall_width - 1, wall_height)) ||
        (((g_speed > 0 && ground) || (x_speed > 0 && !ground)) && point_check(wall_width +  1, wall_height))) {
        if(ground == true) g_speed = 0;
        x_speed = 0;
    }
}
