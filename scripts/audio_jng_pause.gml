/// audio_jng_pause()
// Pauses the currently playing jingle.

with (mgr_audio)
{
    if (jng_handle != -1)
    {
        sound_pause(jng_handle);
    }
}
