/// room_get_data([room])
/* Gets the room data based on the room.
Defaults to the current room should no room be provided. */

// Initialize:
room_handle = room;

// Set handle:
if (argument_count == 1)
{
    room_handle = argument[0];
}

switch (room_handle)
{
    // Basic Test Act 1:
    case rm_basic_test_1:
        room_set_data(TRANS_CARD, "bgm_basic_test_1", -1, "Basic Test", 1, 864, START_READY);
        break;

    default:
        room_set_data(TRANS_FADE);
        break;
}
