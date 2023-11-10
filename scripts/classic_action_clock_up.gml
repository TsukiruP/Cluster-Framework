/// classic_action_clock_up()
// He who was born a God and governs over all.

// Clock Up
if(player_input[INP_SUPER, CHECK_PRESSED] == true) {
    if(clock_up_state <= 1) {
        clock_up_state      = 1 + player_input[INP_ALT, CHECK_HELD];
        global.object_ratio = 0.5 - (0.5 * player_input[INP_ALT, CHECK_HELD]);

        // Play sound:
        if(player_input[INP_ALT, CHECK_HELD] == true) {
            sound_play("snd_clock_up_start");
            sound_play("snd_hyper_clock_up");
        } else {
            sound_play("snd_clock_up_start");
            sound_play("snd_clock_up");
        }
    }
}
