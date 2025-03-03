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

with (_obj)
{
    if (object_index == obj_player)
    {
        var x_int; x_int = floor(x);
        var y_int; y_int = floor(y);
        var sine; sine = dsin(mask_direction);
        var csine; csine = dcos(mask_direction);
        
        var x1; x1 = x_int - (csine * x_radius * 2) - (sine * y_radius);
        var y1; y1 = y_int + (sine * x_radius * 2) - (csine * y_radius);
        var x2; x2 = x_int + (csine * x_radius * 2) + (sine * y_radius);
        var y2; y2 = y_int - (sine * x_radius * 2) + (csine * y_radius);
        
        return (rectangle_in_rectangle(x1, y1, x2, y2, view_left, view_top, view_right, view_bottom) != 0);
    }
    
    return (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, view_left, view_top, view_right, view_bottom) != 0);
}
