/// audio_sfx_pause_all()
// Pauses all playing sfx.

with (mgr_audio)
{
    var i, sfx;

    for (i = 0; i < ds_list_size(sfx_list); i += 1)
    {
        sfx = ds_list_find_value(sfx_list, i);

        if (audio_isplaying(sfx))
        {
            audio_pause(sfx);
        }
    }
}
