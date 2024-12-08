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
            audio_sfx_play("snd_hyper_clock_over");
        }
        else
        {
            audio_sfx_play("snd_clock_over");
        }

        game_set_speed(1);
        clock_up_state = 0;

        // Resume music:
        audio_bgm_resume();
    }
}
else
{
    // Clock Up time:
    if (clock_up_state != 0)
    {
        // Increase Clock Up time:
        clock_up_time = min(clock_up_time + 1 * clock_up_state, clock_up_duration);

        // Clock Over:
        if (clock_up_time == clock_up_duration)
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
    if (clock_up_time != clock_up_duration && clock_up_alarm == 0 && player_get_input(INP_SUPER, CHECK_PRESSED))
    {
        // Hyper:
        if (clock_up_state != 2 && (clock_up_state == 0 || clock_up_state != 0) && player_get_input(INP_ALT, CHECK_HELD))
        {
            game_set_speed(0);
            clock_up_state = 2;

            // Play sound:
            audio_sfx_play("snd_clock_up_start");
            audio_sfx_play("snd_hyper_clock_up");

            // Pause music:
            audio_bgm_pause();
        }

        // Normal:
        else if (clock_up_state != 1 && (clock_up_state == 0 || (clock_up_state == 2 && player_get_input(INP_ALT, CHECK_HELD))))
        {
            game_set_speed(0.25);
            clock_up_state = 1;

            // Play sound:
            audio_sfx_play("snd_clock_up_start");
            audio_sfx_play("snd_clock_up");

            // Pause music:
            audio_bgm_pause();
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
