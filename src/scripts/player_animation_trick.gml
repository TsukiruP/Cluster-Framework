/// player_animation_trick()
/// @desc Sets the animation for tricks.
/// @returns {void}

switch (trick_index)
{
    case TRICK_UP:
        player_set_animation(pick(y_speed > 0, "trick_up_flight", "trick_up_fall"));
        break;

    default:
        player_set_animation(pick(trick_index, "trick_up_flight", "trick_down", "trick_front", "trick_back"));
}
