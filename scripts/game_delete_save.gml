/// game_delete_save(save)
/// @desc Deletes a save file.
/// @param {int} save
/// @returns {void}

var _save; _save = argument0;

with (ctrl_game)
{
    if (game_save_exists(_save)) file_delete(save_directory + "save" + string(_save) + ".sav");
}
