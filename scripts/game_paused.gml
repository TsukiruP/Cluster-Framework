/// game_paused([controller])
// Returns true

var pause_stage, pause_text;

// Stage pause:
if (instance_exists(ctrl_pause)) {
    pause_stage = ctrl_pause.pause_active;
} else {
    pause_stage = false;
}

// Text pause:
pause_text = (ctrl_text.text_message != "" || ctrl_text.topic_message != "" || ctrl_text.log_alpha[1] != 0);

if (argument_count >= 1) {
    if (argument[0] == ctrl_pause) return pause_stage;
    else if (argument[0] == ctrl_text) return pause_text;
    else return (pause_stage || pause_text);
} else {
    return (pause_stage || pause_text);
}
