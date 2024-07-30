/// player_handle_checkpoint()
//

var checkpoint_handle;

// Nearest checkpoint:
checkpoint_handle = instance_nearest(x, y, obj_checkpoint);

// Exit if there's no nearest handle:
if (checkpoint_handle == noone) {
    exit;
}

// Activate checkpoint:
if (player_collision_prop(checkpoint_handle, SIDE_MAIN) != 0) {
    if (input_cpu == false) {
        if (global.checkpoint_x != checkpoint_handle.x && global.checkpoint_y != checkpoint_handle.y && checkpoint_handle.checkpoint_active == false) {
            // Set active:
            with (checkpoint_handle) {
                checkpoint_active = true;
                checkpoint_set();
            }
            
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
            
            // Play sound:
            sound_play_single("snd_checkpoint");
        }
    }
}
