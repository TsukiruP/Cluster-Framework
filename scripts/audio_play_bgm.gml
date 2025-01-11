/// audio_play_bgm(index)
/* Plays music.
If the index doesn't exist or isn't the correct kind, nothing occurs. */

with (ctrl_audio)
{
    if (sound_exists(argument0))
    {
        if (sound_get_kind(argument0) == 1)
        {
            if (!sound_isplaying(argument0))
            {
                audio_stop_bgm();

                if (bgm_handle == -1)
                {
                    bgm_handle = sound_loop_ex(argument0, 1, 1, 0);
                }
            }
        }
    }
}
