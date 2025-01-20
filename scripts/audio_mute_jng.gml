/// audio_mute_jng()
/* Sets the jingle volume to 0. */

with (ctrl_audio)
{
    if (jng_handle != -1) sound_volume(jng_handle, 0);
}
