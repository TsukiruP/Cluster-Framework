/// debug_option_save_reset(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Reset Save";

    // Confirm:
    case 4:
        if (_execute)
        {
            game_save_set_index(-1);
            game_save_reset();
        }

        return true;

    // Undefined:
    default:
        return undefined;
}