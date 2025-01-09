/// audio_pause_drown()
/* Pauses the drowning music. */

with (mgr_audio)
{
    if (drown_handle != -1)
    {
        sound_pause(drown_handle);
    }
}
