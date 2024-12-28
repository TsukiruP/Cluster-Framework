/// game_save_delete(id)
// Deletes a save file.

with (mgr_game)
{
    if (game_save_exists(argument0))
    {
        file_delete(save_directory + "save" + string(argument0) + ".sav");
    }
}
