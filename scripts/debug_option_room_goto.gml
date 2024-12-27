/// debug_option_room_goto(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Room Goto:";

    // Value:
    case 1:
        return room_get_name(menu_room);

    // Confirm:
    case 2:
        transition_create(menu_room);
        return true;

    // Update:
    case 3:
        // Wrapping is a bit awkward because rooms aren't convenient to work with.
        switch (sign(menu_x_direction))
        {
            // Left:
            case -1:
                if (menu_room != room_first)
                {
                    menu_room = room_previous(menu_room);
                }
                else
                {
                    menu_room = room_last;
                }
                break;
            
            // Right:
            case 1:
                if (menu_room != room_last)
                {
                    menu_room = room_next(menu_room);
                }
                else
                {
                    menu_room = room_first;
                }
                break;
        }
        return true;
    
    // Undefined:
    default:
        return undefined;
}
