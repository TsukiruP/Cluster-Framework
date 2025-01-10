/// classic_trait_clock_up([over])
/* He who was born a God and governs over all. */

if (argument_count >= 1)
{
    if (argument[0] == true && clock_up_state != 0)
    {
        if (clock_up_state == 2)
        {
            audio_play_sfx("snd_hyper_clock_over");
            audio_stop_sfx("snd_hyper_clock_up");
        }
        else
        {
            audio_play_sfx("snd_clock_over");
            audio_stop_sfx("snd_clock_up");
        }

        game_set_speed(1);
        clock_up_state = 0;
        audio_resume_bgm();
    }
}
else
{
    if (clock_up_state != 0)
    {
        clock_up_energy = max(clock_up_energy - 1 * clock_up_state, 0);

        if (clock_up_energy <= 0)
        {
            classic_trait_clock_up(true);
        }
    }

    if (state_current == player_state_hurt || state_current == player_state_death)
    {
        exit;
    }

    if (clock_up_alarm == 0 && clock_up_energy > 0 && player_get_input(INP_SUPER, CHECK_PRESSED))
    {
        // Hyper:
        if (clock_up_state != 2 && (clock_up_state == 0 || clock_up_state != 0) && player_get_input(INP_ALT, CHECK_HELD))
        {
            game_set_speed(0);
            clock_up_state = 2;
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_hyper_clock_up");
            audio_pause_bgm();
        }

        // Normal:
        else if (clock_up_state != 1 && (clock_up_state == 0 || (clock_up_state == 2 && player_get_input(INP_ALT, CHECK_HELD))))
        {
            game_set_speed(0.25);
            clock_up_state = 1;
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_clock_up");
            audio_pause_bgm();
        }

        // Over:
        else
        {
            classic_trait_clock_up(true);
        }

        clock_up_alarm = 60;
    }
}
