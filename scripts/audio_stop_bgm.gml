/// audio_stop_bgm()
/* Stops music. */

with (mgr_audio)
{
    if (bgm_handle != -1)
    {
        sound_stop(bgm_handle);
        sound_discard(bgm_handle);
        bgm_handle = -1;
    }
}
