/// player_reaction_switch(obj, hitbox, side)
/* Wow wow wow (Fourze!) Wow wow wow (Ikou ze!) */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;
side = argument2;

if ((hitbox & HIT_ATTACK) || ((hitbox & HIT_SOLID) && side == reaction_id.angle))
{
    if (!input_cpu)
    {
        if (!reaction_id.active)
        {
            with (reaction_id)
            {
                active = true;
                target_time = game_get_time() + duration;
            }
        }
    }
}
