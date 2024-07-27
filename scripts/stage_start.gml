/// stage_start()
// Sets up everything for a stage to start.

// Player input lock:
if (instance_exists(instance_player(0))) {
    with (instance_player(0)) {
        if (input_lock != false) input_lock = false;
    }
}

// Allow time:
global.time_allow = true;

// Show HUD:
if (instance_exists(ctrl_hud)) {
    ctrl_hud.hud_hide = false;
}
