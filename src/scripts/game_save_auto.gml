/// save_auto()
/// @desc Writes a save to the last loaded slot.
/// @returns {void}

with (ctrl_game)
{
    if (save_get_index() != -1)
    {
        save_write(save_get_index());
        indicator_draw = true;
    }
}
