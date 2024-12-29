/// debug_option_player0(return)

var save_key;

// Save key:
save_key = "player0";

switch (argument0)
{
    // Text:
    case 0:
        return "Player 0:";

    // Value:
    case 1:
        return pick(game_save_get(save_key), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Confirm:
    case 2:
        switch (game_save_get(save_key))
        {
            // Sonic:
            case CHAR_SONIC:
                debug_set_next(debug_menu_sonic);
                return true;

            // Default:
            default:
                return false;
        }
        break;

    // Update:
    case 3:
        game_save_set(save_key, wrap(game_save_get(save_key) + menu_x_direction, CHAR_SONIC, CHAR_CLASSIC));
        return true;

    // Undefined:
    default:
        return undefined;
}
