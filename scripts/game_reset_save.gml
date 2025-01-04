/// game_reset_save()
// Resets save map.

var i;

// Game data:
game_set_save("game", GAME_NAME);
game_set_save("version", GAME_VERSION);

// Save data:
game_set_save("name", "");
game_set_save("stage", rm_basic_test_1);
game_set_save("time", 0);

// Player data:
for (i = 0; i < PLAYER_COUNT; i += 1)
{
    game_set_save("player" + string(i), -1);
}

game_set_save("player0", CHAR_SONIC);

// Skill data:
game_set_save("sonic_jump", SKILL_NONE);
game_set_save("sonic_aux_ground", SKILL_NONE);
game_set_save("sonic_aux_air", SKILL_NONE);
game_set_save("sonic_slam", SKILL_NONE);
game_set_save("sonic_peel", false);
game_set_save("sonic_homing", HOMING_NONE);
game_set_save("sonic_shield", false);
