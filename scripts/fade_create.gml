/// fade_create([target], [speed], [depth], [color])
/// @desc Returns the id of a new fade instance.
/// @param {number} [target]
/// @param {number} [speed]
/// @param {int} [depth]
/// @param {color} [color]
/// @returns {object}

var _target; if (argument_count > 0) _target = argument[0]; else _target = 1;
var _speed; if (argument_count > 1) _speed = argument[1]; else _speed = 0.02;
var _depth; if (argument_count > 2) _depth = argument[2]; else _depth = depth;
var _color; if (argument_count > 3) _color = argument[3]; else _color = c_black;

var fade_inst; fade_inst = instance_create(0, 0, ctrl_fade);

with (fade_inst)
{
    fade_target = _target;
    fade_speed = _speed;
    depth = _depth;
    fade_color = _color;
}

return fade_inst;
