/// player_reaction_blockade(obj, hitbox, side)
/* Break it with your face. */

var reaction_id, hitbox, side;

reaction_id = argument0;
hitbox = argument1;
side = argument2;

if (hitbox & HIT_ATTACK)
{
    if (((side == ANGLE_LEFT || side == ANGLE_RIGHT) && reaction_id.orientation == ORIEN_VERTICAL) ||
        ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_id.orientation == ORIEN_HORIZONTAL && sign(y_speed) == dsin(side)))
    {
        if (y_speed < 0 && side == ANGLE_DOWN) mask_rotation = angle_wrap(mask_rotation + 180);
        if (side == ANGLE_UP || side == ANGLE_DOWN) player_set_ground(reaction_id);

        player_wall_eject(reaction_id);
        player_reset_air();
        player_set_state(player_state_jump, false);
        player_set_animation("spin_flight", 0);

        jump_uncurl = UNCURL_BLOCKADE;
        x_speed = -2 * esign(x_speed, -dcos(side));
        y_speed = -2 * esign(y_speed, 1);

        reaction_id.vitality -= 1;

        if (reaction_id.vitality == 0)
        {
            with (reaction_id)
            {
                var i;

                for (i = 0; i < 6; i += 1)
                {
                    var debris_id;

                    debris_id = effect_create(x, y, sequence_blockade_debris);
                    debris_id.x_speed = 4;
                    debris_id.y_speed = 4;
                    debris_id.angle = ANGLE_DOWN + irandom_range(-45, 45);
                }

                instance_destroy();
            }
        }
    }
}
