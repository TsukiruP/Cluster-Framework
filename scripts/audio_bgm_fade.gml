// audio_bgm_fade(out)
// Adjusts music volume to imitate fading in or out.

// Fade out:
if (argument0 == true)
{
    if (sound_kind_get_volume(1) > 0)
    {
        sound_kind_volume(1, max(sound_kind_get_volume(1) - 0.01, 0));

        if (sound_kind_get_volume(1) == 0)
        {
            audio_bgm_stop();
            sound_kind_volume(1, game_config_get("audio_bgm") / 100);
        }
    }
}

// Fade in:
else
{
    if (sound_kind_get_volume(1) < game_config_get("audio_bgm") / 100)
    {
        sound_kind_volume(1, min(sound_kind_get_volume(1) + 0.01, game_config_get("audio_bgm") / 100));
    }
}
