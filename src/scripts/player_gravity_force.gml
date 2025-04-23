/// player_gravity_force([force], [underwater])
/// @desc Applies gravity force.
/// @param {number} [force]
/// @param {number} [underwater]
/// @returns {void}

var _force; _force = gravity_force;
var _underwater; _underwater = gravity_force_underwater;

if (argument_count > 0)
{
    _force = argument[0];

    if (argument_count > 1) _underwater = argument[1];
    else _underwater = _force / 2;
}

y_speed += pick(underwater, _force, _underwater);
