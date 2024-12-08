/// audio_drown_stop()
// Stops drowning music.

with (mgr_audio)
{
    if (drown_handle != -1)
    {
        sound_stop(drown_handle);
        sound_discard(drown_handle);
        drown_handle = -1;
    }
}
