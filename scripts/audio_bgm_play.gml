/// audio_bgm_play(index)
// Plays background music.

with (mgr_audio)
{
    // Set volume:
    if (sound_kind_get_volume(1) != game_setting_get("audio_bgm"))
    {
        sound_kind_volume(1, game_setting_get("audio_bgm"));
    }

    // Check BGM:
    if (argument0 != "")
    {
        if (!sound_isplaying(argument0))
        {
            // Discard BGM:
            if (bgm_handle != -1)
            {
                sound_discard(bgm_handle);
                bgm_handle = -1;
            }

            // Create BGM:
            if (bgm_handle == -1)
            {
                bgm_handle = sound_loop(argument0);
            }
        }
    }
}
