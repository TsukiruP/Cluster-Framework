/// game_save_auto()
/// @desc Writes a save to the last loaded slot.
/// @returns {void}

with (ctrl_game)
{
    if (game_save_get_index() != -1)
    {
        game_save_write(game_save_get_index());
        indicator_draw = true;
    }
}
