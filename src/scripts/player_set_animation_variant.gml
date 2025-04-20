/// player_set_animation_variant()
/// @desc Sets the animation variant.
/// @returns {void}

animation_variant = VARIANT_DEFAULT;

if (tag_leader)
{
    switch (animation_current)
    {
        case "stand":
        case "turn":
        case "run_1":
        case "run_2":
        case "run_3":
        case "look":
        case "look_end":
        case "crouch":
        case "crouch_end":
        case "brake":
        case "spring_flight":
        case "spring_fall":
            animation_variant = VARIANT_TAG;
    }
}
