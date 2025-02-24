/// audio_play_bgm(music)
/// @desc Plays music.
/// @param {string} music
/// @returns {void}

var _music; _music = argument0;

with (ctrl_audio)
{
    if (sound_exists(_music))
    {
        if (sound_get_kind(_music) == 1)
        {
            if (!sound_isplaying(_music))
            {
                audio_stop_bgm();
                bgm_inst = sound_loop_ex(_music, 1, 1, 0);
            }
        }
    }
}