/// audio_stop_bgm()
/* Stops music. */

with (ctrl_audio)
{
    if (audio_bgm_isplaying())
    {
        sound_stop(bgm_id);
        sound_discard(bgm_id);
        bgm_id = -1;
    }
}
