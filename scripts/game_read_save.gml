/// game_read_save(save)
/// @desc Reads a save map from a file.
/// @param {int} save
/// @returns {void}

var _save; _save = argument0;

with (ctrl_game)
{
    if (game_save_exists(_save))
    {
        var save_temp; save_temp = game_load_save_buffer(_save);
        var save_key; save_key = ds_map_find_first(save_map);

        game_set_save_index(_save);

        for ({var i; i = 0}; i < ds_map_size(save_map); i += 1)
        {
            if (ds_map_exists(save_temp, save_key)) ds_map_replace(save_map, save_key, ds_map_find_value(save_temp, save_key));
            save_key = ds_map_find_next(save_map, save_key);
        }

        ds_map_destroy(save_temp);
        game_save_read_character();
        game_save_read_skill(CHAR_SONIC);
    }
}