/// player_animation_jump()
/* Sets the jump animation. */

switch (character_id)
{
    case CHAR_CLASSIC:
        player_set_animation("roll");
        break;

    default:
        if (y_speed > 0)
        {
            switch (jump_uncurl)
            {
                case UNCURL_BLOCKADE:
                    player_set_animation("spring_fall");
                    break;

                default:
                    if (jump_bound == BOUND_NONE && collision_box_vertical(x_radius, y_radius + 32, mask_rotation, par_terrain)) player_set_animation("spin_fall");
            }
        }

        if (animation_current != "spin_fall") player_set_animation("spin_flight");
}
