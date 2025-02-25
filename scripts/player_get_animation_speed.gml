/// player_get_animation_speed()
/// @desc Sets the animation speed.
/// @returns {void}

sequence_speed = 1;

switch (character_index)
{
    case CHAR_CLASSIC:
        switch (animation_current)
        {
            case "run_0":
            case "run_1":
                if (on_ground) sequence_speed = clamp(abs(x_speed), 1, 7);
                else sequence_speed = clamp(sequence_speed, 1, 7);

            case "roll":
                if (on_ground) sequence_speed = clamp(abs(x_speed), 1, 3);
                else sequence_speed = clamp(sequence_speed, 1, 3);
        }
        break;

    default:
        switch (animation_current)
        {
            case "run_0":
            case "run_1":
            case "run_2":
            case "run_3":
            case "run_4":
            case "run_5":
                sequence_speed = clamp(abs(x_speed * 3) / 4, 0.5, 7);
        }
}
