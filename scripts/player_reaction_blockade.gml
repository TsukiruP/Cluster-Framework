/// player_reaction_blockade(obj, collision, side)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;
side            = argument2;

// Activate hint:
if (collision & COLL_HURT) {
    if (((side == ANGLE_LEFT || side == ANGLE_RIGHT) && reaction_handle.blockade_orientation == ORIEN_VERTICAL) || ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_handle.blockade_orientation == ORIEN_HORIZONTAL)) {
        // Rebound:
        player_set_state(player_state_jump, false);
        player_set_animation("spin");
        x_speed = -2 * sign(x_speed);
        y_speed = -2;

        // Crack:
        reaction_handle.blockade_health -=  1;

        // Destroy:
        if (reaction_handle.blockade_health == 0) {
            with (reaction_handle) {
                instance_destroy();
            }
        }
    }
}
