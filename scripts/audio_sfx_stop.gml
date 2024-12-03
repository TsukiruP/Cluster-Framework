/// audio_sfx_stop(index)
// Stops a sound or instance.

with (mgr_audio)
{
    if (sound_exists(argument0))
    {
        sound_stop(argument0);
    }
}
