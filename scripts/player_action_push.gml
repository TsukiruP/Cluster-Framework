/// player_action_push()
//

var wall_direction;

// Wall direction:
wall_direction = player_collision_right(x, y, angle, mask_big) - player_collision_left(x, y, angle, mask_big);

// Trigger push:
if(ground == true && tag_animations == false && wall_direction != 0 && wall_direction == input_direction) {
    if(action_state == ACTION_DEFAULT) action_state = ACTION_PUSH;
}

// Cancel push:
else {
    if(action_state == ACTION_PUSH) action_state = ACTION_DEFAULT;
}
