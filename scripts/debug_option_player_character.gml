/// debug_option_player_character(phase, [direction])

switch (argument0)
{
    // Text:
    case 0:
        return "Player Character:";

    // Value:
    case 1:
        return pick(game_save_get("player0"), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    // Has Update:
    case 3:
        return true;

    // Update:
    case 4:
        var player;

        player = game_save_get("player0");
        player += argument[1];
        player = wrap(player, CHAR_SONIC, CHAR_CLASSIC);

        game_save_set("player0", player);
        break;

    // Default:
    default:
        return undefined;
}
