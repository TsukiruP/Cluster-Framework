/// audio_pause_jng()
/* Pauses the currently playing jingle. */

with (ctrl_audio)
{
    if (jng_handle != -1)
    {
        sound_pause(jng_handle);
    }
}
