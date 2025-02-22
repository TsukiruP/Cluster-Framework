/// debug_option_config_reset(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Config";

    // Confirm:
    case 2:
        game_reset_config();
        return true;

    // Undefined:
    default:
        return undefined;
}