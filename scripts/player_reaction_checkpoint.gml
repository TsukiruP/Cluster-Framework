/// player_reaction_checkpoint(obj, collision)
// Never made up a "joke" for this.

var checkpoint_handle, collision;

// Initialize:
checkpoint_handle = argument0;
collision         = argument1;

// Activate checkpoint:
if (collision & COLL_HURT_RADIUS) {
    if (global.checkpoint_x != checkpoint_handle.x && global.checkpoint_y != checkpoint_handle.y && checkpoint_handle.checkpoint_active == false) {
        // Bonuses:
        if (global.gameplay_checkpoint == true) {
            if (global.game_rings >= 20) {
                var checkpoint_tier;

                checkpoint_tier = global.game_rings div 20;

                switch (checkpoint_tier) {
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
                        if (status_shield == SHIELD_NONE) {
                            player_get_item(choose(ITEM_BASIC, ITEM_MAGNETIC));
                        }
                }
            }
        }

        // Activate:
        with (checkpoint_handle) {
            checkpoint_active = true;
            checkpoint_set();
        }

        // Play sound:
        sound_play_single("snd_checkpoint");
    }
}
