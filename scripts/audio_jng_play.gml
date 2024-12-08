/// audio_jng_play(index)
// Plays a jingle.

with (mgr_audio)
{
    // Check if index exists:
    if (sound_exists(argument0))
    {
        // Check index kind:
        if (sound_get_kind(argument0) == 3)
        {
            // Stop jingle:
            audio_jng_stop();

            // Play jingle:
            if (jng_handle == -1)
            {
                jng_index = argument0;
                jng_handle = sound_play_single(jng_index);
            }
        }
    }
}
