/// audio_pause_sfx_all()
/// @desc Pauses all sounds.
/// @returns {void}

with (ctrl_audio)
{
    var i;

    for (i = 0; i < ds_list_size(sfx_list); i += 1)
    {
        var sfx; sfx = ds_list_find_value(sfx_list, i);

        if (sound_isplaying(sfx)) sound_pause(sfx);
    }
}
