/// radii_set(xradius, yradius, wall offset, [yoffset])
/* Sets the player's radii. */

x_radius = argument0;
y_radius = argument1;
wall_offset = argument2;
wall_radius = x_radius + wall_offset;
camera_offset = 0;
if (argument_count > 3) camera_offset = argument[3];
