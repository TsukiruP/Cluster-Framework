/// sequence_init([sequence])
/* Initializes sequence variables. */

var sequence;

sequence = noone;
if (argument_count > 0) sequence = argument[0];

sequence_set(sequence);
sequence_speed = 1;
