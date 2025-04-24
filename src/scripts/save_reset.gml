/// save_reset()
/// @desc Resets the save map.
/// @returns {void}

save_set("game", GAME_NAME);
save_set("version", GAME_VERSION);
save_set("name", "");
save_set("stage", rm_basic_test_1);
save_set("time", 0);

save_reset_character();
save_write_character();

save_set("swap", true);
save_set("trick", true);
save_set("tag", true);
save_set("boost", true);

save_reset_skill(CHAR_SONIC);
save_write_skill(CHAR_SONIC);
