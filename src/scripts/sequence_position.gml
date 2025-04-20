/// sequence_position(moment)
/// @desc Returns whether the sequence is past the moment.
/// @param {int} moment
/// @returns {bool}

var _moment; _moment = argument0;

return (sequence_moment_previous <= _moment && sequence_moment > _moment);
