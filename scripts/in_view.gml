/// in_view([instance])
// Returns if the given instance or the instance calling the script is inside the current view.

var instance_handle;

if (argument_count == 1) instance_handle = argument[0];
else instance_handle = id;

with (instance_handle) {
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}
