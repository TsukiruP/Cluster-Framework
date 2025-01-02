/// audio_resume_bgm()
// Resumes music.

with (mgr_audio)
{
    if (bgm_handle != -1)
    {
        sound_resume(bgm_handle);
    }
}
