/// player_slope_factor(base, other)

// Abort:
if (on_ground == false) {
    return 0;
}

// Moving down on shallow slants:
if (sign(dsin(relative_angle)) == sign(x_speed) && relative_angle < 22.5 && relative_angle > 337.5) {
    return 0;
}

// Apply relative angle:
argument0 *= dsin(relative_angle);

// Ignore if other is greater:
if (argument1 > abs(argument0)) {
    return 0;
}

// Return:
return argument0;
