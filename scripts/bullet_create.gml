/// bullet_create(x, y, sequence, xspeed, yspeed, [gravity])
/* Returns a bullet instance. */

var bullet;

bullet = instance_create(argument0, argument1, par_bullet);

with (bullet)
{
    sequence_set(argument2);
    x_speed = argument3;
    y_speed = argument4;
    if (argument_count > 5) gravity_force = argument[5];
}

return bullet;
