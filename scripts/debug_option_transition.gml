/// debug_option_transition(data)

switch (argument0)
{
    // Text:
    case 0:
        return "Transition Debug";

    // Confirm:
    case 2:
        debug_menu_set_next(debug_list_transition);
        break;

    // Default:
    default:
        return undefined;
}
