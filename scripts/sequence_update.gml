/// sequence_update()
/// @desc Updates the sequence moment.
/// @returns {void}

sequence_moment_previous = sequence_moment;
sequence_moment = roundto_step(sequence_moment, sequence_speed);
