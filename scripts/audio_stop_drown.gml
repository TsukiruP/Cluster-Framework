/// audio_stop_drown()
/// @desc Stops drowning music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_drown_isplaying())
    {
        sound_stop(drown_id);
        sound_discard(drown_id);
        drown_id = -1;
    }
}