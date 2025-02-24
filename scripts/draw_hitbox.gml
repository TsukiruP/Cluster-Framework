/// draw_hitbox(left, top, right, bottom, xoffset, yoffset, rot, color)
/// @desc Draws a rectangular outline that flips and rotates accordingly.
/// @param {int} left
/// @param {int} top
/// @param {int} right
/// @param {int} bottom
/// @param {int} xoffset
/// @param {int} yoffset
/// @param {number} rot
/// @param {color} color

var _left; _left = argument0;
var _top; _top = argument1;
var _right; _right = argument2;
var _bottom; _bottom = argument3;
var _xoffset; _xoffset = argument4;
var _yoffset; _yoffset = argument5;
var _rot; _rot = argument6;
var _color; _color = argument7;

_xoffset *= image_xscale;
_yoffset *= image_yscale;
_rot = round(_rot / 90) * 90;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(_rot);
var csine; csine = dcos(_rot);

if (sign(image_xscale) == -1)
{
    var temp; temp = _left;
    
    _left = _right;
    _right = temp;
}

if (sign(image_yscale) == -1)
{
    var temp; temp = _top;
    
    _top = _bottom;
    _bottom = temp;
}

if !(_left == 0 && _top == 0 && _right == 0 && _bottom == 0)
{

    var x1; x1 = x_int - (csine * _left) + (csine * _xoffset) - (sine * _top) + (sine * _yoffset);
    var y1; y1 = y_int - (sine * _right) + (sine * _xoffset) - (csine * _top) + (csine * _yoffset);
    var x2; x2 = x_int + (csine * _right) + (csine * _xoffset) + (sine * _bottom) + (sine * _yoffset);
    var y2; y2 = y_int + (sine * _left) - (sine * _xoffset) + (csine * _bottom) + (csine * _yoffset);

    draw_rectangle_color(x1, y1, x2, y2, _color, _color, _color, _color, true);
}