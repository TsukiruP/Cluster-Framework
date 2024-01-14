#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stage Initialization

global.stage_rings  = 0;
global.stage_score  = 0;
global.stage_time   = 0;
global.object_time  = 0;
global.object_ratio = 1;
global.add_time     = false;
culling             = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

if (instance_exists(obj_player_spawn)) {
    // Spawn players:
    with (obj_player_spawn) {
        // Spawn player 1:
        global.player_instance[0]                = instance_create(x, y, obj_player);
        global.player_instance[0].character_data = global.player_data[0];
        global.player_instance[0].input_lock   = true;

        // Create camera:
        with (global.player_instance[0]) {
            camera              = instance_create(x, y, ctrl_camera);
            camera.focus_handle = global.player_instance[0];
        }

        // Spawn player 2:
        if (global.player_data[1] != -1) {
            global.player_instance[1]                = instance_create(x - 30, y, obj_player);
            global.player_instance[1].character_data = global.player_data[1];
            global.player_instance[1].input_cpu    = true;
        }

        // Create partner queues:
        with (ctrl_input) event_user(0);

        // Compile animations:
        if (global.animation_grid == -1) player_compile_animations();

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
if (global.add_time == true) {
    global.stage_time += (1000 / 60) * global.object_ratio;
}

// Object timer
global.object_time += (1000 / 60) * global.object_ratio;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// (De)activate Instances

if (culling == true) {
    // Deactivate everything:
    instance_deactivate_all(true);

    // Activate GM 8.2 core:
    instance_activate_object(gm82core_object);

    // Activate indestructable objects:
    instance_activate_object(par_indestructable);
    instance_activate_object(obj_ring_magnetized);

    // Activate region around view:
    instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);

    // Activate region around players:
    with (obj_player) {
        if (!in_view()) instance_activate_region(x - 64, y - 64, 128, 128, true);
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Animations

global.animation_initialized = false;
ds_grid_destroy(global.animation_grid);
global.animation_grid = -1;
