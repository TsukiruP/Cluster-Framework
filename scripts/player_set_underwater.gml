/// player_set_underwater()
/* Sets whether the player is underwater. */

var water_current, water_previous;

water_current = collision_point(x, y, obj_water_mask, false, false);
water_previous = collision_point(xprevious, yprevious, obj_water_mask, false, false);

if (physics_id != PHYS_WATER && water_current != noone)
{
    physics_id = PHYS_WATER;
    x_speed *= 0.50;
    y_speed *= 0.25;
    air_remaining = 30;
    air_alarm = 60;
    player_set_physics();

    if (water_previous == noone)
    {
        audio_play_sfx("snd_splash", true);
        effect_create(pick(y_speed >= 2.50, sequence_splash_0, sequence_splash_1), x, water_current.y, depth);
    }
}
else if (y < room_height && physics_id == PHYS_WATER && water_current == noone)
{
    physics_id = PHYS_DEFAULT;
    y_speed = max(y_speed * 2, -16);
    air_remaining = 30;
    air_alarm = 60;
    player_set_physics();

    if (water_previous != noone)
    {
        audio_play_sfx("snd_splash", true);
        effect_create(pick(y_speed <= -6, sequence_splash_0, sequence_splash_1), x, water_previous.y, depth);
    }
}
