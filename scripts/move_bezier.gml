/// move_bezier(lerp, x1, y1, x2, y2, x3, y3, x4, y4)
/// @desc https://forum.gamemaker.io/index.php?threads/a-free-simple-quadratic-bezier-curve-script-in-gml.42161/ This was easily the worst day of March.
/// @param {number} lerp
/// @param {number} x1
/// @param {number} y1
/// @param {number} x2
/// @param {number} y2
/// @param {number} x3
/// @param {number} y3
/// @param {number} x4
/// @param {number} y4
/// @returns {void}

var _lerp; _lerp = argument0;
var _x1; _x1 = argument1;
var _y1; _y1 = argument2;
var _x2; _x2 = argument3;
var _y2; _y2 = argument4;
var _x3; _x3 = argument5;
var _y3; _y3 = argument6;
var _x4; _x4 = argument7;
var _y4; _y4 = argument8;

var _lerp2; _lerp2 = sqr(_lerp);
var _lerp3; _lerp3 = _lerp2 * _lerp;

var _invert; _invert = 1 - _lerp;
var _invert2; _invert2 = sqr(_invert);
var _invert3; _invert3 = _invert2 * _invert;

// First term:
var px; px = _invert3 * _x1;
var py; py = _invert3 * _y1;

// Second term:
px += 3 * _invert2 * _lerp * _x2;
py += 3 * _invert2 * _lerp * _y2;

// Third term:
px += 3 * _invert * _lerp2 * _x3;
py += 3 * _invert * _lerp2 * _y3

// Fourth term:
px += _lerp3 * _x4;
py += _lerp3 * _y4;

// Set position:
x = px;
y = py;