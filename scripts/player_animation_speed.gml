/// player_animation_speed()
// Updates animation speed.

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        break;

    // Default:
    default:
        switch (animation_current)
        {
            // Run:
            case "run_0":
            case "run_1":
            case "run_2":
            case "run_3":
            case "run_4":
            case "run_5":
                ctl_speed = clamp(abs(x_speed * 3) / 4, 0.5, 7);
                break;

            // Default:
            default:
                ctl_speed = 1;
        }
}
