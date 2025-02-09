/// player_reaction_bullet(obj, hitbox)
/* The elevation increases as the bullet is fired. */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (!reaction_id.reflect)
{
    if (((hitbox & HIT_CLASH) && status_insta_alarm) || ((hitbox & HIT_HURT) && status_shield >= SHIELD_BUBBLE))
    {
        with (reaction_id)
        {
            x_speed *= -2;
            y_speed *= -2;
            reflect = true;
        }
    }
    else if ((hitbox & HIT_HURT) && (reaction_id.attackbox_element == ELEM_NONE || (reaction_id.attackbox_element > ELEM_NONE && status_shield != reaction_id.attackbox_element + SHIELD_BUBBLE))) player_set_damage(reaction_id);
}
