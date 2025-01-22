/// game_save_read_character()
/* Copies the character list from the save map. */

with (ctrl_game)
{
    var i, save_list;

    save_list = ds_list_create();
    ds_list_read(save_list, game_get_save("character"));

    for (i = 0; i < min(ds_list_size(save_list), PLAYER_COUNT); i += 1)
    {
        ds_list_replace(character_list, i, ds_list_find_value(save_list, i));
    }

    ds_list_destroy(save_list);
}
