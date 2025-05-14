/// player_can_launch(obj)
/// @desc Checks if the player can launch off the given solid.
/// @param {object} obj
/// @returns {bool}

var _obj; _obj = argument0;

// Abort if the solid can't launch or we're moving too slow:
if (_obj.shape == SHP_CUSTOM || !_obj.can_launch || abs(x_speed) < slide_threshold) return false;

// Abort if still within the solid's bounds:
if (mask_direction mod 180 != 0)
{
    var yscale; yscale = sign(_obj.image_yscale);
    
    if (yscale == -1 && y - x_radius >= _obj.bbox_top) return false;
    if (yscale == 1 && y + x_radius <= _obj.bbox_bottom + 1) return false;
}
else
{
    var xscale; xscale = sign(_obj.image_xscale);
    
    if (xscale == -1 && x - x_radius >= _obj.bbox_left) return false;
    if (xscale == 1 && x + x_radius <= _obj.bbox_right + 1) return false;
}

return true;
