/// enemy_get_border_hor()
/// @desc Snaps the enemies to their horizontal borders and returns whether they should turn.
/// @returns {bool}

if (x < xstart - border_left) x = xstart - border_left;
if (x > xstart + border_right) x = xstart + border_right;

return ((x <= xstart - border_left && image_xscale != 1) || (x >= xstart + border_right && image_xscale != -1))
