/// player_reaction_bullet(obj, hitbox)
/// @desc The elevation increases as the bullet is fired.
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (!_obj.reflect)
{
    if (((_hitbox & HIT_CLASH) && status_insta_alarm) || ((_hitbox & HIT_HURT) && status_shield >= SHIELD_BUBBLE))
    {
        with (_obj)
        {
            var bullet_angle; bullet_angle = point_direction(x, y, other.x, other.y);

            x_speed = dcos(bullet_angle) * -10;
            y_speed = -dsin(bullet_angle) * -10;
            reflect = true;
        }
    }
    else if ((_hitbox & HIT_HURT) && (_obj.attackbox_element == ELEM_NONE || (_obj.attackbox_element > ELEM_NONE && status_shield != _obj.attackbox_element + SHIELD_BUBBLE))) player_set_damage(_obj);
}
