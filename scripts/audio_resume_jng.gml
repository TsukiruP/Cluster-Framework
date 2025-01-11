/// audio_resume_jng()
/* Resumes the currently paused jingle. */

with (ctrl_audio)
{
    if (jng_handle != -1)
    {
        sound_resume(jng_handle);
    }
}
