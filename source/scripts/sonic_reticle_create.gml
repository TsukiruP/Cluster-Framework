/// sonic_reticle_create()
/// @desc Creates a debuff instance.
/// @returns {void}

if (config_get("misc_reticle") > 0 && tag_leader_state != STATE_FINISH && instance_exists(homing_inst) && !instance_exists(reticle_inst))
{
    reticle_inst = instance_create(x, y, eff_reticle);
    with (reticle_inst) player_inst = other.id;
}
