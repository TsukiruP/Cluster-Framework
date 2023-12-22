/// player_action_balance()
// Hanging on the edge of tomorrow!

// Balance direction:
balance_direction = ((player_collision_left_edge(x, y, 8) && !player_collision_right_edge(x, y, 352)) - (!player_collision_left_edge(x, y, 8) && player_collision_right_edge(x, y, 352)));

// Trigger balance:
if(ground == true && angle == gravity_angle && x_speed == 0 && balance_direction != 0 && tag_animations == false) {
    if(action_state == ACTION_DEFAULT) action_state = ACTION_BALANCE;
}

// Cancel balance:
else {
    if(action_state == ACTION_BALANCE) action_state = ACTION_DEFAULT;
}
