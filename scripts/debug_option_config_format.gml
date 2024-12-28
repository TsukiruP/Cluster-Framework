/// debug_option_config_format(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Format Config";

    // Confirm:
    case 2:
        game_config_format();
        return true;

    // Undefined:
    default:
        return undefined;
}
