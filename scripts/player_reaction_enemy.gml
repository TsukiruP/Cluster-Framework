/// player_reaction_enemy(inst, hitbox)
/// @desc Everybody wanna be my enemy...
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (((_hitbox & HIT_COLLISION) && status_invin == INVIN_BUFF) || (_hitbox & HIT_ATTACK))
{
    if (_inst.class == ENE_BASIC)
    {
        if (y > _inst.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }
        else if (y < _inst.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    if (_inst.class == ENE_SUPER && _inst.invin_alarm == 0)
    {
        x_speed *= -0.5;
        y_speed *= -0.5;

        _inst.vitality -= 1;
        _inst.invin_alarm = 32;
    }

    if (_inst.class == ENE_BASIC || (_inst.class == ENE_SUPER && (_inst.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        sonic_routine_homing();
        stage_add_score(100 + (400 * _inst.class));
        audio_play_sfx("snd_destroy", true);

        with (_inst)
        {
            effect_create(x, y, sequence_explosion_enemy, -depth);
            instance_destroy();
        }
    }
}
else if ((_hitbox & HIT_HURT) && (_inst.attackbox_element == ELEM_NONE || (_inst.attackbox_element > ELEM_NONE && status_shield != _inst.attackbox_element + SHIELD_BUBBLE))) player_set_damage(_inst);