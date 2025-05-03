/// player_animation_trick()
/// @desc Sets the animation for tricks.
/// @returns {void}

if (trick_index == TRICK_DOWN) player_set_animation("trick_down");
else if ((trick_index == TRICK_UP || character_index == CHAR_MILES) && y_speed > 0) player_set_animation(pick(trick_index, "trick_up_fall", "trick_down", "trick_front_fall", "trick_back_fall"));
else player_set_animation(pick(trick_index, "trick_up_flight", "trick_down", "trick_front", "trick_back"));
