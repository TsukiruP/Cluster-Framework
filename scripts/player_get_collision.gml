/// player_get_collision(obj, [phase])
/* Returns a set of bit flags detailing the player's collision with the object.
This is done by using GM82's rectangle_in_rectangle, and rotating each according to their gravity_direction.
This occurs in two phases, first checking against the object's hurtbox, and then the object's hitbox.
If either the player or object's hitbox/hurtbox is empty (all 0), then these checks aren't done.
The first phase checks the object's hurtbox against the player's hitbox and radii, and the second checks the object's hitbox against the player's hurtbox and radii. */

var inst, phase, collision;
var ax_int, ay_int, aleft, atop, aright, abottom, aoff_x, aoff_y, adir_x, adir_y, arot, ax1, ay1, ax2, ay2;
var bx_int, by_int, bleft, btop, bright, bbottom, boff_x, boff_y, bdir_x, bdir_y, brot, bx1, by1, bx2, by2;

inst = argument0;
phase = 0;
collision = 0;

// Hitbox flag:
if (argument_count >= 2)
{
    phase = argument[1];
}

if (inst != noone)
{
    // Initialize player:
    ax_int = floor(x);
    ay_int = floor(y);

    aleft = hitbox_left;
    atop = hitbox_top;
    aright = hitbox_right;
    abottom = hitbox_bottom;

    adir_x = image_xscale;
    adir_y = image_yscale;

    aoff_x = hitbox_offset_x * adir_x;
    aoff_y = hitbox_offset_y * adir_y;

    arot = mask_rotation;
    asine = dsin(arot);
    acsine = dcos(arot);

    // Initialize object:
    bx_int = floor(inst.x);
    by_int = floor(inst.y);

    bleft = inst.hurtbox_left;
    btop = inst.hurtbox_top;
    bright = inst.hurtbox_right;
    bbottom = inst.hurtbox_bottom;

    bdir_x = inst.image_xscale;
    bdir_y = inst.image_yscale;

    boff_x = inst.hurtbox_offset_x * bdir_x;
    boff_y = inst.hurtbox_offset_y * bdir_y;

    brot = gravity_angle(inst);
    bsine = dsin(brot);
    bcsine = dcos(brot);

    if (phase == 1)
    {
        // Swap to player hurtbox values:
        aleft = hurtbox_left;
        atop = hurtbox_top;
        aright = hurtbox_right;
        abottom = hurtbox_bottom;

        aoff_x = hurtbox_offset_x * image_xscale;
        aoff_y = hurtbox_offset_y;

        // Swap to object hitbox values:
        bleft = inst.hitbox_left;
        btop = inst.hitbox_top;
        bright = inst.hitbox_right;
        bbottom = inst.hitbox_bottom;

        boff_x = inst.hitbox_offset_x * inst.image_xscale;
        boff_y = inst.hitbox_offset_y;
    }

    // Check object collision:
    if !(bleft == 0 && btop == 0 && bright == 0 && bbottom == 0)
    {
        // Flip object direction:
        if (bdir_x == -1)
        {
            var temp;

            temp = bleft;
            bleft = bright;
            bright = temp;
        }

        if (bdir_y == -1)
        {
            var temp;

            temp = btop;
            btop = bbottom;
            bbottom = temp;
        }

        // Flip top and bottom:
        if (brot div 90 >= 2)
        {
            bleft *= -1;
            btop *= -1;
            bright *= -1;
            bbottom *= -1;
        }

        // Rotate object:
        bx1 = bx_int - (bcsine * bleft) + (bcsine * boff_x) - (bsine * btop) + (bsine * boff_y);
        by1 = by_int - (bcsine * btop) + (bcsine * boff_y) - (bsine * bright) - (bsine * boff_x);
        bx2 = bx_int + (bcsine * bright) + (bcsine * boff_x) + (bsine * bbottom) + (bsine * boff_y);
        by2 = by_int + (bcsine * bbottom) + (bcsine * boff_y) + (bsine * bleft) - (bsine * boff_x);

        if !(aleft == 0 && atop == 0 && aright == 0 && abottom == 0)
        {
            // Flip player direction:
            if (adir_x == -1)
            {
                var temp;

                temp = aleft;
                aleft = aright
                aright = temp;
            }

            if (adir_y == -1)
            {
                var temp;

                temp = atop;
                atop = abottom;
                abottom = temp;
            }

            // Flip top and bottom:
            if (arot div 90 >= 2)
            {
                aleft *= -1;
                atop *= -1;
                aright *= -1;
                abottom *= -1;
            }

            // Rotate player:
            ax1 = ax_int - (acsine * aleft) + (acsine * aoff_x) - (asine * atop) + (asine * aoff_y);
            ay1 = ay_int - (acsine * atop) + (acsine * aoff_y) - (asine * aright) - (asine * aoff_x);
            ax2 = ax_int + (acsine * aright) + (acsine * aoff_x) + (asine * abottom) + (asine * aoff_y);
            ay2 = ay_int + (acsine * abottom) + (acsine * aoff_y) + (asine * aleft) - (asine * aoff_x);

            // Special collision:
            if (rectangle_in_rectangle(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2))
            {
                if (phase == 1)
                {
                    collision |= COLL_HIT;
                }
                else
                {
                    collision |= COLL_HURT;
                }
            }
        }

        // Radius collision:
        var upright;

        upright = (arot mod 180 == 0);

        if ((upright == true && rectangle_in_rectangle(ax_int - x_radius, ay_int - y_radius, ax_int + x_radius, ay_int + y_radius, bx1, by1, bx2, by2)) ||
            (upright == false && rectangle_in_rectangle(ax_int - y_radius, ay_int - x_radius, ax_int + y_radius, ay_int + x_radius, bx1, by1, bx2, by2)))
        {

            // We've hit the object's hitbox:
            if (phase == 1)
            {
                collision |= COLL_HIT_RADIUS;
            }

            // We've hit the object's hurtbox:
            else
            {
                collision |= COLL_HURT_RADIUS;
            }

        }
    }
}

// Failure OR move to next phase:
if (phase == 0)
{
    return collision | player_get_collision(argument0, 1);
}
else
{
    return collision;
}
