/// debug_option_transition_room(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Room:";

    case OPTION_VALUE:
        return room_get_name(transition_room);

    case OPTION_CHANGE:
        if (_execute)
        {
            // Wrapping is a bit awkward because rooms aren't convenient to work with.
            switch (sign(menu_x_direction))
            {
                // Left:
                case -1:
                    if (transition_room != room_first) transition_room = room_previous(transition_room);
                    else transition_room = room_last;
                    break;

                // Right:
                case 1:
                    if (transition_room != room_last) transition_room = room_next(transition_room);
                    else transition_room = room_first;
                    break;
            }
        }

        return true;

    case OPTION_CONFIRM:
        if (_execute) transition_create(transition_room);
        return true;

    default:
        return undefined;
}
