/// game_delete_save(id)
// Deletes a save file.

with (mgr_game)
{
    if (game_save_exists(argument0))
    {
        file_delete(save_directory + "save" + string(argument0) + ".sav");
    }
}
