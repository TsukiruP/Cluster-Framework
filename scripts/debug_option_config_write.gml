/// debug_option_config_write(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Write Config";

    // Confirm:
    case 2:
        game_write_config();
        return true;

    // Undefined:
    default:
        return undefined;
}
