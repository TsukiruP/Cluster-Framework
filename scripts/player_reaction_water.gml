/// player_reaction_water(obj, hitbox)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_MASK)
{
    var x1; x1 = _obj.x;
    var y1; y1 = _obj.y;
    var x2; x2 = x1 + _obj.sprite_width;
    var y2; y2 = y1 + _obj.sprite_height;

    var water_current; water_current = point_in_rectangle(x, y, x1, y1, x2, y2);
    var water_previous; water_previous = point_in_rectangle(xprevious, yprevious, x1, y1, x2, y2);

    if (!underwater && water_current)
    {
        x_speed *= 0.50;
        y_speed *= 0.25;
        underwater = true;
        player_set_physics();
        player_reset_breath();
        if (status_shield == SHIELD_FIRE || status_shield == SHIELD_LIGHTNING) status_shield = 0;

        if (!water_previous)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(x, _obj.y, pick(y_speed >= 2.50, seq_splash_1, seq_splash_2), depth);
        }
    }
    else if (y < room_height && underwater && !water_current)
    {
        y_speed = max(y_speed * 2, -16);
        underwater = false;
        player_set_physics();
        player_reset_breath();

        if (water_previous)
        {
            audio_play_sfx("snd_splash", true);
            effect_create(x, _obj.y, pick(y_speed <= -6, seq_splash_1, seq_splash_2), depth);
        }
    }
}
