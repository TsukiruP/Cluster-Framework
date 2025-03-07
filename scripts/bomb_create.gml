/// bomb_create(x, y, sequence, [gravity])
/// @desc Returns the id of a new bomb instance.
/// @param {number} x
/// @param {number} y
/// @param {script} sequence
/// @param {number} [gravity]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _sequence; _sequence = argument[2];
var _gravity; if (argument_count > 3) _gravity = argument[3]; else _gravity = 0;

var bomb_inst; bomb_inst = instance_create(_x, _y, par_bomb);

with (bomb_inst)
{
    depth = other.depth + 1;
    image_xscale = other.image_xscale;
    gravity_force = _gravity;
    sequence_set(_sequence);
}

return bomb_inst;
