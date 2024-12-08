/// audio_jng_fade(out)
// Adjusts jingle volume to imitate fading in or out.

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
                    audio_jng_stop();
                }
            }
        }
    }

    // Fade in:
    else
    {
        if (sound_isplaying(jng_handle))
        {
            if (sound_get_volume(jng_handle) < game_setting_get("audio_bgm"))
            {
                sound_volume(jng_handle, min(sound_get_volume(jng_handle) + 0.01, game_setting_get("audio_bgm")));
            }
        }
    }
}
