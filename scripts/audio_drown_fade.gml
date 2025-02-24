/// audio_fade_drown([out])
/// @desc Indicates whether to fade out drowning music.
/// @param {bool} [out]
/// @returns {void}

var _out; if (argument_count > 0) _out = argument[0]; else _out = false;

with (ctrl_audio)
{
    if (audio_drown_isplaying())
    {
        if (_out)
        {
            if (sound_isplaying(drown_inst))
            {
                if (sound_get_volume(drown_inst) > 0)
                {
                    sound_volume(drown_inst, max(sound_get_volume(drown_inst) - 0.01, 0));
                    if (sound_get_volume(drown_inst) == 0) audio_stop_drown();
                }
            }
        }
    }
}