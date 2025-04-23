/// player_gravity_force([force])
/// @desc Applies gravity force.
/// @param {number} [force]
/// @returns {void}

var _force; if (argument_count > 0) _force = argument[0]; else _force = gravity_force;

y_speed += _force;
