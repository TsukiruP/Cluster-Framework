/// audio_drown_isplaying()
/* Returns whether drowning music is playing. */

with (mgr_audio)
{
    if (drown_handle != -1)
    {
        return sound_isplaying(drown_handle);
    }

    return false;
}
