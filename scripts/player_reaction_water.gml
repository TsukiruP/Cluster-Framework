/// player_reaction_water(obj, collision)
/* Sets whether the player is underwater. */


var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    var water_current, water_previous;

    water_current = collision_point(x, y, reaction_handle, false, false);
    water_previous = collision_point(xprevious, yprevious, reaction_handle, false, false);

    if (!underwater && water_current != noone)
    {
        x_speed *= 0.50;
        y_speed *= 0.25;
        underwater = true;
        air_remaining = 30;
        air_alarm = 60;
        player_set_physics();

        if (water_previous == noone)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(pick(y_speed >= 2.50, sequence_splash_0, sequence_splash_1), x, water_current.y, depth);
        }
    }
    else if (y < room_height && underwater && water_current == noone)
    {
        y_speed = max(y_speed * 2, -16);
        underwater = false;
        air_remaining = 30;
        air_alarm = 60;
        player_set_physics();

        if (water_previous != noone)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(pick(y_speed <= -6, sequence_splash_0, sequence_splash_1), x, water_previous.y, depth);
        }
    }
}
