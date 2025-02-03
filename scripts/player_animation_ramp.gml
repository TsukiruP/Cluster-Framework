/// player_animation_ramp()
/* Sets the ramp animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        player_animation_spring();
        break;

    default:
        player_set_animation(pick(y_speed < 0, "ramp_fall", "ramp_flight"))
}
