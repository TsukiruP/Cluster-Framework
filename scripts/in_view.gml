/// in_view([obj])
/* Returns whether the object is within the current view.
Defaults to the script caller. */

var inst;

inst = id;

if (argument_count >= 1)
{
    inst = argument[0];
}

with (inst)
{
    return ((bbox_right > view_xview[view_current]) && (bbox_left < view_xview[view_current] + view_wview[view_current]) && (bbox_bottom > view_yview[view_current]) && (bbox_top < view_yview[view_current] + view_hview[view_current]));
}
