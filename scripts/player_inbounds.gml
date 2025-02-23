/// player_inbounds([index])
/// @desc Returns whether the player instance is inside the camera boundaries. This is usually the room boundaries.
/// @param {int} [index]
/// @returns {bool}

var _index; if (argument_count > 0) _index = argument[0]; else _index = player_index;

var player_inst; player_inst = stage_get_player(_index);

switch (player_inst.mask_rotation)
{
    // Down:
    case 0:
        // Left limit:
        if (x < ctrl_camera.limit_left + x_radius)
        {
            x = ctrl_camera.limit_left + x_radius;
            if (x_speed < 0) x_speed = 0;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right - x_radius)
        {
            x = ctrl_camera.limit_right - x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top - y_radius * 2)
        {
            y = ctrl_camera.limit_top - y_radius * 2;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom + y_radius)
        {
            player_set_damage(self);
            return false;
        }
        break;

    // Right:
    case 90:
        // Left limit:
        if (x < ctrl_camera.limit_left - y_radius * 2)
        {
            x = ctrl_camera.limit_left - y_radius * 2;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right + y_radius)
        {
            player_set_damage(self);
            return false;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top + x_radius)
        {
            y = ctrl_camera.limit_top + x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom - x_radius)
        {
            y = ctrl_camera.limit_bottom - x_radius;
            if (x_speed < 0) x_speed = 0;
        }
        break;

    // Up:
    case 180:
        // Left limit:
        if (x < ctrl_camera.limit_left + x_radius)
        {
            x = ctrl_camera.limit_left + x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right - x_radius)
        {
            x = ctrl_camera.limit_right - x_radius;
            if (x_speed < 0) x_speed = 0;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top - y_radius)
        {
            player_set_damage(self);
            return false;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom + y_radius * 2)
        {
            y = ctrl_camera.limit_bottom + y_radius * 2;
        }
        break;

    // Left:
    case 270:
        // Left limit:
        if (x < ctrl_camera.limit_left - y_radius)
        {
            player_set_damage(self);
            return false;
        }

        // Right limit:
        if (x > ctrl_camera.limit_right + y_radius * 2)
        {
            x = ctrl_camera.limit_right + y_radius * 2;
        }

        // Top limit:
        if (y < ctrl_camera.limit_top + x_radius)
        {
            y = ctrl_camera.limit_top + x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        // Bottom limit:
        if (y > ctrl_camera.limit_bottom - x_radius)
        {
            y = ctrl_camera.limit_bottom - x_radius;
            if (x_speed < 0) x_speed = 0;
        }
        break;
}

return true;