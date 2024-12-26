/// debug_option_partner(data)

switch (argument0)
{
    // Text:
    case 0:
        return "Partner:";

    // Value:
    case 1:
        return pick_offset(game_save_get("player1"), -1, "None", "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Update:
    case 3:
        var player;

        player = game_save_get("player1");
        player += menu_x_direction;
        player = wrap(player, -1, CHAR_CLASSIC);

        game_save_set("player1", player);

        return true;

    // Default:
    default:
        return undefined;
}
