/// miles_tails_create()
/// @desc Creates a tail instance.
/// @returns {void}

if (character_index == CHAR_MILES && !instance_exists(tails_inst))
{
    tails_inst = instance_create(x, y, eff_tails);
    with (tails_inst) player_inst = other.id;
}
