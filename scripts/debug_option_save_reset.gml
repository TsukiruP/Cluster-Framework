/// debug_option_save_reset(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Save";

    // Confirm:
    case 2:
        game_set_save_index(-1);
        game_reset_save();
        return true;

    // Undefined:
    default:
        return undefined;
}
