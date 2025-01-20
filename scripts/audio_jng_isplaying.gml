/// audio_jng_isplaying([index])
/* Returns whether a jingle is playing. */

with (ctrl_audio)
{
    if (argument_count > 0)
    {
        if (sound_exists(argument[0])) return sound_isplaying(argument[0]);
    }
    else
    {
        if (jng_handle != -1) return sound_isplaying(jng_handle);
    }

    return false;
}
