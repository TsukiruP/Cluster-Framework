/// game_is_paused([controller])
// Returns whether the text box and/or pause menu is currently active.

var pause_text, pause_stage;

// Text pause:
pause_text = (ctrl_text.text_message != "" || ctrl_text.topic_message != "" || ctrl_text.log_alpha[1] != 0);

// Stage pause:
if (instance_exists(ctrl_pause)) {
    pause_stage = ctrl_pause.pause_active;
} else {
    pause_stage = false;
}

// Return:
if (argument_count >= 1) {
    if (argument[0] == ctrl_text) return pause_text;
    else if (argument[0] == ctrl_pause) return pause_stage;
    else return (pause_text || pause_stage);
} else {
    return (pause_text || pause_stage);
}
