/// player_movement()

// Cap speed:
x_speed = clamp(x_speed, -max_speed, max_speed);
y_speed = clamp(y_speed, -max_speed, max_speed);
g_speed = clamp(g_speed, -max_speed, max_speed);

// Ground ground_angle:
if (ground == true) {
    x_speed = g_speed *  dcos(ground_angle);
    y_speed = g_speed * -dsin(ground_angle);
}

// Add gravity force:
if (ground == false && y_allow == true) {
    y_speed += gravity_force / steps;
}

// Update position:
x += x_speed / steps;
y += y_speed / steps;

if (abs(g_speed) < 2.5) {
    // Lock controls:
    if (ground_angle >= 45 && ground_angle <= 360 - 45 && input_lock_alarm == 0) input_lock_alarm = 30;

    // Fall off:
    if (ground_angle >= 90 && ground_angle <= 270) ground = false;
}

// Reset wall height:
wall_height = 0;

// Wall offset height on flat ground:
if (ground == true && ground_angle == 0) wall_height = 4;

// Reset ceiling flag:
touching_ceiling = false;

// Set flag if inside ceiling:
if (player_line_check(-main_width, -main_height - 8) || player_line_check(main_width, -main_height - 8)) {
    touching_ceiling = true;
}
