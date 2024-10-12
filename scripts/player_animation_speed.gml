/// player_animation_speed()
//

switch (animation_current)
{
    case "run_0":
    case "run_1":
    case "run_2":
    case "run_3":
    case "run_4":
        ctl_speed = clamp(abs(x_speed * 16 * 3) / 64, 0.5, 7);
        break;

    default:
        ctl_speed = 1;
}
