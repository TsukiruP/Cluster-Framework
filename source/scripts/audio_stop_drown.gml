/// audio_stop_drown()
/// @desc Stops drowning music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_drown_isplaying())
    {
        sound_stop(drown_inst);
        sound_discard(drown_inst);
        drown_inst = -1;
    }
}
