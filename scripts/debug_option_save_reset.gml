/// debug_option_save_reset(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Save";

    // Confirm:
    case 2:
        game_reset_save();
        return true;

    // Undefined:
    default:
        return undefined;
}