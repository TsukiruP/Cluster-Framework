/// debug_option_format_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Format Data";

    // Confirm:
    case 2:
        game_save_default();
        return true;

    // Undefined:
    default:
        return undefined;
}
