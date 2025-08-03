/// switch_exists_ext()
/// @desc An extention of switch_exists that activates switch_inst to run it again.
/// @returns {void}

if (!switch_exists())
{
    instance_activate_object(switch_inst);
    switch_exists();
    instance_deactivate_object(switch_inst);
}
