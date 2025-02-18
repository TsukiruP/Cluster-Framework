/// audio_mute_jng()
/// @desc Mute a jingle.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_volume(jng_id, 0);
}
