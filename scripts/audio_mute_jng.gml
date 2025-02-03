/// audio_mute_jng()
/* Sets the jingle volume to 0. */

with (ctrl_audio)
{
    if (audio_jng_isplaying()) sound_volume(jng_id, 0);
}
