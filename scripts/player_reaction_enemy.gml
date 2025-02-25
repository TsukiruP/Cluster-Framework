/// player_reaction_enemy(obj, hitbox)
/// @desc Everybody wanna be my enemy...
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (((_hitbox & HIT_COLLISION) && status_invin == INVIN_BUFF) || (_hitbox & HIT_ATTACK))
{
    if (_obj.class == ENE_BASIC)
    {
        if (y > _obj.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }
        else if (y < _obj.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    if (_obj.class == ENE_SUPER && _obj.invin_alarm == 0)
    {
        x_speed *= -0.5;
        y_speed *= -0.5;

        _obj.vitality -= 1;
        _obj.invin_alarm = 32;
    }

    if (_obj.class == ENE_BASIC || (_obj.class == ENE_SUPER && (_obj.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        sonic_routine_homing();
        stage_add_score(100 + (400 * _obj.class));

        with (_obj)
        {
            enemy_destroy();
            instance_destroy();
        }
    }
}
else if ((_hitbox & HIT_HURT) && (_obj.attackbox_element == ELEM_NONE || (_obj.attackbox_element > ELEM_NONE && status_shield != _obj.attackbox_element + SHIELD_BUBBLE))) player_set_damage(_obj);
