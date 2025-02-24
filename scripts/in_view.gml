/// in_view([inst])
/// @desc Returns whether the instance is within the current view.
/// @param {object} [inst]
/// @returns {bool}

var _inst; if (argument_count > 0) _inst = argument[0]; else _inst = id;

with (_inst)
{
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}
