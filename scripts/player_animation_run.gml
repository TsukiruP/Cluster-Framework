/// player_animation_run()
// Shorthand for run animation behavior.

// Abort if in the pushing animation:
if (animation_current == "push" && image_xscale == input_x_direction)
{
    exit;
}

switch (character_id)
{
    // Classic:
    case CHAR_CLASSIC:
        // Run 1:
        if (abs(x_speed) >= 6.00)
        {
            player_set_animation("run_1");
        }

        // Run 0:
        else
        {
            player_set_animation("run_0");
        }
        break;

    // Default:
    default:
        // Peel Out:
        if (peel_out == true)
        {
            player_set_animation("run_5");
        }

        // Run 4:
        else if (abs(x_speed) >= 6.00)
        {
            player_set_animation("run_4");
        }

        // Run 3:
        else if (abs(x_speed) >= 4.50)
        {
            player_set_animation("run_3");
        }

        // Run 2:
        else if (abs(x_speed) >= 3.00)
        {
            player_set_animation("run_2");
        }

        // Run 1:
        else if (abs(x_speed) >= 1.50)
        {
            player_set_animation("run_1");
        }

        // Run 0:
        else
        {
            player_set_animation("run_0");
        }
}
