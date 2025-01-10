/// radii_set(xradius, yradius, wall offset, [yoffset])
/* Sets the player's radii. */

var x_rad, y_rad, wall_off, cam_off;

x_rad = 0;
y_rad = 0;

wall_off = 0;
cam_off = 0;

if (argument_count >= 3)
{
    x_rad = argument[0];
    y_rad = argument[1];
    
    wall_off = argument[2];
    
    if (argument_count >= 4)
    {
        cam_off = argument[3];
    }
}

x_radius = x_rad;
y_radius = y_rad;

wall_offset = wall_off;
camera_offset = cam_off;

wall_radius = x_radius + wall_offset;
