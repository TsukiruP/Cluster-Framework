/// debug_save_create(mode)
/// @desc Creates a save menu instance with a set mode.
/// @param {int} mode
/// @returns {void}

var _mode; _mode = argument0;

if (!instance_exists(mnu_debug_save))
{
    with (instance_create(0, 0, mnu_debug_save)) menu_mode = _mode;
    audio_play_sfx("snd_menu_open", true);
}
