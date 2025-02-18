/// audio_jng_isplaying([jingle])
/// @desc Returns whether a jingle is currently playing.
/// @param {string} [jingle]
/// @returns {bool}

var _jingle; if (argument_count > 0) _jingle = argument[0]; else _jingle = undefined;

with (ctrl_audio)
{
    if (!is_undefined(_jingle))
    {
        if (sound_exists(argument[0])) return sound_isplaying(_jingle);
    }
    else return jng_id != -1;
}
