/// audio_resume_sfx_all()
/// @desc Resumes all sounds.
/// @returns {void}

with (ctrl_audio)
{
    for ({var i; i = 0}; i < ds_list_size(sfx_list); i += 1)
    {
        var sfx; sfx = ds_list_find_value(sfx_list, i);

        sound_resume(sfx);
    }
}