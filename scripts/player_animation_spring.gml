/// player_animation_spring()
/* Sets the spring animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        player_set_animation(pick(spring_angle != ANGLE_DOWN && spring_alarm > 0, "run_0", "spring"));
        break;

    default:
        player_set_animation(pick(spring_angle != ANGLE_DOWN && spring_alarm > 0, "spring_fall", "spring_flight"));
}
