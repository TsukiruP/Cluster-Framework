/// audio_play_jng(index)
/* Plays a jingle.
If the index doesn't exist or isn't the correct kind, nothing is played. */

with (ctrl_audio)
{
    if (sound_exists(argument0))
    {
        if (sound_get_kind(argument0) == 3)
        {
            audio_stop_jng();
            if (jng_handle == -1) jng_handle = sound_play_single(argument0);
            if (audio_drown_isplaying()) audio_mute_jng();
        }
    }
}
