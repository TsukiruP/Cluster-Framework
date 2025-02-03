/// audio_pause_bgm()
/* Pauses music. */

with (ctrl_audio)
{
    if (audio_bgm_isplaying()) sound_pause(bgm_id);
}
