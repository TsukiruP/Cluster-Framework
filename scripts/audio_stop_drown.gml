/// audio_stop_drown()
/* Stops drowning music. */

with (ctrl_audio)
{
    if (audio_drown_isplaying())
    {
        sound_stop(drown_handle);
        sound_discard(drown_handle);
        drown_handle = -1;
    }
}
