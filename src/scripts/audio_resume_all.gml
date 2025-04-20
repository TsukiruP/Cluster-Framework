/// audio_resume_all()
/// @desc Resumes all audio.
/// @returns {void}

with (ctrl_audio)
{
    audio_resume_sfx_all();
    audio_resume_bgm();
    audio_resume_jng();
    audio_drown_resume();
}
