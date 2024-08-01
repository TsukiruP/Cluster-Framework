#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Player

// Move to checkpoint:
if (checkpoint_isset()) {
    x = global.checkpoint_x;
    y = global.checkpoint_y - 20;
}

// Create players:
for (i = 0; i < global.player_count; i += 1) {
    if (global.player_id[i] >= CHAR_SONIC) {
        global.player_instance[i]              = instance_create(x - (30 * i), y, obj_player);
        global.player_instance[i].player_slot  = i;
        global.player_instance[i].character_id = global.player_id[i];
        global.player_instance.input_lock      = true;

        // Create HUD:
        if (i == 0) {
            // Create camera:
            camera              = instance_create(x, y, ctrl_camera);
            camera.focus_handle = global.player_instance[0];

            // Create HUD:
            instance_create(0, 0, ctrl_hud);
        } else if (i > 0) {
            global.player_instance[i].input_cpu = true;
        }
    }
}

// Create partner queues:
with (ctrl_input) {
    event_user(0);
}

// Compile animations:
if (global.animation_grid == -1) {
    player_compile_animations();
}

// Destroy:
instance_destroy();
