/// debug_option_save_reset(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Reset Save";

    // Confirm:
    case 2:
        if (_event)
        {
            game_set_save_index(-1);
            game_reset_save();
        }

        return true;

    // Undefined:
    default:
        return undefined;
}