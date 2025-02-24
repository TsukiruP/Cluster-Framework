/// game_reset_save()
/// @desc Resets the save map.
/// @returns {void}

game_set_save("game", GAME_NAME);
game_set_save("version", GAME_VERSION);
game_set_save("name", "");
game_set_save("stage", rm_basic_test_1);
game_set_save("time", 0);

game_save_reset_character();
game_save_write_character();

game_set_save("swap", true);

game_save_reset_skill(CHAR_SONIC);
game_save_write_skill(CHAR_SONIC);