/// audio_play_sfx(sound, [single, pan])
// Plays a sound effect.

with (mgr_audio)
{
    var sfx, single, pan;

    // Initialize:
    sfx = ds_map_find_value(sfx_map, argument0 + ".wav");
    single = false;
    pan = 0;

    // Set single:
    if (argument_count >= 2)
    {
        single = argument[1];
    }

    // Set pan:
    if (argument_count >= 3)
    {
        pan = argument[2];
    }

    // Play sound:
    if (single == true)
    {
        // Return:
        return audio_play_single_ext(sfx, game_setting_get("audio_sfx"), pan, 1, false);
    }

    // Return:
    return audio_play_ext(sfx, game_setting_get("audio_sfx"), pan, 1, false);
}
