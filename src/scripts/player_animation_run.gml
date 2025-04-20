/// player_animation_run()
/// @desc Sets the animation for running.
/// @returns {void}

// Abort if in the pushing animation:
if (animation_current == "push" && sign(image_xscale) == input_x_direction) exit;

switch (character_index)
{
    case CHAR_CLASSIC:
        player_set_animation(pick(abs(x_speed) >= 6.00, "run_1", "run_2"));
        break;

    default:
        if (tag_leader)
        {
            if (abs(x_speed) >= 6.00) player_set_animation("run_3");
            else if (abs(x_speed) >= 3.75) player_set_animation("run_2");
            else player_set_animation("run_1");
        }
        else
        {
            if (peel_out) player_set_animation("run_6");
            else if (abs(x_speed) >= 6.00) player_set_animation("run_5");
            else if (abs(x_speed) >= 4.50) player_set_animation("run_4");
            else if (abs(x_speed) >= 3.00) player_set_animation("run_3");
            else if (abs(x_speed) >= 1.50) player_set_animation("run_2");
            else player_set_animation("run_1");
        }
}
