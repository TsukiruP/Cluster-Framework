/// player_reaction_blockade(obj, collision, side)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;
side            = argument2;

// Activate hint:
if (collision & COLL_HURT) {
    if (((abs(angle_difference(side, ANGLE_LEFT)) <= 45 || abs(angle_difference(side, ANGLE_RIGHT)) <= 45) && reaction_handle.blockade_orientation == ORIEN_VERTICAL)) {
        // Rebound:
        player_set_state(player_state_jump, false);
        player_set_animation("spin");
        player_reset_air();
        x_speed = -2.10 * esign(x_speed, image_xscale);
        y_speed = -2.10;

        // Crack:
        reaction_handle.blockade_health -=  1;

        // Destroy:
        if (reaction_handle.blockade_health == 0) {
            with (reaction_handle) {
                // Debris:
                for (i = 0; i < 6; i += 1) {
                    var debris_handle;

                    debris_handle         = instance_create(floor(x), floor(y), eff_basic);
                    debris_handle.e_speed = 4;
                    debris_handle.angle   = ANGLE_DOWN + irandom_range(-45, 45);

                    with (debris_handle) {
                        ctl_initialize(ctl_blockade_debris);
                    }
                }

                instance_destroy();
            }
        }
    }
}

/*
 ||
        ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_handle.blockade_orientation == ORIEN_HORIZONTAL && sign(y_speed) == dsin(side))
