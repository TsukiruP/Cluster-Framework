/// player_animation_ramp()
/// @desc Sets the animation for being launched by a ramp.
/// @returns {void}

switch (character_index)
{
    case CHAR_CLASSIC:
        player_animation_spring();
        break;

    default:
        if (tag_leader) player_set_animation(pick(y_speed < 0, "spring_fall", "spring_flight"));
        else player_set_animation(pick(y_speed < 0, "ramp_fall", "ramp_flight"));
}
