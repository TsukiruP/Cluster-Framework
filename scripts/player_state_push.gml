/// player_state_push()
//

var wall_direction;

// Wall direction:
wall_direction = player_collision_right(x, y, angle, mask_big) - player_collision_left(x, y, angle, mask_big);

// Trigger push:
if(ground == true && action_state == ACTION_DEFAULT && tag_animations == false && wall_direction != 0) {
    if(wall_direction == input_direction) action_state = ACTION_PUSH;
}

// Push:
if(action_state == ACTION_PUSH) {
    if(wall_direction != input_direction) action_state = ACTION_DEFAULT;
}
