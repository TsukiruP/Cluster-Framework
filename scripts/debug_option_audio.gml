/// debug_option_audio(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Audio";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_audio);
        return true;

    // Undefined:
    default:
        return undefined;
}
