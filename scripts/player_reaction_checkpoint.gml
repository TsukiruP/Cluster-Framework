/// player_reaction_checkpoint(obj, collision)
// Never made up a "joke" for this.

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Activate checkpoint:
if (collision & COLL_HURT_RADIUS)
{
    if (input_cpu == false)
    {
        if (game_get_checkpoint_x() != reaction_handle.x && game_get_checkpoint_y() != reaction_handle.y && reaction_handle.active == false)
        {
            // Bonuses:
            if (game_get_config("gameplay_bonuses") && stage_get_rings() >= 20)
            {
                var item_tier, item_id;

                // Item tier:
                item_tier = stage_get_rings() div 20;

                // Item ID:
                item_id = -1;

                switch (item_tier)
                {
                    // Ring bonus:
                    case 1:
                        item_id = ITEM_BONUS;
                        break;

                    // Super ring bonus:
                    case 2:
                        item_id = ITEM_SUPER_BONUS;
                        break;

                    // Random ring bonus:
                    case 3:
                        item_id = ITEM_RANDOM_BONUS;
                        break;

                    // Speed up:
                    case 4:
                        item_id = ITEM_SPEED;
                        break;

                    // Shield:
                    default:
                        if (status_shield == SHIELD_NONE)
                        {
                            item_id = choose(ITEM_BASIC, ITEM_MAGNETIC);
                        }
                }


                // Get item:
                player_get_item(reaction_handle, item_id);
            }

            // Play sound:
            audio_play_sfx("snd_checkpoint", true);

            // Activate:
            with (reaction_handle)
            {
                active = true;
                game_set_checkpoint();
            }
        }
    }
}
