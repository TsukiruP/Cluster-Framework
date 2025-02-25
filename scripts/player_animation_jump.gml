/// player_animation_jump()
/// @desc Sets the animation for jumping.
/// @returns {void}

switch (character_index)
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
                    break

                default:
                    var solid_inst; solid_inst = collision_box_vertical(x_radius, y_radius + 32, mask_direction, par_solid);

                    if (solid_inst)
                    {
                        if (jump_bound == BOUND_NONE && solid_inst.collision && !(solid_inst.layer > -1 && layer != solid_inst.layer)) player_set_animation("spin_fall");
                    }
            }
        }

        if (jump_uncurl != UNCURL_BLOCKADE && animation_current != "spin_fall") player_set_animation("spin_flight");
}
