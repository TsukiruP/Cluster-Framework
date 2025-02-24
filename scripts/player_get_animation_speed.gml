/// player_get_animation_speed()
/// @desc Sets the animation speed.
/// @returns {void}

var _speed; _speed = 1;

switch (character_index)
{
    case CHAR_CLASSIC:
        switch (animation_current)
        {
            case "run_0":
            case "run_1":
                if (on_ground) _speed = clamp(abs(x_speed), 1, 7);
                else _speed = clamp(sequence_speed, 1, 7);

            case "roll":
                if (on_ground) _speed = clamp(abs(x_speed), 1, 3);
                else _speed = clamp(sequence_speed, 1, 3);
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
                _speed = clamp(abs(x_speed * 3) / 4, 0.5, 7);
        }
}

animation_speed = _speed;
