/// audio_stop_bgm()
/// @desc Stops music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_bgm_isplaying())
    {
        sound_stop(bgm_inst);
        sound_discard(bgm_inst);
        bgm_inst = -1;
    }
}