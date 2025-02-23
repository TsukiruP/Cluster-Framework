/// save_menu_preview()
/// @desc Returns a preview map from existing save files.
/// @returns {ds_map}

with (ctrl_game)
{
    var preview_map; preview_map = ds_map_create();

    for ({var i; i = 0}; i < save_count; i += 1)
    {
        var save_string; save_string = "save" + string(i);

        if (game_save_exists(i))
        {
            var save_temp; save_temp = game_load_save_buffer(i);
            var character_list; character_list = ds_list_create();
            
            ds_list_read(character_list, ds_map_get(save_temp, "character_index"));
            ds_map_set(preview_map, save_string + "_exists", true);
            ds_map_set(preview_map, save_string + "_character", ds_list_find_value(character_list, 0));
            ds_map_set(preview_map, save_string + "_name", ds_map_get(save_temp, "name"));
            ds_map_set(preview_map, save_string + "_stage", ds_map_get(save_temp, "stage"));
            ds_map_set(preview_map, save_string + "_time", ds_map_get(save_temp, "time"));
            ds_list_destroy(character_list);
            ds_map_destroy(save_temp);
        }
        else ds_map_set(preview_map, save_string + "_exists", false);
    }

    return preview_map;
}