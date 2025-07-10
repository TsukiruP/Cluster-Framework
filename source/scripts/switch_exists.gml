/// switch_exists()
/// @desc Returns whether the switch instance exists. Updates switch variables if so.
/// @returns bool

if (instance_exists(switch_inst))
{
    with (switch_inst)
    {
        other.switch_active = !collision;
        other.switch_time = target_time;
    }

    return true;
}

return false;
