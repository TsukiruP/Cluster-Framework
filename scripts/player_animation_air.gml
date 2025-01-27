/// player_animation_air()
/* Sets the air animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        break;

    default:
        if ((animation_current != "turn" && animation_current != "turn_brake" && animation_current != "spin" && animation_current != "brake" && animation_current != "breathe" && animation_current != "air_dash") ||
        (animation_current == "spring_flight" && y_speed >= 0))
        {
            if (y_speed < 0) player_set_animation("spring_flight");
            else player_set_animation("spring_fall");
        }
}
