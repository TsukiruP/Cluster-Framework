/// debug_option_transition_preview(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Preview:";

    case OPTION_VALUE:
        return pick(transition_preview, "Fade", "Menu", "Title Card", "Retry");

    case OPTION_CHANGE:
        if (_execute)
        {
            transition_preview += menu_x_direction;
            transition_preview = wrap(transition_preview, TRANS_FADE, TRANS_RETRY);
        }

        return true;

    case OPTION_CONFIRM:
        if (_execute) transition_create(transition_room, transition_preview, true);
        return true;

    default:
        return undefined;
}
