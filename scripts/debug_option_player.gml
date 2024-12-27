/// debug_option_player(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Player:";

    // Value:
    case 1:
        return pick(game_save_get("player0"), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Confirm:
    case 2:
        switch (game_save_get("player0"))
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
        var player;

        player = game_save_get("player0");
        player += menu_x_direction;
        player = wrap(player, CHAR_SONIC, CHAR_CLASSIC);

        game_save_set("player0", player);

        return true;

    // Undefined:
    default:
        return undefined;
}
