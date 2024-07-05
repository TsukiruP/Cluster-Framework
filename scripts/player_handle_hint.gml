/// player_handle_hint()
// Press the jump button to jump!

var hint_handle;

// Nearest hint:
hint_handle = instance_nearest(x, y, par_hint);

if (hint_handle == noone) exit;

// Interact:
if (ground == true && input_cpu == false && player_collision_prop(hint_handle, SIDE_MAIN) != 0) {
    // Set hint's player handle:
    hint_handle.player_handle = self.id;
    
    if (hint_wanted == false) {
        // Call hint:
        if (floor(g_speed) == 0 && input_player[INP_UP, CHECK_PRESSED]) {
            with (hint_handle) {
                player_handle = other.id;
            }
            
            // Set speed:
            g_speed = 0;
            
            // Set hint:
            hint_wanted  = true;
            
            // Set action:
            player_set_action(player_action_idle);
            
            switch (hint_handle.object_index) {
                // Hint Box:
                case obj_hint_box:
                    player_set_animation("look");
                    break;
                
                // Omochao:
                case obj_omochao:
                    player_set_animation("omochao");
                    break;
            }
        }
    } else {
        if (!game_paused(ctrl_text) && animation_current == "stand") hint_wanted = false;
    }
} else {
    hint_handle.player_handle = noone;
}
