/// debug_option_player1(return)

var player_key;

// Player key:
player_key = "player1";

switch (argument0)
{
    // Text:
    case 0:
        return "Player 1:";

    // Value:
    case 1:
        return pick_offset(game_save_get(player_key), -1, "None", "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Confirm:
    case 2:
        switch (game_save_get(player_key))
        {
            // Sonic:
            case CHAR_SONIC:
                debug_menu_set_next(debug_list_sonic);
                return true;

            // Default:
            default:
                return false;
        }
        break;

    // Update:
    case 3:
        game_save_set(player_key, wrap(game_save_get(player_key) + menu_x_direction, -1, CHAR_CLASSIC));

        return true;

    // Undefined:
    default:
        return undefined;
}
