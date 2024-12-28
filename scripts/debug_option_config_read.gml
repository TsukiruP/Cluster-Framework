/// debug_option_config_read(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 2:
        game_config_read();
        return true;

    // Undefined:
    default:
        return undefined;
}
