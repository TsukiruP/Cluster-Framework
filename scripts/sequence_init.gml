/// sequence_init([sequence])
/// @desc Initializes sequence system.
/// @param {script} [sequence]
/// @returns {void}

var _sequence; if (argument_count > 0) _sequence = argument[0]; else _sequence = noone;

sequence_set(_sequence);
sequence_speed = 1;