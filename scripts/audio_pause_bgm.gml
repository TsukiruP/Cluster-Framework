/// audio_pause_bgm()
/// @desc Pauses music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_bgm_isplaying()) sound_pause(bgm_id);
}