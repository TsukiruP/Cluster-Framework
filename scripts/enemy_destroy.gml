/// enemy_destroy()
/// @desc Enemy variant of instance_destroy().
/// @returns {void}

audio_play_sfx("snd_destroy", true);

if (!position_meeting(x, y, obj_water_mask))
{
    var explosion_x; explosion_x = x + explosion_x_offset * image_xscale;
    var explosion_y; explosion_y = y + explosion_y_offset * image_yscale;

    effect_create(explosion_x, explosion_y, seq_explosion_enemy, -depth);
}
else effect_create(x, y, seq_explosion_water, -depth);

for ({var i; i = 0}; i < irandom(sprite_get_number(spr_enemy_debris)); i += 1)
{
    var debris_inst; debris_inst = instance_create(x, y, obj_enemy_debris);
    var debris_speed; debris_speed = random_range(2, 4);
    var debris_angle; debris_angle = random_range(ANGLE_UP - 45, ANGLE_UP + 45);

    debris_inst.image_index = irandom(sprite_get_number(spr_enemy_debris));
    debris_inst.x_speed = dcos(debris_angle) * debris_speed;
    debris_inst.y_speed = -dsin(debris_angle) * debris_speed;
}

instance_destroy();
