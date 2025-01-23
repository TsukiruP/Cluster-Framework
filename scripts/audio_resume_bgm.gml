/// audio_resume_bgm()
/* Resumes music. */

with (ctrl_audio)
{
    if (audio_bgm_isplaying()) sound_resume(bgm_handle);
}
