/// sequence_set(sequence, [moment])
/// @desc Sets the sequence.
/// @param {script} sequence
/// @param {int} [moment]
/// @returns {void}

var _sequence; _sequence = argument[0];
var _moment; if (argument_count > 1) _moment = argument[1]; else _moment = 0;;

sequence_index = _sequence;
sequence_moment = _moment;
sequence_moment_previous = 0;
