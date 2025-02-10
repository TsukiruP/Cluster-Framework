/// player_animation_air()
/* Sets the air animation. */

switch (character_index)
{
    case CHAR_CLASSIC:
        break;

    default:
        if ((animation_current != "turn" && animation_current != "turn_brake" && animation_current != "roll" && animation_current != "spin_flight" && animation_current != "spin_fall" &&
        animation_current != "brake" && animation_current != "breathe" && animation_current != "insta" && animation_current != "air_dash") || (animation_current == "spring_flight" && y_speed >= 0))
        {
            player_set_animation(pick(y_speed < 0, "spring_fall", "spring_flight"));
        }
}
