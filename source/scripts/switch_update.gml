/// switch_update()
/// @desc Updates switch variables depending on switch_exists.
/// @returns {void}

if (!switch_exists())
{
    instance_activate_object(switch_inst);
    switch_exists();
}
