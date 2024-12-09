/// player_animation_run()
// Shorthand for run animation behavior.

// Push:
if (wall_push == true)
{
    if (animation_current != "push")
    {
        player_set_animation("push");
    }
}
else
{
    switch (character_id)
    {
        // Classic:
        case CHAR_CLASSIC:
            break;

        // Default:
        default:
            // Peel Out:
            if (peel_out == true)
            {
                if (animation_current != "run_5")
                {
                    player_set_animation("run_5");
                }
            }

            // Run 4:
            else if (abs(x_speed) >= 6.00)
            {
                if (animation_current != "run_4")
                {
                    player_set_animation("run_4");
                }
            }

            // Run 3:
            else if (abs(x_speed) >= 4.50)
            {
                if (animation_current != "run_3")
                {
                    player_set_animation("run_3");
                }
            }

            // Run 2:
            else if (abs(x_speed) >= 3.00)
            {
                if (animation_current != "run_2")
                {
                    player_set_animation("run_2");
                }
            }

            // Run 1:
            else if (abs(x_speed) >= 1.50)
            {
                if (animation_current != "run_1")
                {
                    player_set_animation("run_1");
                }
            }

            // Run 0:
            else
            {
                if (animation_current != "run_0")
                {
                    player_set_animation("run_0");
                }
            }
    }
}
