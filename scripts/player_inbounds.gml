/// player_inbounds()
/// @desc Returns whether the player instance is inside the camera boundaries. This is usually the room boundaries.
/// @returns {bool}

var x1, y1, x2, y2;

if (mask_direction mod 180 != 0)
{
    x1 = x - y_radius;
    y1 = y - x_radius;
    x2 = x + y_radius;
    y2 = y + x_radius;
}
else
{
    x1 = x - x_radius;
    y1 = y - y_radius;
    x2 = x + x_radius;
    y2 = y + y_radius;
}

if (rectangle_in_rectangle(x1, y1, x2, y2, ctrl_camera.limit_left, ctrl_camera.limit_top, ctrl_camera.limit_right, ctrl_camera.limit_bottom) == 1) return true;

switch (mask_direction)
{
    // Down:
    case 0:
        if (x1 < ctrl_camera.limit_left)
        {
            x = ctrl_camera.limit_left + x_radius;
            if (x_speed < 0) x_speed = 0;
        }

        if (x2 > ctrl_camera.limit_right)
        {
            x = ctrl_camera.limit_right - x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        if (y2 + y_radius < ctrl_camera.limit_top)
        {
            y = ctrl_camera.limit_top - y_radius * 2;
        }

        if (y1 > ctrl_camera.limit_bottom)
        {
            y = camera.limit_bottom + y_radius;
            return false;
        }
        break;

    // Right:
    case 90:
        if (y1 < ctrl_camera.limit_top)
        {
            y = ctrl_camera.limit_top + x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        if (y2 > ctrl_camera.limit_bottom)
        {
            y = ctrl_camera.limit_bottom - x_radius;
            if (x_speed < 0) x_speed = 0;
        }
        
        if (x2 + y_radius < ctrl_camera.limit_left)
        {
            x = ctrl_camera.limit_left - y_radius * 2;
        }
        
        if (x1 > ctrl_camera.limit_right)
        {
            x = ctrl_camera.limit_right + y_radius;
            return false;
        }
        break;

    // Up:
    case 180:
        if (x1 < ctrl_camera.limit_left)
        {
            x = ctrl_camera.limit_left + x_radius;
            if (x_speed > 0) x_speed = 0;
        }

        if (x2 > ctrl_camera.limit_right)
        {
            x = ctrl_camera.limit_right - x_radius;
            if (x_speed < 0) x_speed = 0;
        }

        if (y1 - y_radius > ctrl_camera.limit_bottom)
        {
            y = camera.limit_bottom + y_radius * 2;
        }

        if (y2 < ctrl_camera.limit_top)
        {
            y = ctrl_camera.limit_top - y_radius;
            return false;
        }
        break;

    // Left:
    case 270:
        if (y1 < ctrl_camera.limit_top)
        {
            y = ctrl_camera.limit_top + x_radius;
            if (x_speed < 0) x_speed = 0;
        }

        if (y2 > ctrl_camera.limit_bottom)
        {
            y = ctrl_camera.limit_bottom - x_radius;
            if (x_speed > 0) x_speed = 0;
        }
        
        if (x1 - y_radius > ctrl_camera.limit_right)
        {
            x = ctrl_camera.limit_left + y_radius * 2;
        }
        
        if (x2 < ctrl_camera.limit_left)
        {
            x = ctrl_camera.limit_left - y_radius;
            return false;
        }
        break;
}

return true;
