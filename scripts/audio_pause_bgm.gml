/// audio_pause_bgm()
/* Pauses music. */

with (mgr_audio)
{
    if (bgm_handle != -1)
    {
        sound_pause(bgm_handle);
    }
}
