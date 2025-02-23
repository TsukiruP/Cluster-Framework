/// player_reaction_enemy(obj, hitbox)
/* Everybody wanna be my enemy.... */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (((hitbox & HIT_COLLISION) && status_invin == INVIN_BUFF) || (hitbox & HIT_ATTACK))
{
    if (reaction_inst.class == ENE_BASIC)
    {
        if (y > reaction_inst.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }
        else if (y < reaction_inst.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    if (reaction_inst.class == ENE_SUPER && reaction_inst.invin_alarm == 0)
    {
        x_speed *= -0.5;
        y_speed *= -0.5;

        reaction_inst.vitality -= 1;
        reaction_inst.invin_alarm = 32;
    }

    if (reaction_inst.class == ENE_BASIC || (reaction_inst.class == ENE_SUPER && (reaction_inst.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        sonic_routine_homing();
        stage_add_score(100 + (400 * reaction_inst.class));
        audio_play_sfx("snd_destroy", true);

        with (reaction_inst)
        {
            effect_create(x, y, sequence_explosion_enemy, -depth);
            instance_destroy();
        }
    }
}
else if ((hitbox & HIT_HURT) && (reaction_inst.attackbox_element == ELEM_NONE || (reaction_inst.attackbox_element > ELEM_NONE && status_shield != reaction_inst.attackbox_element + SHIELD_BUBBLE))) player_set_damage(reaction_inst);
