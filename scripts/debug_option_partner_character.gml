/// debug_option_partner_character(phase, [direction])

switch (argument0)
{
    // Text:
    case 0:
        return "Partner Character:";

    // Value:
    case 1:
        return pick_offset(game_save_get("player1"), -1, "None", "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Has Update:
    case 3:
        return true;

    // Update:
    case 4:
        var player;

        player = game_save_get("player1");
        player += argument[1];
        player = wrap(player, -1, CHAR_CLASSIC);

        game_save_set("player1", player);
        break;

    // Default:
    default:
        return undefined;
}
