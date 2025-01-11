/// audio_resume_bgm()
/* Resumes music. */

with (ctrl_audio)
{
    if (bgm_handle != -1)
    {
        sound_resume(bgm_handle);
    }
}
