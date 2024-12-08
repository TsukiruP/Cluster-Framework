/// radii_set(xradius, yradius, wall offset, [yoffset])
// Sets the player's radii.

var x_rad, y_rad, y_off, wall_off;

// Initialize:
x_rad = 0;
y_rad = 0;

wall_off = 0;
y_off = 0;

// Assign radii:
if (argument_count >= 3)
{
    x_rad = argument[0];
    y_rad = argument[1];
    
    wall_off = argument[2];
    
    if (argument_count >= 4)
    {
        y_off = argument[3];
    }
}

// Set radii:
x_radius = x_rad;
y_radius = y_rad;

wall_offset = wall_off;
y_offset = y_off;

// Update wall radius:
wall_radius = x_radius + wall_offset;
