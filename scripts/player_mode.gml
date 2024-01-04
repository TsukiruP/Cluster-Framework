/// player_mode()

// Changle angle mode:
if ((angle >= 0 && angle <= 45) || (angle >= 315 && angle <= 360)) mode = 0;
if (angle >= 46 && angle <= 134) mode = 1;
if (angle >= 135 && angle <= 225) mode = 2;
if (angle >= 225 && angle <= 314) mode = 3;

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
