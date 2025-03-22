/// debug_option_save_delete(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Delete Save";

    // Confirm:
    case 2:
        debug_save_create(2);
        return true;

    // Undefined:
    default:
        return undefined;
}
