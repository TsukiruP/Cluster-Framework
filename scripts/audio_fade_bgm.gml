// audio_fade_bgm(out)
/* Adjusts music volume to imitate fading in or out. */

var bgm_volume;

bgm_volume = game_get_config("audio_bgm") / 100;

if (argument0 == true)
{
    if (sound_kind_get_volume(1) > 0)
    {
        sound_kind_volume(1, max(sound_kind_get_volume(1) - 0.01, 0));

        if (sound_kind_get_volume(1) == 0)
        {
            audio_stop_bgm();
            sound_kind_volume(1, bgm_volume);
        }
    }
}
else
{
    if (sound_kind_get_volume(1) < bgm_volume) sound_kind_volume(1, min(sound_kind_get_volume(1) + 0.01, bgm_volume));
}
