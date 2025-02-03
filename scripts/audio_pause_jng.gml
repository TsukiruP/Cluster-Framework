/// audio_pause_jng()
/* Pauses the currently playing jingle. */

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_pause(jng_id);
}
