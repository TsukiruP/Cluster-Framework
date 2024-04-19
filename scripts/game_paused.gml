/// game_paused()
// Returns true if the game is currently paused.

var pause_game, pause_text;

if (instance_exists(ctrl_pause)) {
    pause_game = ctrl_pause.pause_active;
} else {
    pause_game = false;
}

return pause_game;
