#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stage Initialization

global.stage_rings = 0;
global.stage_score = 0;
global.stage_time  = 0;
global.object_time = 0;
global.add_time    = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

if(instance_exists(obj_player_spawn)) {
    // Spawn players:
    with(obj_player_spawn) {
        // Spawn player 1:
        global.player_instance[0]                = instance_create(x, y, obj_player);
        global.player_instance[0].character_data = global.player_data[0];
        global.player_instance[0].control_lock   = true;

        // Create camera:
        with(global.player_instance[0]) {
            camera              = instance_create(x, y, ctrl_camera);
            camera.focus_handle = global.player_instance[0];
        }

        // Spawn player 2:
        if(global.player_data[1] != -1) {
            global.player_instance[1]                = instance_create(x - 30, y, obj_player);
            global.player_instance[1].character_data = global.player_data[1];
            global.player_instance[1].control_cpu    = true;
        }

        // Create partner queues:
        with(ctrl_input) event_user(0);

        player_compile_animations();

        instance_destroy();
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Menu
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Global Timers

// Stage timer:
if(global.add_time == true) {
    global.stage_time += 1000 / 60;
}

// Object timer
global.object_time += 1000 / 60;
