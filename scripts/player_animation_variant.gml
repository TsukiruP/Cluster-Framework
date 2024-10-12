/// player_animation_variant()
//

switch (animation_current)
{
    // Tag:
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

    // Wait:
    case "wait":
        if (animation_changed == true)
        {
            // Leader & partner wait:
            if (instance_number(obj_player) > 1)
            {
                // Leader:
                if (player_slot == 0)
                {
                    animation_variant = 0;
                }

                // Partner:
                else
                {
                    animation_variant = 1;
                }
            }

            // Randomize wait:
            else
            {
                animation_variant = choose(0, 1);
            }
        }
        break;

    // Spin:
    case "spin":
        // Spin flight & fall:
        if (state_current == player_state_jump)
        {
            animation_variant = 1;
        }

        // Roll:
        else
        {
            animation_variant = 0;
        }
        break;

    // Default:
    default:
        animation_variant = 0;
}
