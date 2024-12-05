/// audio_bgm_play(index)
// Plays background music.

with (mgr_audio)
{
    // Check if index exists:
    if (sound_exists(argument0))
    {
        // Check if BGM isn't already playing
        if (!sound_isplaying(argument0))
        {
            // Discard BGM:
            if (bgm_handle != -1)
            {
                sound_discard(bgm_handle);
                bgm_handle = -1;
            }
            
            // Play BGM:
            if (bgm_handle == -1)
            {
                bgm_handle = sound_loop_ex(argument0, game_setting_get("audio_bgm"), 1, 0);
            }
        }
    }
}
