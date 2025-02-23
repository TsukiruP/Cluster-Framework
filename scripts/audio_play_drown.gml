/// audio_play_drown()
/// @desc Plays drowning music.
/// @returns {void}

with (ctrl_audio)
{
    audio_stop_drown();
    drown_id = sound_play_single("jng_drown");
}