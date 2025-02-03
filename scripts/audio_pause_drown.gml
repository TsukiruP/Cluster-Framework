/// audio_pause_drown()
/* Pauses the drowning music. */

with (ctrl_audio)
{
    if (audio_drown_isplaying()) sound_pause(drown_id);
}
