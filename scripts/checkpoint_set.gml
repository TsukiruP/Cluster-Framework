/// checkpoint_set([reset])
// Sets the checkpoint values to the current game state.

global.checkpoint_x = floor(x);
global.checkpoint_y = floor(y);
global.checkpoint_time = floor(global.game_time);

// Reset:
if (argument_count >= 1)
{
    if (argument[0] == true)
    {
        global.checkpoint_x = -1;
        global.checkpoint_y = -1;
        global.checkpoint_time = -1;
    }
}
