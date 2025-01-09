/// audio_resume_all()
/* Resumes all currently paused audio. */

with (mgr_audio)
{
    audio_resume_sfx_all();
    audio_resume_bgm();
    audio_resume_jng();
    audio_drown_resume();
}
