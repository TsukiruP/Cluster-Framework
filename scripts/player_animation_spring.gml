/// player_animation_spring()
// Shorthand for spring animation behavior.

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        break;

    // Default:
    default:
        // Flight:
        if (spring_angle != ANGLE_DOWN && spring_alarm > 0)
        {
            player_set_animation("spring_flight");
        }

        // Fall:
        else
        {
            player_set_animation("spring_fall");
        }
}
