/// audio_stop_sfx(sound)
// Stops a sound or instance.

with (mgr_audio)
{
    // Stop resource:
    if (is_string(argument0))
    {
        var sfx;

        sfx = ds_map_find_value(sfx_map, argument0 + ".wav");
        audio_stop(sfx);
    }

    // Stop instance:
    else
    {
        audio_stop(argument0);
    }
}
