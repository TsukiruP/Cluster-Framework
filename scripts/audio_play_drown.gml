/// audio_play_drown()
/* Plays drowning music. */

with (mgr_audio)
{
    audio_stop_drown();
    drown_handle = sound_play_single("jng_drown");
}
