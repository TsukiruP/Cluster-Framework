/// draw_rectangle_view(color, alpha)
/// @desc Draws a rectangle that covers the entire view.
/// @param {color} color
/// @param {number} alpha

var _color; _color = argument0;
var _alpha; _alpha = argument1;

draw_set1(_color, _alpha);
draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + screen_get_width(), view_yview[view_current] + screen_get_height(), false);
draw_reset();
