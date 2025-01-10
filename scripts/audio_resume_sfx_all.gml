/// audio_resume_sfx_all()
/* Resumes all currently paused sounds. */

with (mgr_audio)
{
    var i, sfx;

    for (i = 0; i < ds_list_size(sfx_list); i += 1)
    {
        sfx = ds_list_find_value(sfx_list, i);
        sound_resume(sfx);
    }
}
