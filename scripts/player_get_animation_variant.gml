/// player_get_animation_variant()
/// @desc Sets animation variant.
/// @returns {void}

var _variant; _variant = 0;

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
            if (instance_number(obj_player) > 1) _variant = pick(player_index > 0, 0, 1);
            else _variant = choose(0, 1);
        }

        _variant = animation_variant;

    case "death":
        if (character_index == CHAR_CLASSIC && drown) _variant = 1;

}

animation_variant = _variant;
