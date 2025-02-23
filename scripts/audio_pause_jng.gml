/// audio_pause_jng()
/// @desc Pauses a jingle.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_pause(jng_id);
}