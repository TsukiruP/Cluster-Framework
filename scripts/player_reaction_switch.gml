/// player_reaction_switch(obj, hitbox)
/* Wow wow wow (Fourze!) Wow wow wow (Ikou ze!) */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_ATTACK)
{
    if (!input_cpu)
    {
        if (!reaction_handle.active)
        {
            with (reaction_handle)
            {
                active = true;
                target_time = game_get_time() + duration;
            }
        }
    }
}
