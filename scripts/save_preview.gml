/// save_preview()
// Returns a map containing data from existing save files.

with (mgr_game)
{
    var preview_map, buffer;

    // Preview map:
    preview_map = ds_map_create();

    for (i = 0; i < save_count; i += 1)
    {
        // Check if save exists:
        if (save_exists(i))
        {
            var save_temp;

            // Temporary save map:
            save_temp = ds_map_create();

            buffer = buffer_create();
            buffer_load(buffer, save_directory + "save" + string(i) + ".sav");
            ds_map_read(save_temp, buffer_read_hex(buffer, buffer_get_size(buffer)));
            buffer_destroy(buffer);

            // Game mismatch:
            if (ds_map_get(save_temp, "game") != GAME_NAME)
            {
                ds_map_add(preview_map, "save" + string(i) + "_exists", 2);
            }
            else
            {
                ds_map_add(preview_map, "save" + string(i) + "_exists", 1);
                ds_map_add(preview_map, "save" + string(i) + "_name", ds_map_get(save_temp, "name"));
                ds_map_add(preview_map, "save" + string(i) + "_stage", ds_map_get(save_temp, "stage"));
                ds_map_add(preview_map, "save" + string(i) + "_time", ds_map_get(save_temp, "time"));
            }

            // Destroy temp map:
            ds_map_destroy(save_temp);
        }

        // Save file doesn't exist:
        else
        {
            ds_map_add(preview_map, "save" + string(i) + "_exists", 0);
        }
    }
    
    return preview_map;
}
