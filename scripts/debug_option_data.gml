/// debug_option_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Data Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_data);
        return true;

    // Undefined:
    default:
        return undefined;
}
