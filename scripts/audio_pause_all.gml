/// audio_pause_all()
// Pauses all currently playing audio.

with (mgr_audio)
{
    audio_sfx_pause_all();
    audio_bgm_pause();
    audio_jng_pause();
    audio_drown_pause();
}
