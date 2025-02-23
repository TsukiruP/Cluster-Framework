/// audio_pause_drown()
/// @desc Pauses drowning music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_drown_isplaying()) sound_pause(drown_id);
}