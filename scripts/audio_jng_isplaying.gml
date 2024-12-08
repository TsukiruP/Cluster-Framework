/// audio_jng_isplaying([index])
// Returns whether a jingle is playing.


with (mgr_audio)
{
    if (argument_count >= 1)
    {
        // Check if index exists:
        if (sound_exists(argument[0]))
        {
            // Return:
            return sound_isplaying(argument[0]);
        }
    }
    else
    {
        if (jng_handle != -1)
        {
            // Return:
            return sound_isplaying(jng_handle);
        }
    }

    return false;
}
