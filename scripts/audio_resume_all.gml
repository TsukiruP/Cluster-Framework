/// audio_resume_all()
// Resumes all currently paused audio.

with (mgr_audio)
{
    audio_resume_sfx_all();
    audio_bgm_resume();
    audio_jng_resume();
    audio_drown_resume();
}
