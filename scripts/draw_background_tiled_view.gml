/// draw_background_tiled_view(background, xoffset, yoffset, xscale, yscale, hrepeats, vrepeats)
/// @desc Draws a background tiled that sitcks to the current view.
/// @param {number} xoffset
/// @param {number} yoffset
/// @param {number} xscale
/// @param {number} yscale
/// @param {number} hrepeats
/// @param {number} vrepeats
/// @returns {void}

var _background; _background = argument0;
var _xoffset; _xoffset = argument1;
var _yoffset; _yoffset = argument2;
var _xscale; _xscale = argument3;
var _yscale; _yscale = argument4;
var _hrepeats; _hrepeats = argument5;
var _vrepeats; _vrepeats = argument6;

draw_background_tiled_extra(_background, view_xview[view_current] + _xoffset, view_yview[view_current] + _yoffset, _xscale, _yscale, 0, c_white, 1, _hrepeats, _vrepeats);