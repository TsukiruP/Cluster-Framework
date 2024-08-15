/// player_routine_jump()
// A jump to the sky turns to a rider kick.

// Jump:
if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true) {
    // Set state:
    player_set_state(player_state_air);

    // Set flag:
    jump_state = true;

    // Set speed:
    x_speed -= jump_force * dsin(relative_angle);
    y_speed -= jump_force * dcos(relative_angle);

    return true;
}

return false;
