/// player_get_animation_variant()
// Updates animation variant.

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
                if (player_id == 0)
                {
                    return 0;
                }

                // Partner:
                else
                {
                    return 1;
                }
            }

            // Randomize wait:
            else
            {
                return choose(0, 1);
            }
        }
        else
        {
            return animation_variant;
        }

    // Spin:
    case "spin":
        // Spin flight:
        if (state_current == player_state_jump)
        {
            return 1;
        }

        // Drop dash:
        if (drop_dash_alarm > 0)
        {
            return animation_variant;
        }

    // Death:
    case "death":
        if (character_id == CHAR_CLASSIC && drown == true)
        {
            return 1;
        }

}

// Default:
return 0;
