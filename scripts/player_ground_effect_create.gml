/// player_ground_effect_create(sequence, [xscale], [xoffset])
/// @desc Returns the id of a new effect instance.
/// @param {script} sequence
/// @param {number} [xscale]
/// @param {number} [xoffset]
/// @returns {object}

var _sequence; _sequence = argument[0];
var _xscale; if (argument_count > 1) _xscale = argument[1]; else _xscale = 1;
var _xoffset; if (argument_count > 2) _xoffset = argument[2]; else _xoffset = 0;

var sine; sine = dsin(mask_direction);
var csine; csine = dcos(mask_direction);
var effect_inst; effect_inst = effect_create(x - (csine * _xoffset * image_xscale) + (sine * y_radius), y + (sine * _xoffset * image_xscale) + (csine * y_radius), _sequence);

with (effect_inst) image_angle = other.mask_direction;
return effect_inst;
