/// effect_create(x, y, sequence, [depth], [xscale], [yscale])
/// @desc Returns the id of a new effect instance.
/// @param {number} x
/// @param {number} y
/// @param {script} sequence
/// @param {int} [depth]
/// @param {number} [xscale]
/// @param {number} [yscale]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _sequence; _sequence = argument[2];
var _depth; if (argument_count > 3) _depth = argument[3]; else _depth = depth;
var _xscale; if (argument_count > 4) _xscale = argument[4]; else _xscale = 1;
var _yscale; if (argument_count > 5) _yscale = argument[5]; else _yscale = 1;

var effect_inst; effect_inst = instance_create(floor(_x), floor(_y), par_effect);

with (effect_inst)
{
    depth = _depth;
    image_xscale = _xscale;
    image_yscale = _yscale;
    sequence_set(_sequence);
}

return effect_inst;