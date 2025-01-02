/// audio_play_drown()
// Plays drowning music.

with (mgr_audio)
{
    // Stop drowning music:
    audio_stop_drown();

    // Play drowning music:
    drown_handle = sound_play_single("jng_drown");
}
