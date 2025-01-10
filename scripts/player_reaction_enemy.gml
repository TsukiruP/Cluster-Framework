/// player_reaction_enemy(obj, collision)
/* Everybody wanna be my enemy.... */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if ((collision & COLL_INTERACT && status_invin == INVIN_BUFF) || (collision & COLL_HIT && status_invin == INVIN_BUFF))
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
        stage_add_score(100 + (400 * reaction_handle.class));
        sonic_routine_homing();
        audio_play_sfx("snd_destroy", true);

        with (reaction_handle)
        {
            effect_create(ctl_explosion_enemy, x, y, -depth);
            instance_destroy();
        }
    }
}

else if (collision & COLL_HURT && (reaction_handle.hitbox_element == 0 || (status_shield - SHIELD_BUBBLE != reaction_handle.hitbox_element)))
{
    player_set_damage(reaction_handle);
}
