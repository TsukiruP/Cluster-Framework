/// room_get_data(room)

if(argument_count == 1) room_handle = argument[0];
else room_handle = room;

switch(room_handle) {
    case rm_basic_test_1:
        room_set_data(TRANS_CARD, "Basic Test", 1, obj_basic_test_parallax, 912, KICKOFF_DEFAULT);
        break;

    case rm_basic_test_2:
        room_set_data(TRANS_CARD, "Basic Test", 2, obj_basic_test_parallax, -1, KICKOFF_DEFAULT);
        break;

    default:
        room_set_data(TRANS_FADE, "Placeholder", 0, -1);
        break;
}
