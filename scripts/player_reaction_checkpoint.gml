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
        if (game_checkpoint_get_x() != reaction_handle.x && game_checkpoint_get_y() != reaction_handle.y && reaction_handle.active == false)
        {
            // Bonuses:
            if (game_setting_get("gameplay_checkpoint"))
            {
                if (stage_get_rings() >= 20)
                {
                    var checkpoint_tier;

                    checkpoint_tier = stage_get_rings() div 20;

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

            // Play sfx:
            sfx_play("snd_checkpoint", true);

            // Activate:
            with (reaction_handle)
            {
                active = true;
                game_checkpoint_set();
            }
        }
    }
}
