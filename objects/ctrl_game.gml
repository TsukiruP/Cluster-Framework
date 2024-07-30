#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Global Timers

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

// Stage timer:
if (global.time_allow == true && !game_ispaused(ctrl_text)) {
    global.game_time += global.game_speed;
}

// Object timer:
global.object_time += global.game_speed;

// Floor timers:
if (global.game_speed == 1) {
    global.game_time   = floor(global.game_time);
    global.object_time = floor(global.object_time);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause

// Exit if there's no player 1:
if (!instance_exists(instance_player(0))) {
    exit;
}

if (!game_ispaused(ctrl_text) && global.pause_allow == true && !instance_exists(ctrl_pause) && input_get_check(INP_START, CHECK_PRESSED)) {
    var pause_fade;

    pause_fade = fade_create(0.06, 0.6, depth);

    with (instance_create(0, 0, ctrl_pause)) {
        fade_handle = pause_fade;
    }
}
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
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Game

global.game_speed  = 1;
global.game_time   = 0;
global.object_time = 0;
global.game_rings  = 0;
global.game_score  = 0;

global.pause_allow = true;
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
