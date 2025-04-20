/// enemy_destroy()
/// @desc Enemy variant of instance_destroy().
/// @returns {void}

if (!position_meeting(x, y, obj_water_mask))
{
    var explosion_x; explosion_x = x + explosion_x_offset * image_xscale;
    var explosion_y; explosion_y = y + explosion_y_offset * image_yscale;

    effect_create(explosion_x, explosion_y, seq_explosion_enemy, -depth);
}
else effect_create(x, y, seq_explosion_water, -depth);

enemy_debris_create();
audio_play_sfx("snd_destroy", true);
instance_destroy();
