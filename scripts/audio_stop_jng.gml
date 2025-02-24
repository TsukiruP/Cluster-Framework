/// audio_stop_jng([jingle])
/// @desc Stops a jingle.
/// @param {string} [jingle]
/// @returns {void}

var _jingle; if (argument_count > 0) _jingle = argument[0]; else _jingle = undefined;

with (ctrl_audio)
{
    if (!is_undefined(_jingle))
    {
        if (audio_jng_isplaying(_jingle)) audio_stop_jng();
    }
    else if (audio_jng_isplaying())
    {
        sound_stop(jng_inst);
        sound_discard(jng_inst);
        jng_inst = -1;
    }
}