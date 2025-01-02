/// audio_fade_drown(out)
// Adjusts drown volume to imitate fading in or out.

with (mgr_audio)
{
    if (drown_handle != -1)
    {
        // Fade out:
        if (argument0 == true)
        {
            if (sound_isplaying(drown_handle))
            {
                if (sound_get_volume(drown_handle) > 0)
                {
                    sound_volume(drown_handle, max(sound_get_volume(drown_handle) - 0.01, 0));

                    if (sound_get_volume(drown_handle) == 0)
                    {
                        audio_stop_drown();
                    }
                }
            }
        }
    }
}
