/// instance_nearest_dir_x(x, y, object, direction, distance, [n])
/// @desc Returns the id of the nearest instance in a direction.
/// @param {number} x
/// @param {number} y
/// @param {object} object
/// @param {int} direction
/// @param {number} distance
/// @param {int} [n]
/// @returns {object}

var _x; _x = argument[0];
var _y; _y = argument[1];
var _object; _object = argument[2];
var _direction; _direction = argument[3];
var _distance; _distance = argument[4];
var _n; if (argument_count > 5) _n = argument[5]; else _n = 1;

repeat (instance_number(_object))
{
    var inst; inst = instance_nth_nearest(_x, _y, _object, _n);

    if (distance_to_object(inst) > _distance || !instance_exists(inst)) break;
    inst_dir = dcos(round(direction_to_object(inst) / ANGLE_LEFT) * ANGLE_LEFT);
    if (inst_dir == _direction) return inst;
    _n += 1;
}

return noone;