/// debug_option_text(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Text Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_text);
        return true;

    // Undefined:
    default:
        return undefined;
}
