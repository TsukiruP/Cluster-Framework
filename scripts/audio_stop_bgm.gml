/// audio_stop_bgm()
/* Stops music. */

with (ctrl_audio)
{
    if (audio_bgm_isplaying())
    {
        sound_stop(bgm_handle);
        sound_discard(bgm_handle);
        bgm_handle = -1;
    }
}
