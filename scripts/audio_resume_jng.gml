/// audio_resume_jng()
/// @desc Resumes a jingle.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_resume(jng_id);
}