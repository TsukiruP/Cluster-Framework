/// game_save_auto()
/// @desc Writes a save to the last loaded slot.
/// @returns {void}

with (ctrl_game)
{
    if (game_get_save_index() != -1)
    {
        game_write_save(game_get_save_index());
        indicator_draw = true;
    }
}