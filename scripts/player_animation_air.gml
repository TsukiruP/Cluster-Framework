/// player_animation_air()
// Shorthand for air animation behavior.

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        break;

    // Default:
    default:
        if ((animation_current != "turn" && animation_current != "turn_brake" && animation_current != "spin" && animation_current != "brake" && animation_current != "air_dash") ||
        (animation_current == "spring_flight" && y_speed >= 0))
        {
            // Flight:
            if (y_speed < 0)
            {
                player_set_animation("spring_flight");
            }

            // Fall:
            else
            {
                player_set_animation("spring_fall");
            }
        }
}
