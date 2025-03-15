/// player_animation_ramp()
/// @desc Sets the animation for being launched by a ramp.
/// @returns {void}

switch (character_index)
{
    case CHAR_CLASSIC:
        player_animation_spring();
        break;

    default:
        if (tag_state == 1) player_animation_spring();
        else player_set_animation(pick(y_speed < 0, "ramp_fall", "ramp_flight"));
}
