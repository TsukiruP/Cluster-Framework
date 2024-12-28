/// debug_option_transition(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Transition Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_transition);
        return true;

    // Undefined:
    default:
        return undefined;
}
