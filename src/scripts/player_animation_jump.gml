/// player_animation_jump()
/// @desc Sets the animation for jumping.
/// @returns {void}

switch (character_index)
{
    case CHAR_CLASSIC:
        player_set_animation("roll");
        break;

    default:
        if (tag_leader_state == STATE_FINISH) player_set_animation(pick(y_speed > 0, "spring_flight", "spring_fall"));
        else
        {
            if ((animation_current == "spin_flight" || jump_bound == BOUND_TRICK || (jump_bound == BOUND_SONIC && animation_current == "roll")) && y_speed > 0)
            {
                switch (jump_uncurl)
                {
                    case UNCURL_BLOCKADE:
                        player_set_animation("spring_fall");
                        break;

                    case UNCURL_BOUND:
                        player_set_animation(pick(jump_bound == BOUND_TRICK, "spin_fall", "trick_bound"));
                        break;

                    default:
                        var solid_inst; solid_inst = collision_box_vertical(x_radius, y_radius + 32, mask_direction, par_solid);

                        if (solid_inst)
                        {
                            if (jump_bound == BOUND_NONE && solid_inst.collision && !(solid_inst.layer > -1 && layer != solid_inst.layer)) player_set_animation("spin_fall");
                        }
                }
            }
            else if !(animation_current == "spin_fall" || (jump_uncurl == UNCURL_BLOCKADE && animation_current == "spring_fall") ||
                jump_bound == BOUND_TRICK || (jump_bound == BOUND_SONIC && animation_current == "roll")) player_set_animation("spin_flight");
        }
}
