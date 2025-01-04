/// game_save_auto()
// Writes a save to the last saved slot.

with (mgr_game)
{
    if (save_id != -1)
    {
        game_write_save(save_id);
        indicator_draw = true;
    }
}
