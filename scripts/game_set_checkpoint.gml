/// game_set_checkpoint([reset])
/* Sets the checkpoint values to the current game state. */

with (ctrl_game)
{
    // Reset:
    if (argument_count > 0)
    {
        if (argument[0] == true)
        {
            checkpoint_x = -1;
            checkpoint_y = -1;
            checkpoint_time = -1;
        }

        exit;
    }

    checkpoint_x = floor(other.x);
    checkpoint_y = floor(other.y);
    checkpoint_time = floor(stage_get_time());
}
