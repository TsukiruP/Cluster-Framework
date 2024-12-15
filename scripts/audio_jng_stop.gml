/// audio_jng_stop([index])
// Stops a jingle. Defaults to the currently playing jingle.

with (mgr_audio)
{
    if (argument_count >= 1)
    {
        // Check if index exists:
        if (audio_jng_isplaying(argument[0]))
        {
            // Stop jingle:
            audio_jng_stop();
        }
    }
    else
    {
        // Check if jingle is playing:
        if (jng_handle != -1)
        {
            sound_stop(jng_handle);
            sound_discard(jng_handle);
            jng_handle = -1;
        }
    }
}
