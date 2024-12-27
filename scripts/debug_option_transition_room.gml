/// debug_option_transition_room(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Room:";

    // Value:
    case 1:
        return room_get_name(transition_room);

    // Confirm:
    case 2:
        transition_create(transition_room);
        return true;

    // Update:
    case 3:
        // Wrapping is a bit awkward because rooms aren't convenient to work with.
        switch (sign(menu_x_direction))
        {
            // Left:
            case -1:
                if (transition_room != room_first)
                {
                    transition_room = room_previous(transition_room);
                }
                else
                {
                    transition_room = room_last;
                }
                break;
            
            // Right:
            case 1:
                if (transition_room != room_last)
                {
                    transition_room = room_next(transition_room);
                }
                else
                {
                    transition_room = room_first;
                }
                break;
        }
        return true;
    
    // Undefined:
    default:
        return undefined;
}
