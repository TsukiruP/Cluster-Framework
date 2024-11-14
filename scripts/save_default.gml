/// save_default()
// Sets save data to default values.

// Game information:
save_set("game", GAME_NAME);
save_set("version", GAME_VERSION);

// Player information:
save_set("name", "");
save_set("stage", rm_basic_test_1);
save_set("time", 0);
