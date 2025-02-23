/// player_reaction_blockade(obj, hitbox, side)
/* Break it with your face. */

var reaction_inst, hitbox, side;

reaction_inst = argument0;
hitbox = argument1;
side = argument2;

if (hitbox & HIT_ATTACK)
{
    if (((side == ANGLE_LEFT || side == ANGLE_RIGHT) && reaction_inst.variant == 0) ||
        ((side == ANGLE_UP || side == ANGLE_DOWN) && reaction_inst.variant == 1 && sign(y_speed) == dsin(side)))
    {
        if (y_speed < 0 && side == ANGLE_DOWN) mask_rotation = angle_wrap(mask_rotation + 180);
        if (side == ANGLE_UP || side == ANGLE_DOWN) player_set_ground(reaction_inst);

        player_wall_eject(reaction_inst);
        player_reset_air();
        player_set_state(player_state_jump, false);
        player_set_animation("spin_flight", 0);

        jump_uncurl = UNCURL_BLOCKADE;
        x_speed = -2 * esign(x_speed, -dcos(side));
        y_speed = -2 * esign(y_speed, 1);

        reaction_inst.vitality -= 1;

        if (reaction_inst.vitality == 0)
        {
            with (reaction_inst)
            {
                var i;

                for (i = 0; i < 6; i += 1)
                {
                    var debris_inst;

                    debris_inst = effect_create(x, y, sequence_blockade_debris);
                    debris_inst.x_speed = 4 * dcos(ANGLE_DOWN + irandom_range(-45, 45));
                    debris_inst.y_speed = 4 * -dsin(ANGLE_DOWN + irandom_range(-45, 45));
                }

                instance_destroy();
            }
        }
    }
}
