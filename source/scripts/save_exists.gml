/// save_exists(save)
/// @desc Returns whether a save file exists.
/// @param {int} save
/// @returns {bool}

var _save; _save = argument0;

with (ctrl_save)
{
    if (file_exists(save_directory + "save" + string(_save) + ".sav"))
    {
        var save_temp; save_temp = save_load_buffer(_save);
        var save_game; save_game = ds_map_get(save_temp, "game");
        var save_version; save_version = ds_map_get(save_temp, "version");

        ds_map_destroy(save_temp);
        if (save_game == GAME_NAME && save_version == GAME_VERSION) return true;
    }

    return false;
}