/// game_checkpoint_isset()
/// @desc Returns whether checkpoint data is set.
/// @returns {bool}

with (ctrl_game) return (checkpoint_time > -1 || checkpoint_x > -1 || checkpoint_y > -1);