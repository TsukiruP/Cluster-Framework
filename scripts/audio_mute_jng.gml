/// audio_mute_jng()
// Sets the jingle volume to 0.

with (mgr_audio)
{
    // Check if a jingle is playing:
    if (jng_handle != -1)
    {
        sound_volume(jng_handle, 0);
    }
}
