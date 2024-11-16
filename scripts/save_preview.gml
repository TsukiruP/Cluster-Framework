/// save_preview()
// Returns a map containing data from existing save files.

with (mgr_game)
{
    var preview_map, save_buffer;

    // Preview map:
    preview_map = ds_map_create();

    for (i = 0; i < save_count; i += 1)
    {
        var save_string;

        // Save string:
        save_string = "save" + string(i);

        // Check if save exists:
        if (save_exists(i))
        {
            var save_temp;

            // Temporary save map:
            save_temp = ds_map_create();

            save_buffer = buffer_create();
            buffer_load(save_buffer, save_directory + save_string + ".sav");
            ds_map_read(save_temp, buffer_read_hex(save_buffer, buffer_get_size(save_buffer)));
            buffer_destroy(save_buffer);

            // Game mismatch:
            if (ds_map_get(save_temp, "game") != GAME_NAME)
            {
                ds_map_add(preview_map, save_string + "_exists", 2);
            }
            else if (ds_map_get(save_temp, "version") != GAME_VERSION)
            {
                ds_map_add(preview_map, save_string + "_exists", 3);
            }
            else
            {
                ds_map_add(preview_map, save_string + "_exists", 1);
                ds_map_add(preview_map, save_string + "_name", ds_map_get(save_temp, "name"));
                ds_map_add(preview_map, save_string + "_stage", ds_map_get(save_temp, "stage"));
                ds_map_add(preview_map, save_string + "_time", ds_map_get(save_temp, "time"));
                ds_map_add(preview_map, save_string + "_player", ds_map_get(save_temp, "player0"));
            }

            // Destroy temp map:
            ds_map_destroy(save_temp);
        }

        // Save file doesn't exist:
        else
        {
            ds_map_add(preview_map, save_string + "_exists", 0);
        }
    }
    
    return preview_map;
}
