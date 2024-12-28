/// debug_option_save_format(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Format Save";

    // Confirm:
    case 2:
        game_save_format();
        return true;

    // Undefined:
    default:
        return undefined;
}
