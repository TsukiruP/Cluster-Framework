/// debug_option_config_write(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Write Config";

    // Confirm:
    case 2:
        game_write_config();
        return true;

    // Undefined:
    default:
        return undefined;
}
