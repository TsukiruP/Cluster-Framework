/// audio_bgm_load(index)
// Loads and plays background music, should it not already exist.
/*
with (mgr_audio)
{
    // Stop BGM:
    if (argument0 == "" || argument0 != bgm_index)
    {
        audio_music_stop();
        audio_delete(bgm_index);
    }

    // Play BGM:
    if (argument0 != "")
    {
        var bgm;

        bgm_index = argument0;
        bgm = audio_load("data\audio\bgm\" + bgm_index + ".ogg");
        audio_music_play(bgm);
        audio_music_volume(game_setting_get("audio_bgm"));
    }
}
