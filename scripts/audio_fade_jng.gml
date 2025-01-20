/// audio_fade_jng(out)
/* Adjusts jingle volume to imitate fading in or out. */

var bgm_volume;

bgm_volume = game_get_config("audio_bgm") / 100;

with (ctrl_audio)
{
    if (jng_handle != -1)
    {
        if (sound_isplaying(jng_handle))
        {
            if (argument0 == true)
            {
                if (sound_get_volume(jng_handle) > 0)
                {
                    sound_volume(jng_handle, max(sound_get_volume(jng_handle) - 0.01, 0));
                    if (sound_get_volume(jng_handle) == 0) audio_stop_jng();
                }
            }
            else
            {
                if (sound_get_volume(jng_handle) < bgm_volume) sound_volume(jng_handle, min(sound_get_volume(jng_handle) + 0.01, bgm_volume));
            }
        }
    }
}
