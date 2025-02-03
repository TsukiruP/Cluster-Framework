/// audio_resume_drown()
/* Resumes the drowning music. */

with (ctrl_audio)
{
    if (audio_drown_isplaying()) sound_resume(drown_id);
}
