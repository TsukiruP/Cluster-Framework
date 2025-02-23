/// player_reaction_checkpoint(obj, hitbox)
/* Never made up a "joke" for this. */

var reaction_inst, hitbox;

reaction_inst = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (!input_cpu)
    {
        if (game_get_checkpoint_x() != reaction_inst.x && game_get_checkpoint_y() != reaction_inst.y && !reaction_inst.active)
        {
            if (game_get_config("gameplay_bonuses") && stage_get_rings() >= 20)
            {
                var item_index;

                item_index = -1;

                switch (stage_get_rings() div 20)
                {
                    case 1:
                        item_index = ITEM_BONUS;
                        break;

                    case 2:
                        item_index = ITEM_SUPER_BONUS;
                        break;

                    case 3:
                        item_index = ITEM_RANDOM_BONUS;
                        break;

                    case 4:
                        item_index = ITEM_SPEED;
                        break;

                    default:
                        if (status_shield == SHIELD_NONE) item_index = choose(ITEM_BASIC, ITEM_MAGNETIC);
                }

                player_get_item(reaction_inst, item_index);
            }

            audio_play_sfx("snd_checkpoint", true);

            with (reaction_inst)
            {
                active = true;
                game_set_checkpoint();
            }
        }
    }
}
