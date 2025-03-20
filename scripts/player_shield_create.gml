/// player_shield_create()
/// @desc Creates a shield instance.
/// @returns {void}

if ((status_shield != SHIELD_NONE || status_invin == INVIN_BUFF) && !instance_exists(shield_inst))
{
    shield_inst = instance_create(x, y, eff_shield);
    with (shield_inst) player_inst = other.id;
}
