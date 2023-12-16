/// player_action_balance()

// Trigger balance:
if(ground == true && angle == 0 && x_speed == 0) {
    if(action_state == ACTION_DEFAULT || action_state == ACTION_LOOK || action_state == ACTION_CROUCH) {
        // Balance direction:
        balance_direction = ((player_collision_left_edge(x, y, 8) && !player_collision_right_edge(x, y, 350)) - (!player_collision_left_edge(x, y, 8) && player_collision_right_edge(x, y, 350)))

        // Balance:
        if(balance_direction != 0) {
            action_state = ACTION_BALANCE;
        }
    }
} else {
    if(action_state == ACTION_BALANCE) {
        action_state      = ACTION_DEFAULT;
        balance_direction = 0;
    }
}
