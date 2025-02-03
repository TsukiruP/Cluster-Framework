/// audio_play_drown()
/* Plays drowning music. */

with (ctrl_audio)
{
    audio_stop_drown();
    drown_id = sound_play_single("jng_drown");
}
