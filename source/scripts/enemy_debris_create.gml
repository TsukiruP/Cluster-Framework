/// enemy_debris_create()
/// @desc Creates enemy debris.
/// @returns {void}

for ({var i; i = 0}; i < irandom(sprite_get_number(spr_enemy_debris)); i += 1)
{
    var debris_inst; debris_inst = instance_create(x, y, obj_enemy_debris);
    var debris_speed; debris_speed = random_range(2, 4);
    var debris_angle; debris_angle = random_range(ANGLE_UP - 45, ANGLE_UP + 45);

    with (debris_inst)
    {
        image_index = irandom(sprite_get_number(spr_enemy_debris));
        image_xscale = sign(other.image_xscale);
        image_yscale = sign(other.image_yscale);
        x_speed = dcos(debris_angle) * debris_speed;
        y_speed = -dsin(debris_angle) * debris_speed;
    }
}
