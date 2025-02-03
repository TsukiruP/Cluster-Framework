/// audio_stop_jng([index])
/* Stops a jingle.
Defaults to the currently playing jingle. */

with (ctrl_audio)
{
    if (argument_count > 0)
    {
        if (audio_jng_isplaying(argument[0])) audio_stop_jng();
    }
    else
    {
        if (audio_jng_isplaying())
        {
            sound_stop(jng_handle);
            sound_discard(jng_handle);
            jng_handle = -1;
        }
    }
}
