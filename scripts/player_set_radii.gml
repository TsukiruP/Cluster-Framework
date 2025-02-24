/// player_set_radii(xradius, yradius, woffset, [coffset])
/// @desc Sets the player's radii.
/// @param {int} xradius
/// @param {int} yradius
/// @param {int} woffset
/// @param {int} [coffset]
/// @returns {void}

var _xradius; _xradius = argument[0];
var _yradius; _yradius = argument[1];
var _woffset; _woffset = argument[2];
var _coffset; if (argument_count > 3) _coffset = argument[3]; else _coffset = 0;

x_radius = _xradius;
y_radius = _yradius;
wall_radius = x_radius + _woffset;
camera_offset = _coffset;