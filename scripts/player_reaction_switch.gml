/// player_reaction_switch(obj, hitbox)
/* Wow wow wow (Fourze!) Wow wow wow (Ikou ze!) */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (hitbox & HIT_ATTACK)
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
