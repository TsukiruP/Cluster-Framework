/// debug_option_room_goto(data)

switch (argument0)
{
    // Text:
    case 0:
        return "Room Goto";

    // Value:
    case 1:
        return room_get_name(menu_room);

    // Confirm:
    case 2:
        transition_create(menu_room);
        break;

    // Update:
}
