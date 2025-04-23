/// classic_trait_clock_up([over])
/// @desc He who was born a God and governs over all.
/// @returns {void}

if (argument_count > 0)
{
    if (argument[0] && clock_up_state != 0)
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

        clock_up_state = 0;
        game_set_speed(1);
        audio_resume_bgm();
    }
}
else
{
    if (clock_up_state != 0)
    {
        energy = max(energy - 1 * clock_up_state, 0);
        if (energy <= 0) classic_trait_clock_up(true);
    }

    if (state_current == player_state_hurt || state_current == player_state_death || input_cpu) exit;

    if (energy > 0 && clock_up_alarm == 0 && player_get_input(INP_SUPER, CHECK_PRESSED))
    {
        if (clock_up_state != 2 && (clock_up_state == 0 || clock_up_state != 0) && player_get_input(INP_ALT, CHECK_HELD))
        {
            clock_up_state = 2;
            game_set_speed(0);
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_hyper_clock_up");
            audio_pause_bgm();
        }
        else if (clock_up_state != 1 && (clock_up_state == 0 || (clock_up_state == 2 && player_get_input(INP_ALT, CHECK_HELD))))
        {
            clock_up_state = 1;
            game_set_speed(0.25);
            audio_play_sfx("snd_clock_up_start");
            audio_play_sfx("snd_clock_up");
            audio_pause_bgm();
        }
        else classic_trait_clock_up(true);

        clock_up_alarm = 60;
    }
}
