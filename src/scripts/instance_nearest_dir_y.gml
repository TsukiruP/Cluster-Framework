/// instance_nearest_dir_y(x, y, obj, dir, dist, [n])
/// @desc Returns the id of the nearest instance in a direction.
/// @param {number} x
/// @param {number} y
/// @param {object} obj
/// @param {int} dir
/// @param {number} dist
/// @param {int} [n]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _obj; _obj = argument[2];
var _dir; _dir = argument[3];
var _dist; if (argument_count > 4) _dist = argument[4]; else _dist = -1;
var _n; if (argument_count > 5) _n = argument[5]; else _n = 1;

repeat (instance_number(_obj))
{
    var inst; inst = instance_nth_nearest(_x, _y, _obj, _n);

    if ((distance_to_object(inst) > _dist && _dist != -1) || !instance_exists(inst)) break;
    inst_dir = -dsin(round(direction_to_object(inst) / ANGLE_UP) * ANGLE_UP);
    if (inst_dir == _dir) return inst;
    _n += 1;
}

return noone;
