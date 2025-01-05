/// classic_trait_clock_up([over])
// He who was born a God and governs over all.

// Clock Over:
if (argument_count >= 1)
{
    if (argument[0] == true && clock_up_state != 0)
    {
        // Play sound:
        if (clock_up_state == 2)
        {
            audio_play_sfx("snd_hyper_clock_over");
        }
        else
        {
            audio_play_sfx("snd_clock_over");
        }

        game_set_speed(1);
        clock_up_state = 0;

        // Resume music:
        audio_resume_bgm();
    }
}
else
{
    // Clock Up points:
    if (clock_up_state != 0)
    {
        // Decrease points:
        clock_up_energy = max(clock_up_energy - 1 * clock_up_state, 0);

        // Clock Over:
        if (clock_up_energy <= 0)
        {
            classic_trait_clock_up(true);
        }
    }

    // Exit if hurt or dying:
    if (state_current == player_state_hurt || state_current == player_state_death)
    {
        exit;
    }

    // Clock Up:
    if (clock_up_alarm == 0 && clock_up_energy > 0 && player_get_input(INP_SUPER, CHECK_PRESSED))
    {
        // Hyper:
        if (clock_up_state != 2 && (clock_up_state == 0 || clock_up_state != 0) && player_get_input(INP_ALT, CHECK_HELD))
        {
            game_set_speed(0);
            clock_up_state = 2;

            // Play sound:
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_hyper_clock_up");

            // Pause music:
            audio_pause_bgm();
        }

        // Normal:
        else if (clock_up_state != 1 && (clock_up_state == 0 || (clock_up_state == 2 && player_get_input(INP_ALT, CHECK_HELD))))
        {
            game_set_speed(0.25);
            clock_up_state = 1;

            // Play sound:
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_clock_up");

            // Pause music:
            audio_pause_bgm();
        }

        // Over:
        else if (clock_up_state != 0)
        {
            classic_trait_clock_up(true);
        }

        // Set Clock Up alarm:
        clock_up_alarm = 60;
    }
}
