/// classic_action_clock_up()
// He who was born a God and governs over all.

// Clock Up alarm:
if(clock_up_alarm > 0) clock_up_alarm -= 1;
else if(clock_up_alarm != 0) clock_up_alarm = 0;

// Clock Up timer:
if(clock_up_state != 0) {
    // Increase Clock Up timer:
    clock_up_timer = min(clock_up_timer + 1 * clock_up_state, clock_up_duration);

    // Clock Over:
    if(clock_up_timer == clock_up_duration) {
        // Play sound:
        // Since this is dependent on the Clock Up state, we play the sound first.
        if(clock_up_state == 2) sound_play("snd_hyper_clock_over");
        else sound_play("snd_clock_over");

        clock_up_state      = 0;
        global.object_ratio = 1;
    }
}

// Don't bother if in the middle of dying, already hurt, or don't have full meter:
if(action_state == ACTION_DEATH || action_state == ACTION_HURT) exit;

// Clock Up:
if(player_input[INP_SUPER, CHECK_PRESSED] == true && clock_up_alarm == 0) {
    if(clock_up_state != 2 && player_input[INP_ALT, CHECK_HELD] == true && ((clock_up_state == 0 && clock_up_timer == 0) || clock_up_state != 0)) {
        clock_up_state      = 2;
        global.object_ratio = 0;

        // Play sound:
        sound_play("snd_clock_up_start");
        sound_play("snd_hyper_clock_up");
    } else if(clock_up_state != 1 && ((clock_up_state == 0 && clock_up_timer == 0) || (player_input[INP_ALT, CHECK_HELD] == true && clock_up_state == 2))) {
        clock_up_state      = 1;
        global.object_ratio = 0.25;

        // Play sound:
        sound_play("snd_clock_up_start");
        sound_play("snd_clock_up");
    } else if(clock_up_state != 0) {
        // Play sound:
        // Since this is dependent on the Clock Up state, we play the sound first.
        if(clock_up_state == 2) sound_play("snd_hyper_clock_over");
        else sound_play("snd_clock_over");

        clock_up_state      = 0;
        global.object_ratio = 1;
    }

    // Set Clock Up alarm:
    clock_up_alarm = 90;
}
