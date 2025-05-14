/// hitbox_set_hurtbox([left], [top], [right], [bottom], [xoffset], [yoffset])
/// @desc Sets the calling instance's hurtbox.
/// @param {int} [left]
/// @param {int} [top]
/// @param {int} [right]
/// @param {int} [bottom]
/// @param {int} [xoffset]
/// @param {int} [yoffset]
/// @returns {void}

var _left; if (argument_count > 0) _left = argument[0]; else _left = 0;
var _top; if (argument_count > 1) _top = argument[1]; else _top = 0;
var _right; if (argument_count > 2) _right = argument[2]; else _right = 0;
var _bottom; if (argument_count > 3) _bottom = argument[3]; else _bottom = 0;
var _xoffset; if (argument_count > 4) _xoffset = argument[4]; else _xoffset = 0;
var _yoffset; if (argument_count > 5) _yoffset = argument[5]; else _yoffset = 0;

hurtbox_left = _left;
hurtbox_top = _top;
hurtbox_right = _right;
hurtbox_bottom = _bottom;

hurtbox_x_offset = _xoffset;
hurtbox_y_offset = _yoffset;
