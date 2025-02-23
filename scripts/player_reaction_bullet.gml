/// player_reaction_bullet(obj, hitbox)
/* The elevation increases as the bullet is fired. */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (!reaction_inst.reflect)
{
    if (((hitbox & HIT_CLASH) && status_insta_alarm) || ((hitbox & HIT_HURT) && status_shield >= SHIELD_BUBBLE))
    {
        with (reaction_inst)
        {
            var bullet_angle;

            bullet_angle = point_direction(x, y, other.x, other.y);

            x_speed = -10 * dcos(bullet_angle);
            y_speed = -10 * -dsin(bullet_angle);
            reflect = true;
        }
    }
    else if ((hitbox & HIT_HURT) && (reaction_inst.attackbox_element == ELEM_NONE || (reaction_inst.attackbox_element > ELEM_NONE && status_shield != reaction_inst.attackbox_element + SHIELD_BUBBLE))) player_set_damage(reaction_inst);
}
