/// sequence_update()
/// @desc Updates the sequence.
/// @returns {void}

sequence_moment_previous = sequence_moment;
sequence_moment += sequence_speed;
sequence_moment = roundto(sequence_moment, pick(sequence_speed > 0, 1, sequence_speed));