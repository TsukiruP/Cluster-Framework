/// sequence_execute()
/// @desc Updates and executes a sequence if it exists.
/// @returns {void}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}