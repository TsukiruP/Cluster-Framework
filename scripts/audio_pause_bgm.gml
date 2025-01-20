/// audio_pause_bgm()
/* Pauses music. */

with (ctrl_audio)
{
    if (bgm_handle != -1) sound_pause(bgm_handle);
}
