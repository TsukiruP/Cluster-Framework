/// debug_option_config_reset(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Reset Config";

    // Confirm:
    case 2:
        game_reset_config();
        return true;

    // Undefined:
    default:
        return undefined;
}
