/// player_animation_run()
/* Sets the run animation depending on the x speed. */

// Abort if in the pushing animation:
if (animation_current == "push" && image_xscale == input_x_direction)
{
    exit;
}

switch (character_id)
{
    case CHAR_CLASSIC:
        if (abs(x_speed) >= 6.00)
        {
            player_set_animation("run_1");
        }
        else
        {
            player_set_animation("run_0");
        }
        break;

    default:
        if (peel_out)
        {
            player_set_animation("run_5");
        }
        else if (abs(x_speed) >= 6.00)
        {
            player_set_animation("run_4");
        }
        else if (abs(x_speed) >= 4.50)
        {
            player_set_animation("run_3");
        }
        else if (abs(x_speed) >= 3.00)
        {
            player_set_animation("run_2");
        }
        else if (abs(x_speed) >= 1.50)
        {
            player_set_animation("run_1");
        }
        else
        {
            player_set_animation("run_0");
        }
}
