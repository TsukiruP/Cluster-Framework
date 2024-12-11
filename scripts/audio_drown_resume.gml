/// audio_drown_resume()
// Resumes the drowning music.

with (mgr_audio)
{
    if (drown_handle != -1)
    {
        sound_resume(drown_handle);
    }
}
