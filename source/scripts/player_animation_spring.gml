/// player_animation_spring()
/// @desc Sets the animation for being launched by a spring.
/// @returns {void}

switch (character_index)
{
    case CHAR_CLASSIC:
        player_set_animation(pick(spring_angle != ANGLE_DOWN && spring_alarm > 0, "run_0", "spring"));
        break;

    default:
        player_set_animation(pick(spring_angle != ANGLE_DOWN && spring_alarm > 0, "spring_fall", "spring_flight"));
}
