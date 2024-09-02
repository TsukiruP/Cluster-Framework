/// player_state_hint(phase)
// Learn to take a hint, with a notepad.

switch (argument0) {
    // Start:
    case STATE_START:
        break;

    // Step:
    case STATE_STEP:
        if (ctrl_text.text_clear == true) {
            y = 0;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;
}
