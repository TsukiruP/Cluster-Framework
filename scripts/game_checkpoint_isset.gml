/// game_checkpoint_isset()
// Returns whether checkpoint data has been set.

with (mgr_game)
{
    return (checkpoint_timer > -1 || checkpoint_x > -1 || checkpoint_y > -1);
}
