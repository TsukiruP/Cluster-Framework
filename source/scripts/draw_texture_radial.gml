/// draw_texture_radial(tex, val, x1, y1, x2, y2, col, alpha)
/// @desc https://yal.cc/gamemaker-radial-progress/
/// @param {texture} tex
/// @param {number} val
/// @param {number} x1
/// @param {number} y1
/// @param {number} x2
/// @param {number} y2
/// @param {color} col
/// @param {number} alpha
/// @returns {void}

var _tex; _tex = argument0;
var _val; _val = argument1;
var _x1; _x1 = argument2;
var _y1; _y1 = argument3;
var _x2; _x2 = argument4;
var _y2; _y2 = argument5;
var _col; _col = argument6;
var _alpha; _alpha = argument7;

_x1 -= 0.5;
_y1 -= 0.5;
_x2 -= 0.5;
_y2 -= 0.5;

if (_val <= 0) exit;

if (_val >= 1)
{
    draw_primitive_begin_texture(pr_trianglelist, _tex);
    draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);

    repeat (2)
    {
        draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
        draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
    }

    draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
    draw_primitive_end();
    exit;
}

// middle point:
var mx; mx = (_x1 + _x2) / 2;
var my; my = (_y1 + _y2) / 2;

draw_primitive_begin_texture(pr_trianglelist, _tex);
draw_vertex_texture_color(mx, my, 0.5, 0.5, _col, _alpha);
draw_vertex_texture_color(mx, _y1, 0.5, 0, _col, _alpha);

// corners, each of these finishes the last triangle and starts a new one:
if (_val >= 1/8)
{
draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
    draw_vertex_texture_color(mx, my, 0.5, 0.5, _col, _alpha);
    draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
}

if (_val >= 3/8)
{
    draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
    draw_vertex_texture_color(mx, my, 0.5, 0.5, _col, _alpha);
    draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
}

if (_val >= 5/8)
{
    draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
    draw_vertex_texture_color(mx, my, 0.5, 0.5, _col, _alpha);
    draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
}

if (_val >= 7/8)
{
    draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);
    draw_vertex_texture_color(mx, my, 0.5, 0.5, _col, _alpha);
    draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);
}

// final vertex (towards value-angle):
var dir; dir = pi * (_val * 2 - 0.5);
var dx; dx = cos(dir);
var dy; dy = sin(dir);

// normalize:
var dmax; dmax = max(abs(dx), abs(dy));

if (dmax < 1)
{
    dx /= dmax;
    dy /= dmax;
}

dx = (1 + dx) / 2;
dy = (1 + dy) / 2;
draw_vertex_texture_color(
    lerp(_x1, _x2, dx) - 0.5,
    lerp(_y1, _y2, dy) - 0.5,
    dx, dy, _col, _alpha
);
draw_primitive_end();
