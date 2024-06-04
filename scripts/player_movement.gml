/// player_movement()

// Cap speed:
g_speed = clamp(g_speed, -max_speed, max_speed);
x_speed = clamp(x_speed, -max_speed, max_speed);
y_speed = clamp(y_speed, -max_speed, max_speed);

// Ground ground_angle:
if (ground == true) {
    x_speed = g_speed *  dcos(ground_angle);
    y_speed = g_speed * -dsin(ground_angle);
}

// Update position:
x += x_speed / steps;
y += y_speed / steps;

// Reset wall height:
wall_height = 0;

// Wall offset height on flat ground:
if (ground == true && ground_angle == 0) wall_height = 4;

// Reset ceiling flag:
touching_ceiling = false;

// Set flag if inside ceiling:
if (player_line_check(-main_left_rel, -main_top - 8) || player_line_check(main_right_rel, -main_top - 8)) {
    touching_ceiling = true;
}

// Springing:
if (((ground == true && input_lock_alarm == 0) || (ground == false && action_state != ACTION_SPRING) || touching_ceiling == true) && spring_alarm != 0) {
    spring_alarm = 0;
}

if (spring_alarm == 0 && spring_current != noone) {
    spring_current = noone;
}

if (ground == true && action_state == ACTION_SPRING) action_state = ACTION_DEFAULT;
