/// in_view([instance])
/// @desc Returns whether the object is within the current view.
/// @param {object} [instance]
/// @returns {bool}

var inst; inst = id;

with (inst)
{
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}