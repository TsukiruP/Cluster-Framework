/// audio_jng_resume()
// Resumes the currently paused jingle.

with (mgr_audio)
{
    if (jng_handle != -1)
    {
        sound_resume(jng_handle);
    }
}
