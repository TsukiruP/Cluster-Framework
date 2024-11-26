/// game_checkpoint_set([reset])
// Sets the checkpoint values to the current game state.

with (mgr_game)
{
    // Reset:
    if (argument_count >= 1)
    {
        if (argument[0] == true)
        {
            checkpoint_time = -1;
            checkpoint_x = -1;
            checkpoint_y = -1;
        }

        exit;
    }

    // Set checkpoint:
    checkpoint_time = floor(stage_get_time());
    checkpoint_x = floor(other.x);
    checkpoint_y = floor(other.y);
}
