/// save_read_character()
/// @desc Reads the character list from the save map.
/// @returns {void}

with (ctrl_save)
{
    var save_list; save_list = ds_list_create();

    ds_list_read(save_list, save_get("character_index"));

    for ({var i; i = 0}; i < min(ds_list_size(save_list), PLAYER_COUNT); i += 1)
    {
        ds_list_replace(character_list, i, ds_list_find_value(save_list, i));
    }

    ds_list_destroy(save_list);
}