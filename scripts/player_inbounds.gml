/// player_inbounds([id])
// Returns whether the player is inside the camera boundaries.

var player_id, player_handle;

if (argument_count >= 1) {
    player_id     = argument[0];
    player_handle = player_get_instance(player_id);
} else {
    player_id     = 0;
    player_handle = self;
}

switch (player_handle.mask_rotation) {
    // Down:
    case 0:
        // Left limit:
        if (x < ctrl_camera.limit_left + x_radius) {
            x = ctrl_camera.limit_left + x_radius;

            if (x_speed < 0) {
                x_speed = 0;
            }
        }

        // Right limit:
        if (x > ctrl_camera.limit_right - x_radius) {
            x = ctrl_camera.limit_right - x_radius;

            if (x_speed > 0) {
                x_speed = 0;
            }
        }

        // Top limit:
        if (y < ctrl_camera.limit_top - y_radius * 2) {
            y = ctrl_camera.limit_top - y_radius * 2;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom + y_radius) {
            player_set_damage(self);
            return false;
        }
        break;

    // Right:
    case 90:
        // Left limit:
        if (x < ctrl_camera.limit_left - y_radius * 2) {
            x = ctrl_camera.limit_left - y_radius * 2;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right + y_radius) {
            // [PLACEHOLDER]
            return false;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top + x_radius) {
            y = ctrl_camera.limit_top + x_radius;

            if (x_speed > 0) {
                x_speed = 0;
            }
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom - x_radius) {
            y = ctrl_camera.limit_bottom - x_radius;

            if (x_speed < 0) {
                x_speed = 0;
            }
        }
        break;

    // Up:
    case 180:
        // Left limit:
        if (x < ctrl_camera.limit_left + x_radius) {
            x = ctrl_camera.limit_left + x_radius;

            if (x_speed > 0) {
                x_speed = 0;
            }
        }

        // Right limit:
        if (x > ctrl_camera.limit_right - x_radius) {
            x = ctrl_camera.limit_right - x_radius;

            if (x_speed < 0) {
                x_speed = 0;
            }
        }

        // Top limit:
        if (y < ctrl_camera.limit_top - y_radius) {
            // [PLACEHOLDER]
            return false;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom + y_radius * 2) {
            y = ctrl_camera.limit_bottom + y_radius * 2;
        }
        break;

    // Left:
    case 270:
        // Left limit:
        if (x < ctrl_camera.limit_left - y_radius) {
            // [PLACEHOLDER]
            return false;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right + y_radius * 2) {
            x = ctrl_camera.limit_right + y_radius * 2;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top + x_radius) {
            y = ctrl_camera.limit_top + x_radius;

            if (x_speed > 0) {
                x_speed = 0;
            }
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom - x_radius) {
            y = ctrl_camera.limit_bottom - x_radius;

            if (x_speed < 0) {
                x_speed = 0;
            }
        }
        break;
}
