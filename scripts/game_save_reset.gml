/// game_save_reset()
/// @desc Resets the save map.
/// @returns {void}

game_save_set("game", GAME_NAME);
game_save_set("version", GAME_VERSION);
game_save_set("name", "");
game_save_set("stage", rm_basic_test_1);
game_save_set("time", 0);

game_save_reset_character();
game_save_write_character();

game_save_set("swap", true);
game_save_set("tag", true);
game_save_set("boost", true);

game_save_reset_skill(CHAR_SONIC);
game_save_write_skill(CHAR_SONIC);
