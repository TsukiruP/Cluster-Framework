/// sequence_init([sequence])
/* Initializes sequence variables. */

sequence_speed = 1;
sequence_set(noone);

if (argument_count >= 1)
{
    sequence_set(argument[0]);
}
