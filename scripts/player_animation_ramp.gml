/// player_animation_ramp()
/* Sets the ramp animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        player_animation_spring();
        break;

    default:
        if (y_speed < 0) player_set_animation("ramp_flight");
        else player_set_animation("ramp_fall");
}
