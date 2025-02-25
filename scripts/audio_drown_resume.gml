/// audio_resume_drown()
/// @desc Resumes drowning music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_drown_isplaying()) sound_resume(drown_inst);
}
