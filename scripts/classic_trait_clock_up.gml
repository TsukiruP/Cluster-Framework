/// classic_trait_clock_up([over])
// He who was born a God and governs over all.

// Clock Over:
if (argument_count >= 1) {
    if (argument[0] == true && clock_up_state != 0) {
        // Play sound:
        // Since this is dependent on the Clock Up state, we play the sound first.
        if (clock_up_state == 2) {
            sound_play("snd_hyper_clock_over");
        } else {
            sound_play("snd_clock_over");
        }

        global.object_ratio = 1;
        clock_up_state      = 0;
    }
} else {
    // Clock Up timer:
    if (clock_up_state != 0) {
        // Increase Clock Up timer:
        clock_up_timer = min(clock_up_timer + 1 * clock_up_state, clock_up_duration);

        // Clock Over:
        if (clock_up_timer == clock_up_duration) {
            classic_trait_clock_up(true);
        }
    }

    // Exit if hurt or dying:
    if (action_current == player_action_hurt || action_current == player_action_death) {
        exit;
    }

    // Clock Up:
    if (clock_up_timer != clock_up_duration && clock_up_alarm == 0 && input_player[INP_SUPER, CHECK_PRESSED] == true) {
        // Hyper:
        if (clock_up_state != 2 && (clock_up_state == 0 || clock_up_state != 0) && input_player[INP_ALT, CHECK_HELD] == true) {
            global.object_ratio = 0;
            clock_up_state      = 2;

            // Play sound:
            sound_play("snd_clock_up_start");
            sound_play("snd_hyper_clock_up");
        }

        // Normal:
        else if (clock_up_state != 1 && (clock_up_state == 0 || (clock_up_state == 2 && input_player[INP_ALT, CHECK_HELD] == true))) {
            global.object_ratio = 0.25;
            clock_up_state      = 1;

            // Play sound:
            sound_play("snd_clock_up_start");
            sound_play("snd_clock_up");
        }

        // Over:
        else if (clock_up_state != 0) {
            classic_trait_clock_up(true);
        }

        // Set Clock Up alarm:
        clock_up_alarm = 60;
    }
}
