/// player_reaction_blockade(obj, collision, side)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;
side = argument2;

// Activate hint:
if (collision & COLL_HURT)
{
    if (((side == ANGLE_LEFT || side == ANGLE_RIGHT) && reaction_handle.orientation == ORIEN_VERTICAL) ||
        ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_handle.orientation == ORIEN_HORIZONTAL && sign(y_speed) == dsin(side)))
    {
        // Eject:
        if (y_speed < 0 && side == ANGLE_DOWN)
        {
            mask_rotation = angle_wrap(mask_rotation + 180);
        }

        if (side == ANGLE_UP || side == ANGLE_DOWN)
        {
            player_set_ground(reaction_handle);
        }

        // Rebound:
        player_wall_eject(reaction_handle);
        player_reset_air();
        player_set_state(player_state_jump, false);
        player_set_animation("spin", 0);

        jump_uncurl = UNCURL_BLOCKADE;

        x_speed = -2 * esign(x_speed, -dcos(side));
        y_speed = -2 * esign(y_speed, 1);

        // Crack:
        reaction_handle.vitality -= 1;

        // Destroy:
        if (reaction_handle.vitality == 0)
        {
            with (reaction_handle)
            {
                var i;

                // Debris:
                for (i = 0; i < 6; i += 1)
                {
                    var debris_handle;

                    debris_handle = effect_create(ctl_blockade_debris, x, y);
                    debris_handle.x_speed = 4;
                    debris_handle.y_speed = 4;
                    debris_handle.angle = ANGLE_DOWN + irandom_range(-45, 45);
                }

                // Destroy:
                instance_destroy();
            }
        }
    }
}
