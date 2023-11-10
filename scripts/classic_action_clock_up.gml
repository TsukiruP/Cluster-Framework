/// classic_action_clock_up()
// He who was born a God and governs over all.

// Clock Up:
if(player_input[INP_SUPER, CHECK_PRESSED] == true) {
    if(clock_up_state != 2 && player_input[INP_ALT, CHECK_HELD] == true) {
        clock_up_state      = 2;
        global.object_ratio = 0.05;

        // Play sound:
        sound_play("snd_clock_up_start");
        sound_play("snd_hyper_clock_up");
    } else if(clock_up_state == 0) {
        clock_up_state      = 1;
        global.object_ratio = 0.5;

        // Play sound:
        sound_play("snd_clock_up_start");
        sound_play("snd_clock_up");
    } else {
        // Play sound:
        // Since this is dependent on the Clock Up state, we play the sound first.
        if(clock_up_state == 2) sound_play("snd_hyper_clock_over");
        else sound_play("snd_clock_over");

        clock_up_state      = 0;
        global.object_ratio = 1;
    }
}
