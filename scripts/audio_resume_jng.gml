/// audio_resume_jng()
/* Resumes the currently paused jingle. */

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_resume(jng_handle);
}
