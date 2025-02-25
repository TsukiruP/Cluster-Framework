/// audio_pause_sfx_all()
/// @desc Pauses all sounds.
/// @returns {void}

with (ctrl_audio)
{
    for ({var i; i = 0}; i < ds_list_size(sfx_list); i += 1)
    {
        var sfx_inst; sfx_inst = ds_list_find_value(sfx_list, i);

        if (sound_isplaying(sfx_inst)) sound_pause(sfx_inst);
    }
}
