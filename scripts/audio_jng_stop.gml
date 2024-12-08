/// audio_jng_stop([index])
// Stops a jingle. Defaults to the currently playing jingle.
/*
with (mgr_audio)
{
    if (argument_count >= 1)
    {
        // Check if index exists:
        if (sound_exists(argument[0]))
        {
            // Check if index is the jingle index
            if (argument[0] == jng_index)
            {
                // Stop jingle:
                audio_jng_stop();
            }
        }
    }
    else
    {
        // Check if jingle exists:
        if (sound_exists(jng_handle))
        {
            // Check if jingle is playing:
            if (sound_isplaying(jng_handle))
            {
                // Discard jingle:
                if (jng_handle != -1)
                {
                    sound_discard(jng_handle);
                    jng_handle = -1;
                }
            }
        }
    }
}
*/
with (mgr_audio)
{
    // Check if jingle exists:
    if (sound_exists(jng_index))
    {
        // Check if jingle is playing:
        if (sound_isplaying(jng_handle))
        {
            sound_stop(jng_handle);
            sound_discard(jng_handle);
            jng_index = "";
            jng_handle = -1;
        }
    }
}
