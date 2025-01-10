/// player_reaction_checkpoint(obj, collision)
/* Never made up a "joke" for this. */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    if (input_cpu == false)
    {
        if (game_get_checkpoint_x() != reaction_handle.x && game_get_checkpoint_y() != reaction_handle.y && reaction_handle.active == false)
        {
            if (game_get_config("gameplay_bonuses") && stage_get_rings() >= 20)
            {
                var item_tier, item_id;

                item_tier = stage_get_rings() div 20;

                item_id = -1;

                switch (item_tier)
                {
                    case 1:
                        item_id = ITEM_BONUS;
                        break;

                    case 2:
                        item_id = ITEM_SUPER_BONUS;
                        break;

                    case 3:
                        item_id = ITEM_RANDOM_BONUS;
                        break;

                    case 4:
                        item_id = ITEM_SPEED;
                        break;

                    default:
                        if (status_shield == SHIELD_NONE)
                        {
                            item_id = choose(ITEM_BASIC, ITEM_MAGNETIC);
                        }
                }

                player_get_item(reaction_handle, item_id);
            }

            audio_play_sfx("snd_checkpoint", true);

            with (reaction_handle)
            {
                active = true;
                game_set_checkpoint();
            }
        }
    }
}
