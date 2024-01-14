/// player_get_angle(x, y, [floor_mode])

// Set up arguments:
var pos_x, pos_y, floor_mode, off_x, off_y, i;

pos_x = argument[0];
pos_y = argument[1];

// Set up floor mode:
if (argument_count > 2) floor_mode = argument[2];
else floor_mode = 0;

// Set up off x and off y:
switch (floor_mode) {
    // Floor angle:
    case 0:
        off_x[0] = pos_x - pos_x mod 16;
        off_x[1] = pos_x + (15 - pos_x mod 16);
        off_y[0] = pos_y;
        off_y[1] = pos_y;
        break;

    // Right wall angle:
    case 1:
        off_x[0] = pos_x;
        off_x[1] = pos_x;
        off_y[0] = pos_y + (15 - pos_y mod 16);
        off_y[1] = pos_y - pos_y mod 16;
        break;

    // Ceiling anngle:
    case 2:
        off_x[0] = pos_x + (15 - pos_x mod 16);
        off_x[1] = pos_x - pos_x mod 16;
        off_y[0] = pos_y;
        off_y[1] = pos_y;
        break;

    // Left wall angle:
    case 3:
        off_x[0] = pos_x;
        off_x[1] = pos_x;
        off_y[0] = pos_y - pos_y mod 16;
        off_y[1] = pos_y + (15 - pos_y mod 16);
        break;
}

// Move angle points:
for (i = 0; i <= 1; i += 1) {
    // Push angle sensors down:
    while (!angle_sensor(off_x[i], off_y[i])
    && off_x[i] > pos_x - 32 && off_x[i] < pos_x + 32
    && off_y[i] > pos_y - 36 && off_y[i] < pos_y + 36) {
        off_x[i] += dsin(90 * floor_mode);
        off_y[i] += dcos(90 * floor_mode);
    }

    // Push angle sensors up:
    while (angle_sensor(off_x[i], off_y[i])
    && off_x[i] > pos_x - 32 && off_x[i] < pos_x + 32
    && off_y[i] > pos_y - 36 && off_y[i] < pos_y + 36) {
        off_x[i] -= dsin(90 * floor_mode);
        off_y[i] -= dcos(90 * floor_mode);
    }
}

// Return angle:
return floor(point_direction(off_x[0], off_y[0], off_x[1], off_y[1]));
