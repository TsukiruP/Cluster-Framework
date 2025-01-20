/// save_menu_preview()
/* Returns a map containing data from existing save files. */

with (ctrl_game)
{
    var i, preview_map;

    preview_map = ds_map_create();

    for (i = 0; i < save_count; i += 1)
    {
        var save_string;

        save_string = "save" + string(i);

        if (game_save_exists(i))
        {
            var save_temp;

            save_temp = game_load_save_buffer(i);
            ds_map_set(preview_map, save_string + "_exists", true);
            ds_map_set(preview_map, save_string + "_name", ds_map_get(save_temp, "name"));
            ds_map_set(preview_map, save_string + "_stage", ds_map_get(save_temp, "stage"));
            ds_map_set(preview_map, save_string + "_time", ds_map_get(save_temp, "time"));
            ds_map_set(preview_map, save_string + "_player", ds_map_get(save_temp, "player0"));
            ds_map_destroy(save_temp);
        }
        else ds_map_set(preview_map, save_string + "_exists", false);
    }

    return preview_map;
}
