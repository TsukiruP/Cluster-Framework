/// debug_option_transition_preview(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Preview:";

    // Value:
    case 1:
        return pick(transition_preview, "Fade", "Menu", "Title Card", "Retry");

    // Confirm:
    case 2:
        if (_event) transition_create(transition_room, transition_preview, true);
        return true;

    // Change:
    case 3:
        if (_event)
        {
            transition_preview += menu_x_direction;
            transition_preview = wrap(transition_preview, TRANS_FADE, TRANS_RETRY);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}