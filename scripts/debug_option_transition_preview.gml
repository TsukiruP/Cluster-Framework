/// debug_option_transition_preview(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Preview:";

    // Value:
    case 1:
        return pick(transition_preview, "Fade", "Menu", "Title Card", "Retry");

    // Confirm:
    case 2:
        if (_execute) transition_create(transition_room, transition_preview, true);
        return true;

    // Update:
    case 3:
        if (_execute)
        {
            transition_preview += menu_x_direction;
            transition_preview = wrap(transition_preview, TRANS_FADE, TRANS_RETRY);
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}