/// player_animation_air()
// Shorthand for air animation behavior.

if ((animation_current != "turn" && animation_current != "turn_brake" && animation_current != "spin" && animation_current != "brake" &&
    animation_current != "spring_flight" && animation_current != "spring_fall" &&
    animation_current != "air_dash") ||
    (animation_current == "spring_flight" && y_speed >= 0) || spring_alarm > 0)
{
    // Flight:
    if (y_speed < 0 || (spring_angle != ANGLE_DOWN && spring_alarm > 0))
    {
        player_set_animation("spring_flight");
    }

    // Fall:
    else
    {
        player_set_animation("spring_fall");
    }
}
