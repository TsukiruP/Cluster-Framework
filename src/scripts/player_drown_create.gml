/// player_drown_create()
/// @desc Creates a drown countdown instance.
/// @returns {void}

if (!instance_exists(drown_inst))
{
    drown_inst = instance_create(x, y, eff_drown);
    with (drown_inst) player_inst = other.id;
}
else with (drown_inst) active = true;
