#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Player

// Create player 1:
global.player_instance[0]                = instance_create(x, y, obj_player);
global.player_instance[0].character_data = global.player_data[0];
global.player_instance[0].input_lock     = true;

with (global.player_instance[0]) {
    // Create camera:
    camera              = instance_create(x, y, ctrl_camera);
    camera.focus_handle = global.player_instance[0];

    // Create HUD:
    if (!instance_exists(ctrl_hud)) instance_create(0, 0, ctrl_hud);
}

// Create player 2:
if (global.player_data[1] != -1) {
    global.player_instance[1]                = instance_create(x - 30, y, obj_player);
    global.player_instance[1].character_data = global.player_data[1];
    global.player_instance[1].input_cpu      = true;
}

// Create partner queues:
with (ctrl_input) event_user(0);

// Compile animations:
if (global.animation_grid == -1) player_compile_animations();

instance_destroy();
