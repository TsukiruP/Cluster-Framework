/// in_view([obj])
/* Returns whether the object is within the current view.
obj: object to check. Defaults to the script caller. */

var object_handle;

// Initialize:
object_handle = id;

// Set object:
if (argument_count >= 1)
{
    object_handle = argument[0];
}

with (object_handle)
{
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}
