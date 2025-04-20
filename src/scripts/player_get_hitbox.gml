/// player_get_hitbox(obj, [phase])
/// @desc Returns a set of bit flags about the player and object's hitboxes.
/// @param {object} obj
/// @param {int} [phase]
/// @returns {int}

var _obj; _obj = argument[0];
var _phase; if (argument_count > 1) _phase = argument[1]; else _phase = 0;

var hitbox; hitbox = 0;

if (instance_exists(_obj))
{
    if (!_obj.collision) return 0;

    // Initialize player:
    var ax_int; ax_int = floor(x);
    var ay_int; ay_int = floor(y);
    var aleft; aleft = hurtbox_left;
    var atop; atop = hurtbox_top;
    var aright; aright = hurtbox_right;
    var abottom; abottom = hurtbox_bottom;
    var adir_x; adir_x = sign(image_xscale);
    var adir_y; adir_y = sign(image_yscale);
    var aoff_x; aoff_x = hurtbox_offset_x * adir_x;
    var aoff_y; aoff_y = hurtbox_offset_y * adir_y;
    var arot; arot = mask_direction;
    var asine; asine = dsin(arot);
    var acsine; acsine = dcos(arot);

    // Initialize object:
    var bx_int; bx_int = floor(_obj.x);
    var by_int; by_int = floor(_obj.y);
    var bleft; bleft = _obj.hurtbox_left;
    var btop; btop = _obj.hurtbox_top;
    var bright; bright = _obj.hurtbox_right;
    var bbottom; bbottom = _obj.hurtbox_bottom;
    var bdir_x; bdir_x = sign(_obj.image_xscale);
    var bdir_y; bdir_y = sign(_obj.image_yscale);
    var boff_x; boff_x = _obj.hurtbox_offset_x * bdir_x;
    var boff_y; boff_y = _obj.hurtbox_offset_y * bdir_y;
    var brot; brot = _obj.gravity_direction;
    var bsine; bsine = dsin(brot);
    var bcsine; bcsine = dcos(brot);

    // Swap to object's attackbox:
    if (_phase == 1 || _phase == 3)
    {
        bleft = _obj.attackbox_left;
        btop = _obj.attackbox_top;
        bright = _obj.attackbox_right;
        bbottom = _obj.attackbox_bottom;
        boff_x = _obj.attackbox_offset_x * bdir_x;
        boff_y = _obj.attackbox_offset_y * bdir_y;
    }

    // Swap to player's attackbox:
    if (_phase == 2 || _phase == 3)
    {
        aleft = attackbox_left;
        atop = attackbox_top;
        aright = attackbox_right;
        abottom = attackbox_bottom;
        aoff_x = attackbox_offset_x * adir_x;
        aoff_y = attackbox_offset_y * adir_y;
    }
    else if (_phase == 4)
    {
        aleft = x_radius;
        atop = y_radius;
        aright= x_radius;
        abottom = y_radius;
        aoff_x = 0;
        aoff_y = 0;
    }

    // Check object collision:
    if !(bleft == 0 && btop == 0 && bright == 0 && bbottom == 0)
    {
        // Flip:
        if (bdir_x == -1)
        {
            var temp; temp = bleft;

            bleft = bright;
            bright = temp;
        }

        if (bdir_y == -1)
        {
            var temp; temp = btop;

            btop = bbottom;
            bbottom = temp;
        }

        var bx1; bx1 = bx_int - (bcsine * bleft) + (bcsine * boff_x) - (bsine * btop) + (bsine * boff_y);
        var by1; by1 = by_int + (bsine * bright) + (bsine * boff_x) - (bcsine * btop) + (bcsine * boff_y);
        var bx2; bx2 = bx_int + (bcsine * bright) + (bcsine * boff_x) + (bsine * bbottom) + (bsine * boff_y);
        var by2; by2 = by_int - (bsine * bleft) - (bsine * boff_x) + (bcsine * bbottom) + (bcsine * boff_y);

        if !(aleft == 0 && atop == 0 && aright == 0 && abottom == 0)
        {
            // Flip:
            if (adir_x == -1)
            {
                var temp; temp = aleft;

                aleft = aright
                aright = temp;
            }

            if (adir_y == -1)
            {
                var temp; temp = atop;

                atop = abottom;
                abottom = temp;
            }

            var ax1; ax1 = ax_int - (acsine * aleft) + (acsine * aoff_x) - (asine * atop) + (asine * aoff_y);
            var ay1; ay1 = ay_int - (asine * aright) + (asine * aoff_x) - (acsine * atop) + (acsine * aoff_y);
            var ax2; ax2 = ax_int + (acsine * aright) + (acsine * aoff_x) + (asine * abottom) + (asine * aoff_y);
            var ay2; ay2 = ay_int + (asine * aleft) - (asine * aoff_x) + (acsine * abottom) + (acsine * aoff_y);

            if (rectangle_in_rectangle(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)) hitbox |= pick(_phase, HIT_INTERACT, HIT_HURT, HIT_ATTACK, HIT_CLASH, HIT_RADII);
        }
    }
}

if (_phase == 0) return (hitbox | player_get_hitbox(argument0, 1) | player_get_hitbox(argument0, 2) | player_get_hitbox(argument0, 3) | player_get_hitbox(argument0, 4));
return hitbox;
