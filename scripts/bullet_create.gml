/// bullet_create(x, y, sequence, xspeed, yspeed, [gravity])
/// @desc Returns the id of a new bullet instance.
/// @param {number} x
/// @param {number} y
/// @param {script} sequence
/// @param {number} xspeed
/// @param {number} yspeed
/// @param {number} [gravity]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _sequence; _sequence = argument[2];
var _xspeed; _xspeed = argument[3];
var _yspeed; _yspeed = argument[4];
var _gravity; if (argument_count > 5) _gravity = argument[5]; else _gravity = 0;

var bullet_id; bullet_id = instance_create(_x, _y, par_bullet);

with (bullet_id)
{
    depth = other.depth;
    x_speed = _xspeed;
    y_speed = _yspeed;
    gravity_force = _gravity;
    sequence_set(_sequence);
}

return bullet_id;