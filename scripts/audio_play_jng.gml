/// audio_play_jng(jingle)
/// @desc Plays a jingle.
/// @param {string} jingle
/// @returns {void}

var _jingle; _jingle = argument0;

with (ctrl_audio)
{
    if (sound_exists(_jingle))
    {
        if (sound_get_kind(_jingle) == 3)
        {
            audio_stop_jng();
            jng_inst = sound_play_single(_jingle);
            if (audio_drown_isplaying()) audio_mute_jng();
        }
    }
}