/// audio_drown_play()
// Plays drowning music.

with (mgr_audio)
{
    // Stop drowning music:
    audio_drown_stop();

    // Play drowning music:
    drown_handle = sound_play_single("jng_drown");
}
