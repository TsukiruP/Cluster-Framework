/// draw_sprite_radial(sprite, subimg, val, x, y, xscale, yscale, col, alpha, [uncrop)]
/// @desc https://yal.cc/gamemaker-radial-progress/
/// @param {sprite} sprite
/// @param {number} suubimg
/// @param {number} val
/// @param {number} x
/// @param {number} y
/// @param {number} xscale
/// @param {number} yscale
/// @param {color} col
/// @param {number} alpha
/// @param {bool} [uncrop]
/// @returns {void}

var _sprite; _sprite = argument[0];
var _subimg; _subimg = argument[1];
var _val; _val = argument[2];
var _x; _x = argument[3];
var _y; _y = argument[4];
var _xscale; _xscale = argument[5];
var _yscale; _yscale = argument[6];
var _col; _col = argument[7];
var _alpha; _alpha = argument[8];
var _uncrop; if (argument_count > 9) _uncrop = argument[9]; else _uncrop = true;

var x1, y1, x2, y2;

if (_uncrop)
{
    var _ox; _ox = sprite_get_xoffset(_sprite);
    var _oy; _oy = sprite_get_yoffset(_sprite);

    x1 = _x + _xscale * (sprite_get_bbox_left(_sprite) - _ox);
    x2 = _x + _xscale * (sprite_get_bbox_right(_sprite) + 1 - _ox);
    y1 = _y + _yscale * (sprite_get_bbox_top(_sprite) - _oy);
    y2 = _y + _yscale * (sprite_get_bbox_bottom(_sprite) + 1 - _oy);
}
else
{
    x1 =  _x - _xscale * sprite_get_xoffset(_sprite);
    x2 = x1 + _xscale * sprite_get_width(_sprite);
    y1 = _y -  _yscale * sprite_get_yoffset(_sprite);
    y2 = y1 + _yscale * sprite_get_height(_sprite);
}

draw_texture_radial(sprite_get_texture(_sprite, _subimg), _val, x1, y1, x2, y2, _col, _alpha);
