/// audio_sfx_pause_all()
// Pauses all currently playing sounds.

with (mgr_audio)
{
    var i, sfx;

    for (i = 0; i < ds_list_size(sfx_list); i += 1)
    {
        sfx = ds_list_find_value(sfx_list, i);

        if (sound_isplaying(sfx))
        {
            sound_pause(sfx);
        }
    }
}
