/// player_get_animation_variant()
/// @desc Sets the animation variant.
/// @returns {void}

animation_variant = 1;

switch (animation_current)
{
    case "stand":
    case "turn":
    case "walk":
    case "walk_fast":
    case "jog":
    case "look":
    case "look_end":
    case "crouch":
    case "crouch_end":
    case "brake":
    case "spring_flight":
    case "spring_fall":
        break;

    case "wait":
        if (animation_changed)
        {
            if (instance_number(obj_player) > 1) animation_variant = pick(player_index > 0, 0, 1);
            else animation_variant = choose(0, 1);
        }

    case "death":
        if (character_index == CHAR_CLASSIC && drown) animation_variant = 1;
        break;
}
