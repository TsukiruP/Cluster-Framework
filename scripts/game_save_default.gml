/// game_save_default()
// Sets save map to default values.

// Game data:
game_save_set("game",    GAME_NAME);
game_save_set("version", GAME_VERSION);

// Save data:
game_save_set("name",  "");
game_save_set("stage", rm_basic_test_1);
game_save_set("time",  0);

// Player data:
for (i = 0; i < global.player_count; i += 1)
{
    game_save_set("player" + string(i), -1);
}

game_save_set("player0", CHAR_SONIC);

// Skill data:
game_save_set("sonic_jump",       SKILL_NONE);
game_save_set("sonic_aux_ground", SKILL_NONE);
game_save_set("sonic_aux_air",    SKILL_NONE);
game_save_set("sonic_slam",       SKILL_NONE);
game_save_set("sonic_peel",       false);
game_save_set("sonic_homing",     HOMING_NONE);
game_save_set("sonic_shield",     false);
