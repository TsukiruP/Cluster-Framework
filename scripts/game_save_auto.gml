/// game_save_auto()
/* Writes a save to the last saved slot.
Tells the game controller to draw the autosave indicator. */

with (ctrl_game)
{
    if (game_get_save_id() != -1)
    {
        game_write_save(game_get_save_id());
        indicator_draw = true;
    }
}
