/// miles_animation_fly()
/// @desc Sets the animating for flying.
/// @returns {void}

if (fly_time > 0)
{
    if (animation_current != "fly_turn" && animation_current != "swim_turn") player_set_animation(pick(underwater && !fly_carry, "fly", "swim"));
}
else player_set_animation(pick(underwater && !fly_carry, "fly_drop", "swim_drop"));
