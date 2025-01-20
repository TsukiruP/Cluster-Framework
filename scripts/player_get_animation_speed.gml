/// player_get_animation_speed()
/* Returns animation speed. */

switch (character_id)
{
    case CHAR_CLASSIC:
        switch (animation_current)
        {
            case "run_0":
            case "run_1":
                if (on_ground) return clamp(abs(x_speed), 1, 7);
                return clamp(sequence_speed, 1, 7);

            case "spin":
                if (on_ground) return clamp(abs(x_speed), 1, 3);
                return clamp(sequence_speed, 1, 3);
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
                return clamp(abs(x_speed * 3) / 4, 0.5, 7);
        }
}

// Default:
return 1;
