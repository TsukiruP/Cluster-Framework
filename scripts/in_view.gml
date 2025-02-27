/// in_view(obj, [padding])
/// @desc Returns whether the instance is within the current view.
/// @param {object} obj
/// @param {int} [padding]
/// @returns {bool}

var _obj; _obj = argument[0];
var _padding; if (argument_count > 1) _padding = argument[1]; else _padding = 0;

var view_left; view_left = view_xview[view_current] - _padding;
var view_top; view_top = view_yview[view_current] - _padding;
var view_right; view_right = view_xview[view_current] + screen_get_width() + _padding;
var view_bottom; view_bottom = view_yview[view_current] + screen_get_height() + _padding;

with (_obj) return point_in_rectangle(x, y, view_left, view_top, view_right, view_bottom);
