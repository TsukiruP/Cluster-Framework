/// sonic_super_skid_create()
/// @desc Creates a super skid instance.
/// @returns {void}

if (state_current == sonic_state_skid && (boost_mode || peel_out) && animation_current == "skid" && !instance_exists(super_skid_inst))
{
    super_skid_inst = instance_create(x, y, eff_super_skid);
    with (super_skid_inst) player_inst = other.id;
}
