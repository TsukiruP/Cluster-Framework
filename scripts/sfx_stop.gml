/// sfx_stop(sound)
// Stops a sound or instance.

// Stop resource:
if (is_string(argument0))
{
    var sfx;

    sfx = ds_map_find_value(ctrl_audio.sfx_map, argument0 + ".wav");
    audio_stop(sfx);
}

// Stop instance:
else
{
    audio_stop(argument0);
}
