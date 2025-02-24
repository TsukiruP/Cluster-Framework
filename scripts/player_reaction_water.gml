/// player_reaction_water(inst, hitbox)
/// @desc
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION)
{
    var x1; x1 = _inst.x;
    var y1; y1 = _inst.y;
    var x2; x2 = x1 + _inst.sprite_width;
    var y2; y2 = y1 + _inst.sprite_height;
    
    var water_current; water_current = point_in_rectangle(x, y, x1, y1, x2, y2);
    var water_previous; water_previous = point_in_rectangle(xprevious, yprevious, x1, y1, x2, y2);

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
            effect_create(x, _inst.y, pick(y_speed >= 2.50, sequence_splash_0, sequence_splash_1), depth);
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
            effect_create(x, _inst.y, pick(y_speed <= -6, sequence_splash_0, sequence_splash_1), depth);
        }
    }
}