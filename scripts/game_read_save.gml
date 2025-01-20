/// game_read_save(id)
/* Reads a save file and applies it. */

with (ctrl_game)
{
    if (game_save_exists(argument0))
    {
        var i, save_temp, save_key;

        save_id = argument0;
        save_temp = game_load_save_buffer(argument0);
        save_key = ds_map_find_first(save_map);

        for (i = 0; i < ds_map_size(save_map); i += 1)
        {
            if (ds_map_exists(save_temp, save_key))
            {
                ds_map_replace(save_map, save_key, ds_map_find_value(save_temp, save_key));
            }

            save_key = ds_map_find_next(save_map, save_key);
        }

        ds_map_destroy(save_temp);
    }
}
