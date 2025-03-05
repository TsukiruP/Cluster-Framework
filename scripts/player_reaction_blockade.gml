/// player_reaction_blockade(obj, hitbox, side)
/// @desc Break it with your face.
/// @param {object} obj
/// @param {int} hitbox
/// @param {number} side
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;
var _side; _side = argument2;

if (_hitbox & HIT_ATTACK)
{
    if (((_side == ANGLE_LEFT || _side == ANGLE_RIGHT) && _obj.variant == 0) ||
        ((_side == ANGLE_UP || _side == ANGLE_DOWN) && _obj.variant == 1 && sign(y_speed) == dsin(_side)))
    {
        if (y_speed < 0 && _side == ANGLE_DOWN) mask_direction = (mask_direction + 180) mod 360;
        if (_side == ANGLE_UP || _side == ANGLE_DOWN) player_set_ground(_obj);

        player_wall_eject(_obj);
        player_reset_air();
        player_set_state(player_state_jump, false);
        player_set_animation("spin_flight", 0);

        jump_uncurl = UNCURL_BLOCKADE;
        x_speed = -2 * esign(x_speed, -dcos(_side));
        y_speed = -2 * esign(y_speed, 1);

        _obj.vitality -= 1;

        if (_obj.vitality == 0)
        {
            with (_obj)
            {
                for ({var i; i = 0}; i < 6; i += 1)
                {
                    var debris_inst; debris_inst = effect_create(x, y, seq_blockade_debris);

                    debris_inst.x_speed = dcos(ANGLE_DOWN + irandom_range(-45, 45)) * 4;
                    debris_inst.y_speed = -dsin(ANGLE_DOWN + irandom_range(-45, 45)) * 4;
                }

                instance_destroy();
            }
        }
    }
}
