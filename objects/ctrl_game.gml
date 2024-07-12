#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Menu

// Don't bother if there's no player:
if (!player_exists(0)) {
    exit;
}

if (!game_is_paused(ctrl_text) && global.pause_allow == true && !instance_exists(ctrl_pause) && input_get_check(INP_START, CHECK_PRESSED)) {
    var pause_fade;

    pause_fade = fade_create(0.06, 0.6, depth);

    with(instance_create(0, 0, ctrl_pause)) {
        fade_handle = pause_fade;
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Global Timers

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

// Stage timer:
if (global.time_allow == true && !game_is_paused(ctrl_text)) {
    global.game_time += global.object_ratio;
}

// Object timer
global.object_time += global.object_ratio;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// (De)activate Instances

if (instance_exists(ctrl_camera)) {
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
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Game Variables

global.game_time    = 0;
global.game_rings   = 0;
global.game_score   = 0;

global.object_time  = 0;
global.object_ratio = 1;

global.pause_allow  = true;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Animations

if (global.animation_grid != -1) {
    global.animation_initialized = false;
    ds_grid_destroy(global.animation_grid);
    global.animation_grid = -1;
}
