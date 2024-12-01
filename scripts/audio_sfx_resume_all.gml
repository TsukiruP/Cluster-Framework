/// audio_sfx_resume_all()
// Resumes all playing sfx.

with (mgr_audio)
{
    var i, sfx;

    for (i = 0; i < ds_list_size(sfx_list); i += 1)
    {
        sfx = ds_list_find_value(sfx_list, i);

        audio_resume(sfx);
    }
}
