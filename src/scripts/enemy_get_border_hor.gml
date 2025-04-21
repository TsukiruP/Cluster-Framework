/// enemy_get_border_hor()
/// @desc Snaps the enemies to their horizontal borders and returns whether they should turn.
/// @returns {bool}

if (bbox_left < xstart - border_left) x = xstart - border_left + (x - bbox_left);
if (bbox_right > xstart + border_right) x = xstart + border_right - (bbox_right - x);

return ((bbox_left <= xstart - border_left && image_xscale != 1) || (bbox_right >= xstart + border_right && image_xscale != -1))
