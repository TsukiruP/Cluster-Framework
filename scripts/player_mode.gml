/// player_mode()

// Changle ground_angle mode:
if ((ground_angle >= 0 && ground_angle <= 45) || (ground_angle >= 315 && ground_angle <= 360)) mode = 0;
if (ground_angle >= 46 && ground_angle <= 134) mode = 1;
if (ground_angle >= 135 && ground_angle <= 225) mode = 2;
if (ground_angle >= 225 && ground_angle <= 314) mode = 3;

// Change direction:
switch (mode)
{
    case 0:
        x_direction = 0;
        y_direction = 1;
    break;

    case 1:
        x_direction = 1;
        y_direction = 0;
    break;

    case 2:
        x_direction =  0;
        y_direction = -1;
    break;

    case 3:
        x_direction = -1;
        y_direction =  0;
    break;
}
