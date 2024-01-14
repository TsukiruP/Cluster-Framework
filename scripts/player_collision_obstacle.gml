/// player_collision_obstacle()

var obstacle_handle;

obstacle_handle = obstacle_check(wall_width, main_height, wall_width, main_height);

// Move if inside the obstacle:
if (obstacle_handle != false) {
    if (y + main_h + yprevious - y >= obstacle.bbox_top) {
        // Left wall:
        while (x + wall_width + xprevious - x <= obstacle.bbox_left && obstacle_check(0, main_height, wall_width, main_height)) {
            x -= 1;
        }

        // Right wall:
        while (x - wall_width + xprevious - x >= obstacle.bbox_right && obstacle_check(wall_width, main_height, 0, main_height)) {
            x += 1;
        }

        // Ceiling:
        while (ground == false && y_speed <= 0 && obstacle_check(wall_width, main_width, wall_width, 0)) {
            y += 1;

            if (ground == false) y_speed = 0;
        }
    }
}

// Landing:
if (mode == 0 && on_obstacle == false && y_speed >= 0 && obstacle_check(wall_width, 0, wall_width, main_height, true)) {
    ground      = true;
    landed      = true;
    on_obstacle = true;
    g_speed     = x_speed;
}

// Extending bottom:
var bottom_ext;

bottom_ext = 8 + max(y - yprevious, 0);

// Obstacle flag:
if (mode == 0 && obstacle_check(wall_width, 0, wall_width, main_height + 2, true)) {
    on_obstacle = true;
}

// Move outside of obstacle:
while (mode != 0 && mode!= 2 && obstacle_check(wall_width, 0, wall_width, main_height, true)) {
    y -= 1;
}

if (ground == true && mode == 0 && on_obstacle == true) {
    while (obstacle_check(wall_width, 0, wall_width, main_height + bottom_ext, true) && !obstacle_check(wall_width, 0, wall_width, main_height, true)) {
        y += 1;
    }

    while (obstacle_check(wall_width, 0, wall_width, main_height, true)) {
        y -= 1;
    }

    if (!obstacle_check(wall_width, 0, wall_width, main_height + bottom_ext, true)) {
        ob_obstacle = false;
    }
}

if (ground == false) on_obstacle = false;
