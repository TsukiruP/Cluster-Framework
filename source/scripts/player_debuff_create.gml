/// player_debuff_create()
/// @desc Creates a debuff instance.
/// @returns {void}

if ((status_speed == SPEED_SLOW || status_panic_alarm > 0) && !instance_exists(debuff_inst))
{
    debuff_inst = instance_create(x, y, eff_debuff);
    with (debuff_inst) player_inst = other.id;
}
