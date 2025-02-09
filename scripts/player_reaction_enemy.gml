/// player_reaction_enemy(obj, hitbox)
/* Everybody wanna be my enemy.... */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (((hitbox & HIT_COLLISION) && status_invin == INVIN_BUFF) || (hitbox & HIT_ATTACK))
{
    if (reaction_id.class == ENE_BASIC)
    {
        if (y > reaction_id.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }
        else if (y < reaction_id.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    if (reaction_id.class == ENE_SUPER && reaction_id.invin_alarm == 0)
    {
        x_speed *= -0.5;
        y_speed *= -0.5;

        reaction_id.vitality -= 1;
        reaction_id.invin_alarm = 32;
    }

    if (reaction_id.class == ENE_BASIC || (reaction_id.class == ENE_SUPER && (reaction_id.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        sonic_routine_homing();
        stage_add_score(100 + (400 * reaction_id.class));
        audio_play_sfx("snd_destroy", true);

        with (reaction_id)
        {
            effect_create(x, y, sequence_explosion_enemy, -depth);
            instance_destroy();
        }
    }
}
else if ((hitbox & HIT_HURT) && (reaction_id.attackbox_element == ELEM_NONE || (reaction_id.attackbox_element > ELEM_NONE && status_shield != reaction_id.attackbox_element + SHIELD_BUBBLE))) player_set_damage(reaction_id);
