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
                // Stop music:
                audio_bgm_stop();
                
                // Play music:
                if (bgm_handle == -1)
                {
                    bgm_handle = sound_loop_ex(argument0, 1, 1, 0);
                }
            }
        }
    }
}
