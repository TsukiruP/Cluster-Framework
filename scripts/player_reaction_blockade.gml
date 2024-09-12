/// player_reaction_blockade(obj, collision, side)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;
side            = argument2;

// Activate hint:
if (collision & COLL_HURT)
{
    if (((side == ANGLE_LEFT || side == ANGLE_RIGHT) && reaction_handle.blockade_orientation == ORIEN_VERTICAL) ||
        ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_handle.blockade_orientation == ORIEN_HORIZONTAL && sign(y_speed) == dsin(side)))
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
        player_set_state(player_state_jump, false);
        player_reset_air();
        player_set_animation("spin", 0);
        jump_uncurl = 2;

        x_speed = -2 * esign(x_speed, dcos(side));
        y_speed = -2 * esign(y_speed, 1);

        // Crack:
        reaction_handle.blockade_health -= 1;

        // Destroy:
        if (reaction_handle.blockade_health == 0)
        {
            with (reaction_handle)
            {
                // Debris:
                for (i = 0; i < 6; i += 1)
                {
                    var debris_handle;

                    debris_handle = instance_create(floor(x), floor(y), eff_basic);
                    debris_handle.e_speed = 4;
                    debris_handle.angle = ANGLE_DOWN + irandom_range(-45, 45);

                    with (debris_handle)
                    {
                        ctl_initialize(ctl_blockade_debris);
                    }
                }

                // Destroy:
                instance_destroy();
            }
        }
    }
}
