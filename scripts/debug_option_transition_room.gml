/// debug_option_transition_room(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Room:";

    // Value:
    case 1:
        return room_get_name(transition_room);

    // Confirm:
    case 2:
        if (_event) transition_create(transition_room);
        return true;

    // Change:
    case 3:
        if (_event)
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

    // Undefined:
    default:
        return undefined;
}