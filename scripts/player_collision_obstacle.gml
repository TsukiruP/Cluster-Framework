/// player_collision_obstacle()

var obstacle_handle;

obstacle_handle = player_obstacle_check(wall_left, main_top, wall_right, main_bottom);

// Move if inside the obstacle:
if (obstacle_handle != false) {
    if (y + main_bottom + yprevious - y >= obstacle.bbox_top) {
        // Left wall:
        while ((x + wall_right) + xprevious - x <= obstacle.bbox_left && player_obstacle_check(0, main_top, wall_right, main_bottom)) {
            x -= 1;
        }

        // Right wall:
        while ((x - wall_left) + xprevious - x >= obstacle.bbox_right && player_obstacle_check(wall_left, main_top, 0, main_bottom)) {
            x += 1;
        }

        // Ceiling:
        while (ground == false && y_speed <= 0 && player_obstacle_check(wall_left, main_top, wall_right, 0)) {
            y += 1;

            if (ground == false) y_speed = 0;
        }
    }
}

// Landing:
if (mode == 0 && on_obstacle == false && y_speed >= 0 && player_obstacle_check(wall_left, 0, wall_right, main_bottom, true)) {
    ground      = true;
    landed      = true;
    on_obstacle = true;
    g_speed     = x_speed;
}

// Extending bottom:
var bottom_ext;

bottom_ext = 8 + max(y - yprevious, 0);

// Obstacle flag:
if (mode == 0 && player_obstacle_check(wall_left, 0, wall_right, main_bottom + 2, true)) {
    on_obstacle = true;
}

// Move outside of obstacle:
while (mode != 0 && mode!= 2 && player_obstacle_check(wall_left, 0, wall_right, main_bottom, true)) {
    y -= 1;
}

if (ground == true && mode == 0 && on_obstacle == true) {
    while (player_obstacle_check(wall_left, 0, wall_right, main_bottom + bottom_ext, true) && !player_obstacle_check(wall_left, 0, wall_right, main_bottom, true)) {
        y += 1;
    }

    while (player_obstacle_check(wall_left, 0, wall_right, main_bottom, true)) {
        y -= 1;
    }

    if (!player_obstacle_check(wall_left, 0, wall_right, main_bottom + bottom_ext, true)) {
        ob_obstacle = false;
    }
}

if (ground == false) on_obstacle = false;
