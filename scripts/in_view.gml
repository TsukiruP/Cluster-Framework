/// in_view([inst])
/// @desc Returns whether the instance is within the current view.
/// @param {object} [inst]
/// @returns {bool}

var _inst; if (argument_count > 0) _inst = argument[0]; else _inst = id;

with (_inst) return point_in_rectangle(x, y, view_xview[view_current], view_yview[view_current], view_xview[view_current] + screen_get_width(), view_yview[view_current] + screen_get_height());
