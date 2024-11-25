/// game_checkpoint_set([reset])
// Sets the checkpoint values to the current game state.

with (mgr_game)
{
    // Reset:
    if (argument_count >= 1)
    {
        if (argument[0] == true)
        {
            checkpoint_timer = -1;
            checkpoint_x = -1;
            checkpoint_y = -1;
        }

        exit;
    }

    // Set checkpoint:
    checkpoint_timer = floor(stage_get_timer());
    checkpoint_x = floor(other.x);
    checkpoint_y = floor(other.y);
}
