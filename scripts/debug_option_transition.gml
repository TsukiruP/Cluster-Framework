/// debug_option_transition(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Transition Debug";

    // Confirm:
    case 2:
        transition_room = room_first;
        debug_set_next(debug_menu_transition);
        return true;

    // Undefined:
    default:
        return undefined;
}
