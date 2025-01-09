/// game_checkpoint_isset()
/* Returns whether checkpoint data has been set. */

with (mgr_game)
{
    return (checkpoint_time > -1 || checkpoint_x > -1 || checkpoint_y > -1);
}
