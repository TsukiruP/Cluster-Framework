/// audio_bgm_play(index)
// Plays music.

with (mgr_audio)
{
    // Check if index exists:
    if (sound_exists(argument0))
    {
        // Check index kind:
        if (sound_get_kind(argument0) == 1)
        {
            // Check if music isn't already playing:
            if (!sound_isplaying(argument0))
            {
                // Discard music:
                if (bgm_handle != -1)
                {
                    sound_discard(bgm_handle);
                    bgm_handle = -1;
                }
                
                // Play music:
                if (bgm_handle == -1)
                {
                    bgm_index = argument0;
                    bgm_handle = sound_loop_ex(bgm_index, 1, 1, 0);
                }
            }
        }
    }
}
