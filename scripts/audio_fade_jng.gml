/// audio_fade_jng([out])
/// @desc Indicates whether to fade out a jingle.
/// @param {bool} [out]
/// @returns {void}

var _out; if (argument_count > 0) _out = argument[0]; else _out = false;

var bgm_volume; bgm_volume = game_get_config("audio_bgm") / 100;

with (ctrl_audio)
{
    if (audio_jng_isplaying())
    {
        if (sound_isplaying(jng_id))
        {
            if (_out)
            {
                if (sound_get_volume(jng_id) > 0)
                {
                    sound_volume(jng_id, max(sound_get_volume(jng_id) - 0.01, 0));
                    if (sound_get_volume(jng_id) == 0) audio_stop_jng();
                }
            }
            else if (sound_get_volume(jng_id) < bgm_volume) sound_volume(jng_id, min(sound_get_volume(jng_id) + 0.01, bgm_volume));
        }
    }
}