/// player_position_fix()

// Store previous height:
main_height_temp = main_height;

// Position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP && animation_current != "spin_flight")) {
    x += (main_height_temp - main_height) * x_direction;
    y += (main_height_temp - main_height) * y_direction;
}
