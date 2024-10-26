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
        if (global.checkpoint_x != reaction_handle.x && global.checkpoint_y != reaction_handle.y && reaction_handle.active == false)
        {
            // Bonuses:
            if (global.gameplay_checkpoint == true)
            {
                if (global.game_rings >= 20)
                {
                    var checkpoint_tier;

                    checkpoint_tier = global.game_rings div 20;

                    switch (checkpoint_tier)
                    {
                        // Ring bonus:
                        case 1:
                            player_get_item(ITEM_BONUS);
                            break;

                        // Super ring bonus:
                        case 2:
                            player_get_item(ITEM_SUPER_BONUS);
                            break;

                        // Random ring bonus:
                        case 3:
                            player_get_item(ITEM_RANDOM_BONUS);
                            break;

                        // Speed up:
                        case 4:
                            player_get_item(ITEM_SPEED);
                            break;

                        // Shield:
                        default:
                            if (status_shield == SHIELD_NONE)
                            {
                                player_get_item(choose(ITEM_BASIC, ITEM_MAGNETIC));
                            }
                    }
                }
            }

            // Activate:
            with (reaction_handle)
            {
                active = true;
                checkpoint_set();
            }

            // Play sfx:
            sfx_play("snd_checkpoint", true);
        }
    }
}
