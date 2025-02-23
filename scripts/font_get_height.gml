/// font_get_height(font)
/// @desc Returns the height of the font.
/// @param {font} font
/// @returns {int}

var _font; _font = argument0;

draw_set_font(_font);
return string_height("Test");