/// audio_pause_all()
/* Pauses all currently playing audio. */

with (mgr_audio)
{
    audio_pause_sfx_all();
    audio_pause_bgm();
    audio_pause_jng();
    audio_pause_drown();
}
