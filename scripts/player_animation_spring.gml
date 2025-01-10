/// player_animation_spring()
/* Sets the spring animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        if (spring_angle != ANGLE_DOWN && spring_alarm > 0)
        {
            player_set_animation("spring");
        }
        else
        {
            player_set_animation("run_0");
        }
        break;

    default:
        if (spring_angle != ANGLE_DOWN && spring_alarm > 0)
        {
            player_set_animation("spring_flight");
        }
        else
        {
            player_set_animation("spring_fall");
        }
}
