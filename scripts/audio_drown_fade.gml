/// audio_fade_drown(out)
/* Adjusts drown volume to imitate fading in or out. */

with (ctrl_audio)
{
    if (audio_drown_isplaying())
    {
        if (argument0)
        {
            if (sound_isplaying(drown_id))
            {
                if (sound_get_volume(drown_id) > 0)
                {
                    sound_volume(drown_id, max(sound_get_volume(drown_id) - 0.01, 0));
                    if (sound_get_volume(drown_id) == 0) audio_stop_drown();
                }
            }
        }
    }
}
