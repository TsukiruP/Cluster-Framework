/// debug_option_save_write(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Write Save";

    // Confirm:
    case 2:
        debug_save_create(0);
        return true;

    // Undefined:
    default:
        return undefined;
}
