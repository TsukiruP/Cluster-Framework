/// explosive_create(x, y, sequence, [gravity])
/// @desc Returns the id of a new explosive instance.
/// @param {number} x
/// @param {number} y
/// @param {script} sequence
/// @param {number} [gravity]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _sequence; _sequence = argument[2];
var _gravity; if (argument_count > 3) _gravity = argument[3]; else _gravity = 0;

var explosive_inst; explosive_inst = instance_create(_x, _y, par_explosive);

with (explosive_inst)
{
    depth = other.depth + 1;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    gravity_force = _gravity;
    sequence_set(_sequence);
}

return explosive_inst;
