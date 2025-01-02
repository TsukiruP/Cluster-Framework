/// save_menu_create(mode)
// Creates a save menu with the given mode.

if (!instance_exists(mnu_save))
{
    with (instance_create(0, 0, mnu_save))
    {
        menu_mode = argument0;
    }

    // Play sound:
    audio_play_sfx("snd_menu_open", true);
}
