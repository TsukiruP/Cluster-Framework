/// player_reaction_item_box(obj, hitbox)
/* Get equipped with.... ring?! */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if ((hitbox & HIT_COLLISION) || (hitbox & HIT_ATTACK))
{
    if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
    {
        sonic_routine_homing();
        player_get_item(reaction_inst, reaction_inst.item_index);
        audio_play_sfx("snd_destroy", true);

        with (reaction_inst)
        {
            effect_create(x, y, sequence_explosion_small, -depth);
            instance_destroy();
        }
    }
}
