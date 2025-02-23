/// game_set_checkpoint([reset])
/// @desc Sets checkpoint values.
/// @param {bool} [reset]
/// @returns {void}

var _reset; if (argument_count > 0) _reset = argument[0]; else _reset = false;

with (ctrl_game)
{
    if (_reset)
    {
        checkpoint_x = -1;
        checkpoint_y = -1;
        checkpoint_time = -1;
        exit;
    }

    checkpoint_x = floor(other.x);
    checkpoint_y = floor(other.y);
    checkpoint_time = floor(stage_get_time());
}