/// player_reaction_enemy(obj, interaction)
/* Everybody wanna be my enemy.... */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if ((interaction & INTERACT_MUTUAL && status_invin == INVIN_BUFF) || interaction & INTERACT_HIT)
{
    if (reaction_handle.class == ENE_BASIC)
    {
        if (y > reaction_handle.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }
        else if (y < reaction_handle.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    if (reaction_handle.class == ENE_SUPER && reaction_handle.invin_alarm == 0)
    {
        x_speed *= -0.5;
        y_speed *= -0.5;

        reaction_handle.vitality -= 1;
        reaction_handle.invin_alarm = 32;
    }

    if (reaction_handle.class == ENE_BASIC || (reaction_handle.class == ENE_SUPER && (reaction_handle.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        sonic_routine_homing();
        stage_add_score(100 + (400 * reaction_handle.class));
        audio_play_sfx("snd_destroy", true);

        with (reaction_handle)
        {
            effect_create(x, y, sequence_explosion_enemy, -depth);
            instance_destroy();
        }
    }
}
else if (interaction & INTERACT_HURT && (reaction_handle.hitbox_element == ELEM_NONE || (status_shield - SHIELD_BUBBLE != reaction_handle.hitbox_element)))
{
    player_set_damage(reaction_handle);
}
