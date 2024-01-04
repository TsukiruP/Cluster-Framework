/// room_get_data(room)

if(argument_count == 1) room_handle = argument[0];
else room_handle = room;

switch(room_handle) {
    // Basic Test Act 1:
    case rm_basic_test_1:
        room_set_data(TRANS_CARD, "bgm_basic_test_1", obj_basic_test_parallax, "Basic Test", 1, 768);
        break;

    default:
        room_set_data(TRANS_FADE);
        break;
}
