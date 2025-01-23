/// audio_drown_isplaying()
/* Returns whether drowning music is playing. */

with (ctrl_audio)
{
    return drown_handle != -1;
}
