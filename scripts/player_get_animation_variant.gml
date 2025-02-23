/// player_get_animation_variant()
/* Updates animation variant. */

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
            if (instance_number(obj_player) > 1) return pick(player_index > 0, 0, 1);
            else return choose(0, 1);
        }
        else return animation_variant;

    case "death":
        if (character_index == CHAR_CLASSIC && drown) return 1;

}

return 0;