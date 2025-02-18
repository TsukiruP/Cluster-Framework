/// game_save_reset_character()
/// @desc Resets the character list.
/// @returns {void}

with (ctrl_game)
{
    ds_list_clear(character_list);

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        ds_list_add(character_list, -1);
    }

    game_save_set_character(0, CHAR_SONIC);
}
