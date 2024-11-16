/// save_default()
// Sets save map to default values.

// Game data:
save_set("game",    GAME_NAME);
save_set("version", GAME_VERSION);

// Save data:
save_set("name",  "");
save_set("stage", rm_basic_test_1);
save_set("time",  0);

// Player data:
for (i = 0; i < global.player_count; i += 1)
{
    save_set("player" + string(i), -1);
}

save_set("player0", CHAR_SONIC);

// Skill data:
save_set("sonic_jump",       SKILL_NONE);
save_set("sonic_aux_ground", SKILL_NONE);
save_set("sonic_aux_air",    SKILL_NONE);
save_set("sonic_slam",       SKILL_NONE);
save_set("sonic_peel",       false);
save_set("sonic_homing",     HOMING_NONE);
save_set("sonic_shield",     false);
