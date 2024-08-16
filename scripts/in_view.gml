/// in_view([obj])
// Returns whether the object is within the current view.

var obj_handle;

// Initialize:
obj_handle = id;

// Set object:
if (argument_count >= 1) {
    obj_handle = argument[0];
}

with (obj_handle) {
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}
