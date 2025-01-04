/// audio_fade_jng(out)
// Adjusts jingle volume to imitate fading in or out.

with (mgr_audio)
{
    if (jng_handle != -1)
    {
        // Fade out:
        if (argument0 == true)
        {
            if (sound_isplaying(jng_handle))
            {
                if (sound_get_volume(jng_handle) > 0)
                {
                    sound_volume(jng_handle, max(sound_get_volume(jng_handle) - 0.01, 0));

                    if (sound_get_volume(jng_handle) == 0)
                    {
                        audio_stop_jng();
                    }
                }
            }
        }

        // Fade in:
        else
        {
            if (sound_isplaying(jng_handle) && sound_get_volume(jng_handle) < game_get_config("audio_bgm") / 100)
            {
                sound_volume(jng_handle, min(sound_get_volume(jng_handle) + 0.01, game_get_config("audio_bgm") / 100));
            }
        }
    }
}
