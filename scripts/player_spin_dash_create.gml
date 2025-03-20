/// player_spin_dash_create()
/// @desc Creates a Spin Dash instance.
/// @returns {void}

if (state_current == player_state_spin_dash && !instance_exists(spin_dash_inst))
{
    spin_dash_inst = instance_create(x, y, eff_spin_dash);
    with (spin_dash_inst) player_inst = other.id;
}
