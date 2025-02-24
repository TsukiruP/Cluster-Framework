/// player_get_hitbox(inst, [phase])
/// @desc Returns a set of bit flags about the player and object's hitboxes.
/// @param {object} inst
/// @param {int} [phase]
/// @returns {int}

var _inst; _inst = argument[0];
var _phase; if (argument_count > 1) _phase = argument[1]; else _phase = 0;

var hitbox; hitbox = 0;

if (instance_exists(_inst))
{
    if (!_inst.collision) return 0;

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
    var arot; arot = mask_rotation;
    var asine; asine = dsin(arot);
    var acsine; acsine = dcos(arot);

    // Initialize object:
    var bx_int; bx_int = floor(_inst.x);
    var by_int; by_int = floor(_inst.y);
    var bleft; bleft = _inst.hurtbox_left;
    var btop; btop = _inst.hurtbox_top;
    var bright; bright = _inst.hurtbox_right;
    var bbottom; bbottom = _inst.hurtbox_bottom;
    var bdir_x; bdir_x = sign(_inst.image_xscale);
    var bdir_y; bdir_y = sign(_inst.image_yscale);
    var boff_x; boff_x = _inst.hurtbox_offset_x * bdir_x;
    var boff_y; boff_y = _inst.hurtbox_offset_y * bdir_y;
    var brot; brot = _inst.gravity_direction;
    var bsine; bsine = dsin(brot);
    var bcsine; bcsine = dcos(brot);

    // Swap to object's attackbox:
    if (_phase == 1 || _phase == 3)
    {
        bleft = _inst.attackbox_left;
        btop = _inst.attackbox_top;
        bright = _inst.attackbox_right;
        bbottom = _inst.attackbox_bottom;
        boff_x = _inst.attackbox_offset_x * bdir_x;
        boff_y = _inst.attackbox_offset_y * bdir_y;
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

            if (rectangle_in_rectangle(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)) hitbox |= pick(_phase, HIT_COLLISION, HIT_HURT, HIT_ATTACK, HIT_CLASH);
        }
    }
}

if (_phase == 0) return (hitbox | player_get_hitbox(argument0, 1) | player_get_hitbox(argument0, 2) | player_get_hitbox(argument0, 3));
return hitbox;
