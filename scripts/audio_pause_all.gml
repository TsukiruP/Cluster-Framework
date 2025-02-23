/// audio_pause_all()
/// @desc Pauses all audio.
/// @returns {void}

with (ctrl_audio)
{
    audio_pause_sfx_all();
    audio_pause_bgm();
    audio_pause_jng();
    audio_pause_drown();
}