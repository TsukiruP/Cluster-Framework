/// game_paused()
// Returns true if the game is currently paused.

if (instance_exists(ctrl_stage)) {
    return global.game_pause;
} else return false;
