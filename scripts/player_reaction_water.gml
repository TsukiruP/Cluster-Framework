/// player_reaction_water(obj, hitbox)
/* Sets whether the player is underwater. */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    var x1, y1, x2, y2, water_current, water_previous;

    x1 = reaction_handle.x;
    y1 = reaction_handle.y;
    x2 = x1 + reaction_handle.sprite_width;
    y2 = y1 + reaction_handle.sprite_height;
    water_current = point_in_rectangle(x, y, x1, y1, x2, y2);
    water_previous = point_in_rectangle(xprevious, yprevious, x1, y1, x2, y2);

    if (!underwater && water_current)
    {
        x_speed *= 0.50;
        y_speed *= 0.25;
        underwater = true;
        air_remaining = 30;
        air_alarm = 60;
        player_set_physics();

        if (!water_previous)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(x, reaction_handle.y, pick(y_speed >= 2.50, sequence_splash_0, sequence_splash_1), depth);
        }
    }
    else if (y < room_height && underwater && !water_current)
    {
        y_speed = max(y_speed * 2, -16);
        underwater = false;
        air_remaining = 30;
        air_alarm = 60;
        player_set_physics();

        if (water_previous)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(x, reaction_handle.y, pick(y_speed <= -6, sequence_splash_0, sequence_splash_1), depth);
        }
    }
}
