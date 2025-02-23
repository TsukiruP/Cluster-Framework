/// audio_resume_bgm()
/// @desc Resumes music.
/// @returns {void}

with (ctrl_audio)
{
    if (audio_bgm_isplaying()) sound_resume(bgm_id);
}