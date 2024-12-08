/// audio_jng_mute()
// Sets the jingle volume to 0.

with (mgr_audio)
{
    // Check if a jingle is playing:
    if (audio_jng_isplaying())
    {
        sound_volume(jng_handle, 0);
    }
}
