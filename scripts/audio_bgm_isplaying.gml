/// audio_bgm_isplaying()
/* Returns whether music is playing. */

with (ctrl_audio)
{
    return bgm_id != -1;
}
