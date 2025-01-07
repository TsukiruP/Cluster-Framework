/// player_reaction_enemy(obj, collision)
// Everybody wanna be my enemy....

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Player advantage:
if ((collision & COLL_INTERACT && status_invin == INVIN_BUFF) || (collision & COLL_HIT && status_invin == INVIN_BUFF))
{
    // Basic react:
    if (reaction_handle.class == ENE_BASIC)
    {
        // Subtract:
        if (y > reaction_handle.y || sign(y_speed) == -1)
        {
            y_speed -= 1;
        }

        // Rebound:
        else if (y < reaction_handle.y && sign(y_speed) == 1)
        {
            y_speed *= -1;
            jump_cap = true;
        }
    }

    // Super react:
    if (reaction_handle.class == ENE_SUPER && reaction_handle.invin_alarm == 0)
    {
        // Set speed:
        x_speed *= -0.5;
        y_speed *= -0.5;

        // Decrease health:
        reaction_handle.vitality -= 1;
        reaction_handle.invin_alarm = 32;
    }

    // Score:
    if (reaction_handle.class == ENE_BASIC || (reaction_handle.class == ENE_SUPER && (reaction_handle.vitality == 0 || status_invin == INVIN_BUFF)))
    {
        stage_add_score(100 + (400 * reaction_handle.class));

        // Homing:
        sonic_routine_homing();

        // Play sound:
        audio_play_sfx("snd_destroy", true);

        // Destroy:
        with (reaction_handle)
        {
            // Create explosion:
            effect_create(ctl_explosion_enemy, x, y, -depth);

            // Destroy:
            instance_destroy();
        }
    }
}

// Enemy advantage:
else if (collision & COLL_HURT && (reaction_handle.hitbox_element == 0 || (status_shield - SHIELD_BUBBLE != reaction_handle.hitbox_element)))
{
    player_set_damage(reaction_handle);
}
