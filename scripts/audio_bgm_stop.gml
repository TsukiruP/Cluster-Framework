/// audio_bgm_stop()
// Stops music.

sound_kind_stop(1);

// Discard music:
if (bgm_handle != -1)
{
    sound_discard(bgm_handle);
    bgm_handle = -1;
}
