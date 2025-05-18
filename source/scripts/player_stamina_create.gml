/// player_stamina_create()
/// @desc Creates a stamina instance.
/// @returns {void}

if (((character_index == CHAR_MILES && fly_time > 0) || energy < max_energy) && !instance_exists(stamina_inst))
{
    stamina_inst = instance_create(x, y, eff_stamina);
    with (stamina_inst) player_inst = other.id;
}
