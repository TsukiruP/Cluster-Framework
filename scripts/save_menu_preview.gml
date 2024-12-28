/// save_menu_preview()
// Returns a map containing data from existing save files.

with (mgr_game)
{
    var preview_map, i;

    // Preview map:
    preview_map = ds_map_create();

    for (i = 0; i < save_count; i += 1)
    {
        var save_string;

        // Save string:
        save_string = "save" + string(i);

        // Check if save exists:
        if (game_save_exists(i))
        {
            var save_temp;

            // Temporary save map:
            save_temp = game_save_buffer_load(i);

            ds_map_set(preview_map, save_string + "_exists", true);
            ds_map_set(preview_map, save_string + "_name", ds_map_get(save_temp, "name"));
            ds_map_set(preview_map, save_string + "_stage", ds_map_get(save_temp, "stage"));
            ds_map_set(preview_map, save_string + "_time", ds_map_get(save_temp, "time"));
            ds_map_set(preview_map, save_string + "_player", ds_map_get(save_temp, "player0"));

            // Destroy temp map:
            ds_map_destroy(save_temp);
        }

        // Save file doesn't exist:
        else
        {
            ds_map_set(preview_map, save_string + "_exists", false);
        }
    }
    
    return preview_map;
}
